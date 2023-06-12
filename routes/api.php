<?php

use App\Http\Controllers\AboutController;
use App\Http\Controllers\ApplicationController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\LikesMasterController;
use App\Http\Controllers\GetTagsController;
use App\Http\Controllers\MasterController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\Slider_1;
use App\Http\Controllers\SovetController;
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
// Регистрация
Route::post('/register', [AuthController::class, 'register']);
// авторизация
Route::post('/login', [AuthController::class, 'login']);
// Просмотр советов
Route::get('/sovets', [SovetController::class, 'show']);
// Просмотр мастеров
Route::get('/masters', [MasterController::class, 'index']);
// Просмотр тегов мастера
Route::get('/master/{id}/tags', [MasterController::class, 'indexTags']);

// Все посты
Route::get('/posts', [PostController::class, 'show']);

// вывод на странице о нас
Route::get('/about', [AboutController::class, 'index']);
// вывод галлереи на странице о нас
Route::get('/about/gallery', [AboutController::class, 'indexGallery']);

// Просмотр одного мастера
Route::get('/masters/{id}', [MasterController::class, 'show']);
// Просмотр одного мастера в шапке
Route::get('/masters/{id}/header', [MasterController::class, 'showOne']);
// Просмотр слайдера главной страницы
Route::get('/admin/slider', [Slider_1::class, 'index']);
// Просмотр контактов на главной странице
Route::get('/admin/contact', [ContactController::class, 'index']);
// Просмотр постов мастера
Route::get('/master/{id}/post', [PostController::class, 'index']);
// Просмотр советов мастера
Route::get('/master/{id}/sovet', [SovetController::class, 'index']);
// Вывод трех мастеров на главной странице
Route::get('/admin/master/main', [MasterController::class, 'showMain']);

Route::group(['middleware' => 'auth:sanctum'], function () {
    // Все теги
    Route::get('/tags', GetTagsController::class);
    // Выход
    Route::get('/logout', [AuthController::class, 'logout']);
    // Отправка заявки на сотрудничество
    Route::post('/master/create', [MasterController::class, 'create']);
    // Создание заявки клиентом
    Route::post('/user/application_create', [ApplicationController::class, 'create']);
    // Лайки на посты
    Route::get('/likes/master/{id}', [LikesMasterController::class, 'create']);
    Route::get('/likes/master/{id}/check', [LikesMasterController::class, 'show']);
    // Просмотр заявок пользователя
    Route::get('/applications', [ApplicationController::class, 'showUser']);
    // Ответ мастера на заявку
    Route::post('/master/application/{id}/status', [ApplicationController::class, 'statusEdit']);
    // Просмотр избранных
    Route::get('/likes/master', [LikesMasterController::class, 'showUser']);
});

Route::group(['middleware' => ['master', 'auth:sanctum']], function () {
    // Создание совета
    Route::post('/sovet', [SovetController::class, 'create']);
    // Редактирование совета
    Route::patch('/sovet/{id}', [SovetController::class, 'update']);
    // Удаление совета
    Route::delete('/sovet/{id}/delete', [SovetController::class, 'delete']);
    // Обновление данных страницы
    Route::post('/master/{id}/update', [MasterController::class, 'update']);
    // Изменение аватара мастера
    Route::post('/master/{id}/update_avatar', [MasterController::class, 'updateAvatar']);
    // Создание поста
    Route::post('/master/post', [PostController::class, 'create']);
    // Удаление поста
    Route::delete('/master/post/{id}', [PostController::class, 'delete']);
    // Обновление изображения поста
    Route::post('/master/post/image/{id}/update', [PostController::class, 'updateImage']);
    // Просмотр заявок одного мастера
    Route::get('/master/application', [ApplicationController::class, 'show']);
    // Создание совета
    Route::post('/master/sovet', [SovetController::class, 'create']);
});

Route::group(['middleware' => ['admin', 'auth:sanctum']], function () {
    Route::delete('/master/{id}/delete', [MasterController::class, 'delete']);
    // Редактирование фотографий слайдера на главной странице
    Route::post('/admin/slider/{id}/update', [Slider_1::class, 'update']);
    // Редактирование контактов на главной странице
    Route::post('/admin/contact/{id}/update', [ContactController::class, 'update']);
    // Бан мастера
    Route::post('/admin/masters/{id}/update', [MasterController::class, 'ban']);
    // Просмотр заявок на сотрудничество 
    Route::get('/admin/cooperation/master', [MasterController::class, 'showAdmin']);
    // Вывод заявок всех мастеров
    Route::get('/admin/application', [ApplicationController::class, 'showAdmin']);
    // Принять/отклонить заявку мастера
    Route::post('/admin/cooperation/{id}', [MasterController::class, 'answerAdmin']);
    // Вывод всееех мастеров для админа
    Route::get('/admin/masters', [MasterController::class, 'indexAdmin']);
    // Удаление совета
    Route::delete('/admin/delete/{id}/sovet', [SovetController::class, 'delete']);
    // Просмотр/принятие новых советов
    Route::get('/admin/sovets', [SovetController::class, 'showAdmin']);
    // Просмотр/принятие новых советов
    Route::post('/admin/updateprivilege/{id}/sovet', [SovetController::class, 'updatePrivilege']);
    // Редактирование первой фотографии на странице о нас
    Route::post('/admin/about/image/update', [AboutController::class, 'updateImg']);
    // Редактирование текста на странице о нас
    Route::post('/admin/about/text/update', [AboutController::class, 'updateText']);
    // Редактирование фото из ленты на странице о нас
    Route::post('/admin/about/gallery/{id}/update', [AboutController::class, 'updateGallery']);
});
