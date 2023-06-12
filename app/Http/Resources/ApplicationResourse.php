<?php

namespace App\Http\Resources;

use App\Models\Master;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ApplicationResourse extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request)
    {
        return [
            'id' => $this->id,
            'id_master' => Master::find($this->id_master),
            'id_user' => User::find($this->id_user),
            'text' => $this->text,
            'number' => $this->number,
            'status' => $this->status,
            'comm_master' => $this->comm_master,
            'comm_user' => $this->comm_user,
        ];
    }
}
