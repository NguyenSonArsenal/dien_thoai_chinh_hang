<?php

namespace App\Models;

class Category extends BaseModel
{
    protected $table = 'category';

    protected $fillable = [
        'name', 'slug', 'parent_id', 'level', 'avatar'
    ];

    public function parent()
    {
        return $this->belongsTo(Category::class, 'parent_id', 'id');
    }

    public function children()
    {
        return $this->hasMany(Category::class, 'parent_id', 'id');
    }
}
