<?php

namespace App\Http\Controllers;

use App\Models\Contact;
use Exception;
use Illuminate\Http\Request;

class ContactController extends Controller
{
    public function index(){
        $all = Contact::all();
        return response([
            'content' => $all
        ]);
    }

    public function update(Request $request, $id)
    {
        if (Contact::where('id', $id)->first()) {
            $stroke = Contact::where('id', $id)->update([
                'title' => $request['title'],
                'description' => $request['description'],
                'contact' => $request['contact'],
            ]);
            return response([
                'message' => 'Успешно изменено',
                'content' => $stroke
            ], 200);
        } else {
            $new = Contact::create([
                'title' => $request['title'],
                'description' => $request['description'],
                'contact' => $request['contact'],
            ]);
            return response([
                'message' => 'Успешно добавлено',
                'content' => $new
            ], 200);
        }
        return new Exception('Ошибка добавления', 404);
    }
}
