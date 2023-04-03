<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;

    protected $guarded;

    public function users()
    {
        return $this->belongsTo(Master::class, 'id_master');
    }

    public function images(){
        return $this->hasMany(Post_image::class);
    }
}
