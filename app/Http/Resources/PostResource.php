<?php

namespace App\Http\Resources;

use App\Models\Master;
use App\Models\Post_image;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class PostResource extends JsonResource
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
            'created_at' => $this->created_at,
            'arr_images' => Post_image::where('id_post', $this->id)->get()
        ];
    }
}
