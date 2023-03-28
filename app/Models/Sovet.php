<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sovet extends Model
{
    use HasFactory;

    protected $fillable = [
        'id_user', 'description', 'privilege'
    ];

    public function master() {
        return $this->belongsTo(Master::class);
    }
}
