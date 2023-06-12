<?php

namespace App\Http\Resources;

use App\Models\Tags;
use Illuminate\Http\Request;
use App\Http\Resources\TagsResource;
use Illuminate\Http\Resources\Json\JsonResource;

class MasterTagsResource extends JsonResource
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
            'id_master' => $this->id_master,
            'id_tag' => Tags::find($this->id_tag)
            // 'id_tag' => TagsResource::collection(Tags::find($this->id_tag))
            
        ];
    }
}
