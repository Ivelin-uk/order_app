<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

// Example API routes for products
Route::get('/products', function () {
    return response()->json([
        'products' => [
            ['id' => 1, 'name' => 'Product 1', 'price' => 100],
            ['id' => 2, 'name' => 'Product 2', 'price' => 200],
            ['id' => 3, 'name' => 'Product 3', 'price' => 300],
        ]
    ]);
});

Route::get('/promotions', function () {
    return response()->json([
        'promotions' => [
            ['id' => 1, 'title' => 'Summer Sale', 'discount' => 20],
            ['id' => 2, 'title' => 'Winter Special', 'discount' => 15],
        ]
    ]);
});