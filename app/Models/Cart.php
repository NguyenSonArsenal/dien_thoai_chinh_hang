<?php

namespace App\Models;

class Cart extends BaseModel
{
    protected $table = 'cart';

    protected $fillable = [
        'product_id', 'user_id'
    ];

    public $timestamps = false;

    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id', 'id');
    }
}
