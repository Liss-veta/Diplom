<?php

namespace App\Http\Controllers;

use App\Http\Resources\PostResource;
use App\Models\Master;
use App\Models\Post;
use App\Models\Post_image;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index($id)
    {
        $master = Master::findOrFail($id);
        $posts = PostResource::collection(Post::all()->where('id_master', $master->id));
        return $posts;
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $request)
    {
        $id_user = Auth::user()->id;
        $master = Master::where('id_user', $id_user)->first();
        $post = new Post();
        $post->id_master = $master->id;
        $post->description = $request->text;
        $images = $request->file('image');
        $post->save();

        foreach($images as $image){
            $path = 'storage/';
            $path .= Storage::disk('public')->put('posts_img', $image);
            $path = url($path);
            Post_image::create([
                'id_post' => $post->id,
                'image' => $path
            ]);
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show()
    {
        $posts = Post::orderBy('created_at', 'desc')->limit(5)->get();
        return PostResource::collection($posts);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    public function updateImage($id, Request $request) {
        $image = $request['image'];
        $path = null;
        if ($image) {
            $path = 'storage/';
            $path .= Storage::disk('public')->put('posts_img', $image);
            $path = url($path);
        }
        $stroke = Post_image::where('id', $id)->update([
            'image' => $path
        ]);
        return response([
            'message' => 'Успешно изменено',
            'content' => $stroke
        ], 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function delete($id)
    {
        Post::where('id', $id)->delete();
        Post_image::where('id_post', $id)->delete();
        return response([
            'message' => 'Пост успешно удален'
        ]);
    }
}
