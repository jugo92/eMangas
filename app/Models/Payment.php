<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    use HasFactory;

    public function announce()
    {
        return $this->belongsTo(Announce::class, 'id');
    }

    protected $fillable = [
        'name',
        'slug',
        'stripe_payment',
        'cost',
        'description'
    ];

    public function getRouteKeyName()
    {
        return 'slug';
    }
}
