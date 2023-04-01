<?php

namespace App\Http\Controllers;

use App\Http\Resources\MasterResource;
use App\Models\Master;
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
    public function index():JsonResponse
    {
        try { 
            $masters = Master::all()->where('admin_status', 'active');
            if (!$masters) {
                return new Exception('Мастера отсутствуют!', 404);
            }
    
            return response()->json([
                'message' => 'Вывод всех мастеров',
                'content' => $masters
            ], 200);
        }
        catch (\Exception $error) {
            return response()->json([
                'message' => $error->getMessage()
            ]);
        }
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $request):JsonResponse
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

        $avatar = $request['avatar'];
        $path = null;
        if($avatar){
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

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id):JsonResponse
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
        }
        catch (\Exception $error) {
            return response()->json([
                'message' => $error->getMessage()
            ]);
        }
    }
}
