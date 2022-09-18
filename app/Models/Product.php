<?php

namespace App\Models;

class Product extends BaseModel
{
    protected $table = 'product';

    protected $fillable = [
        'branch_id', 'category_id', 'name', 'price_origin', 'price_sell', 'sale', 'avatar',
        'sort_describe', 'hot'
    ];

    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id', 'id');
    }

    public function branch()
    {
        return $this->belongsTo(Branch::class);
    }
}












