<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ProductController
{
    /**
     * Display a listing of products as JSON
     */
    public function index()
    {
        $products = [
            [
                'id' => 1,
                'name' => 'Продукт 1',
                'price' => 10.99,
                'description' => 'Описание на продукт 1'
            ],
            [
                'id' => 2,
                'name' => 'Продукт 2', 
                'price' => 25.50,
                'description' => 'Описание на продукт 2'
            ],
            [
                'id' => 3,
                'name' => 'Продукт 3',
                'price' => 15.75,
                'description' => 'Описание на продукт 3'
            ]
        ];

        return response()->json($products);
    }

}
