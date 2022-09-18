<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BaseModel extends Model
{
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

    public static function getTableName()
    {
        return with(new static)->getTable();
    }
}
