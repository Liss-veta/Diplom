<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\MasterController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\Slider_1;
use App\Http\Controllers\SovetController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::get('/sovets', [SovetController::class, 'index']);
Route::get('/masters', [MasterController::class, 'index']);
Route::get('/masters/{id}', [MasterController::class, 'show']);
Route::get('/masters/{id}/header', [MasterController::class, 'showOne']);
Route::get('/admin/slider', [Slider_1::class, 'index']);
Route::get('/admin/contact', [ContactController::class, 'index']);
Route::get('/master/{id}/post', [PostController::class, 'index']);


Route::group(['middleware' => 'auth:sanctum'], function(){
    Route::get('/logout', [AuthController::class, 'logout']);
    Route::post('/master/create', [MasterController::class, 'create']);
});

Route::group(['middleware' => ['master', 'auth:sanctum']], function(){
    Route::post('/sovet', [SovetController::class, 'create']);
    Route::patch('/sovet/{id}', [SovetController::class, 'update']);
    Route::delete('/sovet/{id}/delete', [SovetController::class, 'delete']);
    Route::post('/master/{id}/update', [MasterController::class, 'update']);
    Route::post('/master/{id}/update_avatar', [MasterController::class, 'updateAvatar']);
    Route::post('/master/post', [PostController::class, 'create']);
});

Route::group(['middleware' => ['admin', 'auth:sanctum']], function(){
    Route::delete('/master/{id}/delete', [MasterController::class, 'delete']);
    Route::post('/admin/slider/{id}/update', [Slider_1::class, 'update']);
    Route::post('/admin/contact/{id}/update', [ContactController::class, 'update']);
    Route::post('/admin/masters/{id}/update', [MasterController::class, 'ban']);
});


