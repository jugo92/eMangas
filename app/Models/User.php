<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Database\Eloquent\Model;
use Laravel\Cashier\Billable;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    public function announces()
    {
        return $this->hasMany(Announce::class, 'idUser');
    }

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'firstName',
        'pseudo',
        'phoneNumber',
        'notes',
        'adresse',
        'role'
    ];

    /**
         * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function hasRole(string $role){
        return $this->getAttribute('role') === $role;
    }

    public function anonymize(User $user){
        $randomString = $user->generateRandomString();
        $user->name=$randomString;
        $user->firstName=$randomString;
        $user->pseudo=$randomString;
        $user->email=$randomString;
        $user->password=$randomString;
        $user->phoneNumber=$randomString;
        $user->notes=0;
        $user->adresse=$randomString;
        $user->role='inactive';
        $user->name=$randomString;
        $user->save();
    }

    public function generateRandomString($length = 10) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }
}
