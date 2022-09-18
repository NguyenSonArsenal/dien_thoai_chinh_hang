<?php

namespace App\Models;

class Order extends BaseModel
{
    protected $table = 'order';

    protected $fillable = [
        'user_id', 'total_money', 'address', 'phone', 'status', 'name'
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function orderDetails()
    {
        return $this->hasMany(OrderDetail::class, 'order_id', 'id');
    }
}
