<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Master extends Model
{
    use HasFactory;

    protected $fillable = [
        'id_user', 'name', 'surname', 'age', 'city', 'staj', 'clients_count', 'min_cena', 'description', 'admin_status', 'privilege', 'avatar'
    ];

    public function sovets() {
        return $this->hasMany(Sovet::class);
    }
}
