<?php

namespace App\Http\Controllers;

use App\Http\Resources\SovetResource;
use App\Models\Master;
use App\Models\User;
use Illuminate\Http\Request;
use App\Models\Sovet;
use App\Models\Sovet_image;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class SovetController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index($id)
    {
        $master = Master::findOrFail($id);
        $sovet = SovetResource::collection(Sovet::all()->where('id_master', $master->id));
        return $sovet;
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $request)
    {
        $id_user = Auth::user()->id;
        $master = Master::where('id_user', $id_user)->first();
        $sovet = new Sovet();
        $sovet->id_master = $master->id;
        $sovet->description = $request->text_sovet;
        $sovet->privilege = 0;
        $images = $request->file('image');
        $sovet->save();

        foreach($images as $image){
            $path = 'storage/';
            $path .= Storage::disk('public')->put('sovets_img', $image);
            $path = url($path);
            Sovet_image::create([
                'id_sovet' => $sovet->id,
                'image' => $path
            ]);
        }
        return response([
            'message' => 'Совет успешно добавлен'
        ]);
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
        return response ([
            'content' => SovetResource::collection(Sovet::all()->where('privilege', '1'))
        ]);
    }

    public function showAdmin()
    {
        return response ([
            'content' => SovetResource::collection(Sovet::all()->where('privilege', '!=', '1'))
        ]);
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
    public function updatePrivilege(Request $request, string $id)
    {
        Sovet::find($id)->update([
            'privilege' => $request->stat
        ]);
        if($request->stat == '1'){
            return response ([
                'message' => 'Успешно добавлено'
            ]);
        }
        if($request->stat == '2'){
            return response ([
                'message' => 'Успешно отклонено'
            ]);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function delete($id)
    {
        Sovet::find($id)->delete();
        Sovet_image::where('id_sovet', $id)->delete();
        return response([
            'message' => 'Совет успешно удален'
        ]);
    }
}
