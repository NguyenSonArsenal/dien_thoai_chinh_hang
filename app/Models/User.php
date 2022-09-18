<?php

namespace App\Models;

use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use SoftDeletes;

    protected $table = 'user';

    protected $fillable = [
        'id', 'username', 'email', 'password', 'address', 'phone', 'status', 'ins_date', 'upd_date', 'del_flag'
    ];

    public function tryGet($relation)
    {
        if (empty($this->{$relation})) {
            $instance = $this->$relation()->getRelated();
            $data = array_combine(
                $instance->getFillable(),
                array_fill(0, count($instance->getFillable()), null)
            );
            return $instance->fill($data);
        }
        return $this->{$relation};
    }
}
