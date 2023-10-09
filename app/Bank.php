<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\OwnerTransection;

class Bank extends Model
{
    protected $guarded =['id'];

    function getBalanceAttribute(){
        $deposit = OwnerTransection::where('amount_type',0)->where('type',0)->where('bank_id',$this->id)->sum('amount');
        $withdraw = OwnerTransection::where('amount_type',0)->where('type',1)->where('bank_id',$this->id)->sum('amount');
        return $deposit - $withdraw;
    }
}
