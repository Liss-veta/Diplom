<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Master_tags extends Model
{
    use HasFactory;

    protected $fillable = [
        'id_master', 'id_tag'
    ];
}
