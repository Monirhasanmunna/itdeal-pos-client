<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\CustomerGroup;
use App\Customer;
use App\Deposit;
use App\User;
use App\Owner;
use App\OwnerTransection;
use App\Bank;
use App\CashRegister;
use App\Account;
use Auth;
use Illuminate\Validation\Rule;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Mail\UserNotification;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\DB;

class OwnerController extends Controller
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
            $lims_owner_all = Owner::where('is_active', true)->get();
            return view('backend.owner.index', compact('lims_owner_all', 'all_permission'));
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    public function create()
    {
        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('customers-add')){
            $lims_customer_group_all = CustomerGroup::where('is_active',true)->get();
            return view('backend.owner.create', compact('lims_customer_group_all'));
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    public function store(Request $request)
    {
        $request->validate([
           'name' => 'required' ,
           'phone' => 'required' ,
           'address' => 'required' ,
        ]);
        DB::beginTransaction();
        try{
            Owner::create([
                'name' => $request->name,    
                'phone' => $request->phone,    
                'address' => $request->address,    
            ]);
            DB::commit();
        }
        catch (\Exception $e) {
            DB::rollback();
            dd($e->getMessage());
        }
        return redirect()->route('owner.index')->with('message', 'Owner inserted Successfully');
    }

    public function edit($id)
    {
        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('customers-edit')){
            $owner = Owner::findOrFail($id);
            return view('backend.owner.edit', compact('owner'));
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    public function update(Request $request, $id)
    {
        $request->validate([
           'name' => 'required' ,
           'phone' => 'required' ,
           'address' => 'required' ,
        ]);
        DB::beginTransaction();
        try{
            Owner::findOrFail($id)->update([
                'name' => $request->name,    
                'phone' => $request->phone,    
                'address' => $request->address,    
            ]);
            DB::commit();
        }
        catch (\Exception $e) {
            DB::rollback();
            dd($e->getMessage());
        }
        return redirect('owner')->with('message', 'Owner Updated Successfully');
    }

    public function destroy($id)
    {
        $lims_customer_data = Owner::find($id);
        $lims_customer_data->is_active = false;
        $lims_customer_data->save();
        return redirect('owner')->with('not_permitted','Data deleted Successfully');
    }
    function bank_balance($id){
        return Bank::findOrFail($id)->balance;
    }
    function transection(Request $request){
        $request->validate([
           'type' => 'required' ,
           'amount_type' => 'required' ,
           'amount' => 'required' ,
        ]);
        DB::beginTransaction();
        try{
            if($request->type == 0 && $request->amount_type == 0){
                $bank_id = $request->bank_id;
            }else{
                $bank_id = null;
            }
            OwnerTransection::create([
                'bank_id' => $bank_id,    
                'owner_id' => $request->owner_id,    
                'created_at' => $request->date,    
                'type' => $request->type,    
                'amount_type' => $request->amount_type,    
                'amount' => $request->amount,    
                'note' => $request->note,    
            ]);
            DB::commit();
        }
        catch (\Exception $e) {
            DB::rollback();
            dd($e->getMessage());
        }
        return redirect('owner')->with('message', 'Owner Transection Inserted Successfully');
    }
    function transectionlist($id){
        $data = OwnerTransection::where('owner_id',$id)->get();
        return $data;
    }
}
