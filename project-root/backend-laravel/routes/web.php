<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductController;

// Product routes
Route::get('/products', [ProductController::class, 'index']);
