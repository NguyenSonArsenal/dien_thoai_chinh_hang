<?php

namespace App\Models;

class OrderDetail extends BaseModel
{
    protected $table = 'order_detail';

    protected $fillable = [
        'order_id', 'product_id', 'product_name', 'product_price_origin',
        'product_price_sell', 'product_sale', 'product_sort_describe', 'product_avatar'
    ];

    public function order()
    {
        return $this->belongsTo(Order::class, 'order_id', 'id');
    }

    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id', 'id');
    }
}
