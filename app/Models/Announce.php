<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Announce extends Model
{
    use HasFactory;

    public function user()
    {
        return $this->belongsTo(User::class, 'id');
    }
    public function payment()
    {
        return $this->hasOne(Payment::class, 'id');
    }
    public function categorie_announces()
    {
        return $this->belongsToMany(Categorie::class);
    }
}
