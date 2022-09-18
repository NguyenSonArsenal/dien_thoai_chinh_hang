<?php

namespace App\Models;

use Illuminate\Database\Eloquent\SoftDeletes;

class Branch extends BaseModel
{
    protected $table = 'branch';

    use SoftDeletes;

    protected $fillable = [
        'id', 'name', 'slug', 'avatar'
    ];
}
