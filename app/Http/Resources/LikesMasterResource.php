<?php

namespace App\Http\Resources;

use App\Models\Master;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class LikesMasterResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'id_master' => Master::find($this->id_master),
            'id_user' => $this->id_user,
        ];
    }
}
