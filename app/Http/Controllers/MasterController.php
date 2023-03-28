<?php

namespace App\Http\Controllers;

use App\Models\Master;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class MasterController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Master::all()->where('admin_status', 'active');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|string',
            'surname' => 'required|string',
            'age' => 'required|integer',
            'city' => 'required|string',
            'staj' => 'required|integer',
            'clients_count' => 'required|integer',
            'min_cena' => 'required|integer',
            'description' => 'required|string|min:50',
        ]);

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
            'avatar' => '111111',
            'admin_status' => 'undefined',
            'privilege' => '0',
        ]);

        return response([
            'message' => 'Успешно'
        ], 200);
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
