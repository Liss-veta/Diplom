<?php

namespace App\Http\Controllers;

use App\Http\Resources\LikesMasterResource;
use App\Models\Likes_master;
use Illuminate\Http\JsonResponse;

class LikesMasterController extends Controller
{
    public function create($id):JsonResponse
    {
        $check = Likes_master::where('id_user', auth()->user()->id)->where('id_master', $id)->first();
        if($check) {
            $check->delete();
            return response()->json([
                'status' => 201,
                'message' => 'Удалено из избранного!'
            ]);
        }
        Likes_master::create([
            'id_master' => $id,
            'id_user' => auth()->user()->id,
        ]);
        return response()->json([
            'status' => 200,
            'message' => 'Добавлено в избранное!'
        ], 200);
    }

    public function show($id):JsonResponse
    {
        $check = Likes_master::where('id_user', auth()->user()->id)->where('id_master', $id)->first();
        if(!$check) {
            return response()->json([
                'status' => 201,
                'message' => 'Не находится в избранном'
            ], 201);
        }
        return response()->json([
            'status' => 200,
            'message' => 'Добавлено в избранное'
        ]);
    }

    public function showUser(){
        return response()->json([
            'content' => LikesMasterResource::collection(Likes_master::all()->where('id_user', auth()->user()->id)),
        ]);
    }
}
