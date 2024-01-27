<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use \DateTimeInterface;

class UnitMeasurements extends Model
{
    use SoftDeletes;

    public $table = 'unit_measurements';

    protected $dates = [
        'created_at',
        'deleted_at',
    ];

    protected $fillable = ['unit','status','created_by','created_at','deleted_at'];

    protected function serializeDate(DateTimeInterface $date)
    {
        return $date->format('Y-m-d H:i:s');
    }
}
