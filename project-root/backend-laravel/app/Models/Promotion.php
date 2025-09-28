<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Promotion extends Model
{
    use HasFactory;

    protected $fillable = [
        'product_id',
        'name',
        'description',
        'promo_price',
        'start_date',
        'end_date',
        'is_active'
    ];

    protected $casts = [
        'promo_price' => 'decimal:2',
        'start_date' => 'date',
        'end_date' => 'date',
        'is_active' => 'boolean'
    ];

    // Relationships
    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    // Scopes
    public function scopeActive($query)
    {
        $today = now()->toDateString();
        return $query->where('is_active', true)
                    ->where('start_date', '<=', $today)
                    ->where('end_date', '>=', $today);
    }

    // Helper methods
    public function isActive()
    {
        $today = now()->toDateString();
        return $this->is_active && 
               $this->start_date <= $today && 
               $this->end_date >= $today;
    }
}
