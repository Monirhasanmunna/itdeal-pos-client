<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Bank;
use Auth;
use Illuminate\Validation\Rule;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Mail\UserNotification;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\DB;

class BankController extends Controller
{
    public function index()
    {
        $role = Role::find(Auth::user()->role_id);
        
        if($role->hasPermissionTo('customers-index')){
            $permissions = Role::findByName($role->name)->permissions;
            foreach ($permissions as $permission)
                $all_permission[] = $permission->name;
            if(empty($all_permission))
                $all_permission[] = 'dummy text';
            $lims_bank_all = Bank::where('is_active', true)->get();
            return view('backend.bank.index', compact('lims_bank_all', 'all_permission'));
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    public function create()
    {
        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('customers-add')){
            return view('backend.bank.create');
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    public function store(Request $request)
    {
        $request->validate([
           'name' => 'required' ,
           'account_no' => 'required' ,
           'branch' => 'required' ,
        ]);
        DB::beginTransaction();
        try{
            Bank::create([
                'name' => $request->name,    
                'account_no' => $request->account_no,    
                'branch' => $request->branch,    
            ]);
            DB::commit();
        }
        catch (\Exception $e) {
            DB::rollback();
            dd($e->getMessage());
        }
        return redirect('bank')->with('message', 'Bank inserted Successfully');
    }

    public function edit($id)
    {
        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('customers-edit')){
            $bank = Bank::findOrFail($id);
            return view('backend.bank.edit', compact('bank'));
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    public function update(Request $request, $id)
    {
        $request->validate([
           'name' => 'required' ,
           'account_no' => 'required' ,
           'branch' => 'required' ,
        ]);
        DB::beginTransaction();
        try{
            Bank::findOrFail($id)->update([
                'name' => $request->name,    
                'account_no' => $request->account_no,    
                'branch' => $request->branch,    
            ]);
            DB::commit();
        }
        catch (\Exception $e) {
            DB::rollback();
            dd($e->getMessage());
        }
        return redirect('bank')->with('message', 'Bank Updated Successfully');
    }

    public function destroy($id)
    {
        $lims_customer_data = Bank::find($id);
        $lims_customer_data->is_active = false;
        $lims_customer_data->save();
        return redirect('bank')->with('not_permitted','Data deleted Successfully');
    }
}
