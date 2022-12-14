<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Announce extends Model
{
    use HasFactory;

    public function user()
    {
        return $this->belongsTo(User::class, 'id');
    }

    public function like()
    {
        return $this->hasMany(Like::class, 'idAnnounce');
    }

    public function payment()
    {
        return $this->hasOne(Payment::class, 'id');
    }
    public function categorie_announces()
    {
        return $this->belongsToMany(Categorie::class);
    }

    public static function isAnnounceMine(int $idUserAnnounce){
        return  Auth::id() === $idUserAnnounce;
    }

    protected $fillable = [
        'title',
        'slug',
        'stripe_announce',
        'price',
        'description',
        'inventory',
        'nbSales'
    ];

    // public function getRouteKeyName()
    // {
    //     return 'slug';
    // }
}
