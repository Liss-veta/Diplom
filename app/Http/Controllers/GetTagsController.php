<?php

namespace App\Http\Controllers;

use App\Models\Tags;

class GetTagsController extends Controller
{
    public function __invoke()
    {
        return Tags::all();
    }
}
