<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Sovet;
use App\Models\Post;
use App\Models\Tags;

class Master extends Model
{
    use HasFactory;

    protected $fillable = [
        'id_user', 'name', 'surname', 'age', 'city', 'staj', 'clients_count', 'min_cena', 'description', 'admin_status', 'privilege', 'avatar'
    ];

    public function sovets() {
        return $this->hasMany(Sovet::class);
    }

    public function posts()
    {
        return $this->hasMany(Post::class);
    }

    public function tags()
    {
        return $this->hasMany(Tags::class);
    }
}
