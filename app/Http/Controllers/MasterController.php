<?php

namespace App\Http\Controllers;

use App\Http\Resources\MasterResource;
use App\Models\Master;
use App\Models\Master_tags;
use App\Models\User;
use App\Models\Tags;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class MasterController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(): JsonResponse
    {
        try {
            $masters = Master::all()->where('admin_status', 'active');
            if (!$masters) {
                return new Exception('Мастера отсутствуют!', 404);
            }
            return response()->json([
                'message' => 'Вывод всех мастеров',
                'content' => MasterResource::collection(Master::all()->where('admin_status', 'active')),
            ], 200);
        } catch (\Exception $error) {
            return response()->json([
                'message' => $error->getMessage()
            ]);
        }
    }
    public function indexAdmin(): JsonResponse
    {
        return response()->json([
            'message' => 'Вывод всех мастеров',
            'content' => MasterResource::collection(Master::all()->where('admin_status', '!=', 'undefined')),
        ], 200);
    }
    public function indexTags($id): JsonResponse
    {
        $master = Master::find($id);
        $tags = Master_tags::all()->where('id_master', $id);
        $result = [];
        foreach ($tags as $tag) {
            array_push($result, Tags::find($tag['id_tag'])->tag_name);
        }
        if (!$master) {
            return response()->json([
                'message' => 'Мастера нет!',
            ], 404);
        }
        return response()->json([
            'message' => 'Вывод всех тегов мастера',
            'tags' => $result,
        ], 200);
    }
    public function showMain()
    {
        return response()->json([
            'content' => Master::all()->where('privilege', '!=', '0')
        ]);
    }
    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $request): JsonResponse
    {
        $data = $request->validate([
            'name' => 'required|string',
            'surname' => 'required|string',
            'age' => 'required|integer',
            'city' => 'required|string',
            'staj' => 'required|integer',
            'clients_count' => 'required|integer',
            'min_cena' => 'required|integer',
            'description' => 'required|string|min:50|max:400',
        ]);

        User::where('id', auth()->user()->id)->update([
            'name' => $data['name']
        ]);

        $avatar = $request['avatar'];
        $path = null;
        if ($avatar) {
            $path = 'storage/';
            $path .= Storage::disk('public')->put('masters/avatars', $avatar);
            $path = url($path);
        }

        $master = Master::create([
            'id_user' => Auth::user()->id,
            'name' => $data['name'],
            'surname' => $data['surname'],
            'age' => $data['age'],
            'city' => $data['city'],
            'staj' => $data['staj'],
            'clients_count' => $data['clients_count'],
            'min_cena' => $data['min_cena'],
            'description' => $data['description'],
            'avatar' => $path,
            'admin_status' => 'undefined',
            'privilege' => '0',
        ]);

        $masterCheck = Master::where('id_user', auth()->user()->id)->first();
        foreach (explode(",", $request['categories']) as $category) {
            $tag = Tags::where('tag_name', $category)->first();
            Master_tags::create([
                'id_master' => $masterCheck->id,
                'id_tag' => $tag->id
            ]);
        }

        return response()->json([
            'message' => 'Успешно создан мастер!',
            'content' => $master
        ], 201);
    }
    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $arr = MasterResource::collection(Master::all()->where('id', $id));
        return response()->json([
            'content' => $arr
        ], 200, ["Content-type" => "application/json"]);
    }

    public function showOne($id_user)
    {
        $arr = Master::where('id_user', $id_user)->first();
        return response()->json([
            'content' => $arr
        ], 200, ["Content-type" => "application/json"]);
    }

    public function showAdmin()
    {
        return Master::where('admin_status', 'undefined')->get();
    }

    public function ban($id)
    {
        $ban = Master::where('id', $id)->update([
            'admin_status' => 'ban'
        ]);
        return response([
            'message' => 'Мастер успешно забанен'
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $name = $request->input('name');
        $surname = $request->input('surname');
        $age = $request->input('age');
        $city = $request->input('city');
        $staj = $request->input('staj');
        $clients_count = $request->input('clients_count');
        $min_cena = $request->input('min_cena');
        $description = $request->input('description');

        Master::where('id_user', $id)->update([
            'name' => $name,
            'surname' => $surname,
            'age' => $age,
            'city' => $city,
            'staj' => $staj,
            'clients_count' => $clients_count,
            'min_cena' => $min_cena,
            'description' => $description,
        ]);

        $masterCheck = Master::where('id_user', $id)->first();
        foreach (explode(",", $request['categories']) as $category) {
            $tag = Tags::where('tag_name', $category)->first();
            if (!Master_tags::where('id_tag', $tag->id)->where('id_master', $masterCheck->id)->first()) {
                Master_tags::create([
                    'id_master' => $masterCheck->id,
                    'id_tag' => $tag->id
                ]);
            }
        }

        return response([
            'message' => 'Успешно обновили данные'
        ]);
    }

    public function updateAvatar(Request $request, $id)
    {
        $image = $request['avatar'];
        if ($image) {
            $path = 'storage/';
            $path .= Storage::disk('public')->put('masters/avatars', $image);
            $path = url($path);
        }
        $stroke = Master::where('id_user', $id)->update([
            'avatar' => $path
        ]);
        return response([
            'message' => 'Успешно изменено',
            'content' => $stroke
        ], 200);
    }

    public function answerAdmin(Request $request, $id)
    {
        Master::where('id_user', $id)->update([
            'admin_status' => $request['answer']
        ]);
        if ($request['answer'] == 'active') {
            User::where('id', $id)->update([
                'role' => 'master'
            ]);
        }
        return response([
            'message' => 'Good'
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id): JsonResponse
    {
        try {
            $master = Master::findOrFail($id);
            if (!$master) {
                return new Exception('Ошибка,такого мастера нет!', 404);
            }

            $master->delete();
            return response()->json([
                'message' => 'Удален мастер!',
                'content' => $master
            ], 203);
        } catch (\Exception $error) {
            return response()->json([
                'message' => $error->getMessage()
            ]);
        }
    }
}
