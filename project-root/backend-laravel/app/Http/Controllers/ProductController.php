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
            ],
            [
                'id' => 4,
                'name' => 'Продукт 4',
                'price' => 30.00,
                'description' => 'Описание на продукт 4'
            ],
            [
                'id' => 5,
                'name' => 'Продукт 5',
                'price' => 12.49,
                'description' => 'Описание на продукт 5'
            ],
        ];

        return response()->json($products);
    }

}
