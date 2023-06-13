<?php

namespace App\Http\Controllers;

use App\Http\Resources\ApplicationResourse;
use App\Models\Application;
use App\Models\Master;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ApplicationController extends Controller
{
    public function show()
    {
        $master = Master::where('id_user', Auth::user()->id)->first();
        return ApplicationResourse::collection(Application::where('id_master', $master->id)->get());
    }
    public function showUser(): JsonResponse
    {
        $user = User::where('id', Auth::user()->id)->first();
        return response()->json([
            'content' => ApplicationResourse::collection(Application::where('id_user', $user->id)->get())
        ]);
    }
    public function showAdmin()
    {
        return ApplicationResourse::collection(Application::all());
    }
    public function create(Request $request)
    {
        $data = $request->validate([
            'email' => 'email|required|string',
            'number' => 'required|integer',
            'text' => 'required|string',
            'id_master' => 'required',
            'id_user' => 'required',
        ]);
        Application::create([
            'id_master' => $request['id_master'],
            'id_user' => $request['id_user'],
            'text' => $request['text'],
            'number' => $request['number'],
            'status' => 'Отправлен',
            'comm_master' => 'null',
            'comm_user' => 'null',
        ]);
        return response([
            'message' => 'Заявка успешно оформлена! Ожидайте изменение статуса'
        ]);
    }
    public function statusEdit(Request $request, $id)
    {
        if ($request->status == 'Успешно завершено' && $request->status == 'Принято, скоро с вами свяжутся' && $request->status == 'Отклонено мастером') {
            Application::where('id', $id)->update([
                'status' => $request->input('status'),
                'comm_master' => 'null',
                'comm_user' => 'null',
            ]);
            return response([
                'message' => "Статус успешно обновлен"
            ]);
        }
        else {
            if(auth()->user()->role == 'master') {
                Application::where('id', $id)->update([
                'status' => $request->input('status'),
                'comm_master' => $request->input('comm_master'),
                'comm_user' => 'null',
            ]);
            }else{
                Application::where('id', $id)->update([
                    'status' => $request->input('status'),
                    'comm_master' => 'null',
                    'comm_user' => $request->input('comm_master'),
                ]); 
            }
            return response([
                'message' => "Статус успешно обновлен"
            ]);
        }
    }
}
