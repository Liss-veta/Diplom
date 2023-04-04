<?php

namespace App\Http\Controllers;

use App\Models\Application;
use Illuminate\Http\Request;

class ApplicationController extends Controller
{
    public function create(Request $request){

        $data = $request ->validate([
            'email' => 'email|required|string',
            'number' => 'required|integer',
            'text' => 'required|string',
            'id_master' => 'required',
            'id_user' => 'required',
        ]);
        Application::create([
            'id_master'=>$request['id_master'],
            'id_user'=>$request['id_user'],
            'text' => $request['text'],
            'number' => $request['number'],
        ]);
        return response([
            'message' => 'Заявка успешно оформлена! Ожидайте изменение статуса'
        ]);

    }
}
