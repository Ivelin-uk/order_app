<?php

namespace App\Http\Controllers;

abstract class Controller
{
    public function hello()
    {
        return response()->json(['message' => 'Hello World!']);
    }
}
