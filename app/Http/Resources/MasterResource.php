<?php

namespace App\Http\Resources;

use App\Models\Master_tags;
use App\Models\Tags;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class MasterResource extends JsonResource
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
            'id_user' => $this->id_user,
            'name' => $this->name,
            'surname' => $this->surname,
            'age' => $this->age,
            'city' => $this->city,
            'staj' => $this->staj,
            'clients_count' => $this->clients_count,
            'min_cena' => $this->min_cena,
            'description' => $this->description,
            'avatar' => $this->avatar,
            'admin_status' => $this->admin_status,
            'privilege' => $this->privilege,
            'tag' => MasterTagsResource::collection(Master_tags::all()->where('id_master', $this->id)),
        ];
    }
}
