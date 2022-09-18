<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Admin extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    use SoftDeletes;

    protected $table = 'admin';

    protected $fillable = [
        'name',
        'email',
        'password',
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
