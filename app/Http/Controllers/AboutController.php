<?php

namespace App\Http\Controllers;

use App\Models\About;
use App\Models\About_gallery;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class AboutController extends Controller
{
    public function index()
    {
        $slides = About::all();
        return response([
            'message' => 'Успешно получено',
            'content' => $slides
        ]);
    }
    public function indexGallery()
    {
        $slides = About_gallery::all();
        return response([
            'message' => 'Успешно получено',
            'content' => $slides
        ]);
    }
    public function updateImg(Request $request){
        $image = $request['first_image'];
        $path = null;
        if ($image) {
            $path = 'storage/';
            $path .= Storage::disk('public')->put('admin/about', $image);
            $path = url($path);
        }
        $stroke = About::where('id', '1')->update([
            'image' => $path
        ]);
        return response([
            'message' => 'Успешно изменено',
            'content' => $stroke
        ], 200);
    }
    public function updateText(Request $request){
        $description = $request['description'];
        $stroke = About::where('id', '1')->update([
            'description' => $description
        ]);
        return response([
            'message' => 'Успешно изменено',
            'content' => $stroke
        ], 200);
    }
    public function updateGallery(Request $request, $id){
        $image = $request['slider'];
        $path = null;
        if ($image) {
            $path = 'storage/';
            $path .= Storage::disk('public')->put('admin/about/gallery', $image);
            $path = url($path);
        }
        $stroke = About_gallery::where('id', $id)->update([
            'image' => $path
        ]);
        return response([
            'message' => 'Успешно изменено',
            'content' => $stroke
        ], 200);
    }
}
