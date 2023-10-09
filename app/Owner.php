<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Owner extends Model
{
    protected $guarded =['id'];
    
    function getBalanceAttribute(){
        $deposit = OwnerTransection::where('type',0)->where('owner_id',$this->id)->sum('amount');
        $withdraw = OwnerTransection::where('type',1)->where('owner_id',$this->id)->sum('amount');
        return $deposit - $withdraw;
    }

}
