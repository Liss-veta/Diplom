<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $data = $request->validate([
            'email' => 'email|required|string|unique:users',
            'name' => 'required|string',
            'password' => 'required|string|confirmed',
        ]);

        $user = User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'role' => 'user',
            'password' => Hash::make($data['password'])
        ]);

        $token = $user->createToken('token')->plainTextToken;
        
        return response([
            'user' => $user,
            'token' => $token
        ], 201);
    }
    public function login(Request $request)
    {
        $data = $request->validate([
            'email' => 'email|required|string',
            'password' => 'required|string'
        ]);
        $user = User::where('email', $data['email'])->first();
        if(!$user || !Hash::check($data['password'], $user->password)){
            return response([
                'message' => "Неверные данные"
            ], 403);
        }
        $token = $user->createToken('token')->plainTextToken;
        return response([
            'user' => $user,
            'token' => $token
        ], 200);
    }
    public function logout()
    {
        auth('sanctum')->user()->tokens()->delete();
        return response([
            'message' => "Вы успешно вышли"
        ], 203);
    }
}
