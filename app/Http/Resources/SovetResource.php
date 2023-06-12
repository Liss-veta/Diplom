<?php

namespace App\Http\Resources;

use App\Models\Master;
use App\Models\Sovet_image;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class SovetResource extends JsonResource
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
            'description' => $this->description,
            'privilege' => $this->privilege,
            'created_at' => $this->created_at,
            'arr_images' => Sovet_image::where('id_sovet', $this->id)->get()
        ];
    }
}
