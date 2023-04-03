<?php

namespace App\Http\Controllers;

use App\Models\Slider_1 as MSlider_1;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class Slider_1 extends Controller
{
    public function index()
    {
        $slides = MSlider_1::all();
        return response([
            'message' => 'Успешно получено',
            'content' => $slides
        ]);
    }

    public function update(Request $request, $id)
    {
        $image = $request['slider'];
        $path = null;
        if ($image) {
            $path = 'storage/';
            $path .= Storage::disk('public')->put('admin/slider', $image);
            $path = url($path);
        }
        if (MSlider_1::where('number', $id)->first()) {
            
            $stroke = MSlider_1::where('number', $id)->update([
                'image' => $path
            ]);
            return response([
                'message' => 'Успешно изменено',
                'content' => $stroke
            ], 200);
        } else {
            $new = MSlider_1::create([
                'number' => $id,
                'image' => $path
            ]);
            return response([
                'message' => 'Успешно добавлено',
                'content' => $new
            ], 200);
        }
        return new Exception('Ошибка добавления', 404);
    }
}
