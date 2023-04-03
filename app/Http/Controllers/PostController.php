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
        // $posts = Post::all()->where('id_master', $master->id);
        // return response([
            // 'content' => $posts,
            // 'name' => $master->name,
            // 'surname' => $master->surname,
        // ], 200);
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

        // $images = $request->file('image');
        // if ($images != null) {
        //     $fullPath = '';
        //     foreach($images as $image){
        //         $path = Storage::disk('local')->putFile('public/posts_img', $image) .',';
        //         $fullPath .= Storage::url($path);
        //     }
        //     $post->images = $fullPath;
        // } else{
        //     $post->images = 'NULL';
        // }
        $post->save();

        foreach($images as $image){
            $path = Storage::disk('public')->put('posts_img', $image);
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
    public function show(string $id)
    {
        //
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

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
