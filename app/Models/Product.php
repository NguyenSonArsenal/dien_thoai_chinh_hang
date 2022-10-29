<?php

namespace App\Models;

class Product extends BaseModel
{
    protected $table = 'product';

    protected $fillable = [
        'category_id', 'name', 'price_origin', 'price_sell', 'sale', 'avatar', 'amount',
        'sort_describe', 'hot'
    ];

    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id', 'id');
    }
}












