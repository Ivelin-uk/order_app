<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class PromotionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $promotions = [
            [
                'product_id' => 1,
                'name' => 'Нова година промоция',
                'description' => '20% отстъпка за новогодишните празници',
                'promo_price' => 8.00,
                'start_date' => now()->subDays(1),
                'end_date' => now()->addDays(7),
                'is_active' => true,
            ],
            [
                'product_id' => 2,
                'name' => 'Зимна промоция',
                'description' => '15% отстъпка за зимните месеци',
                'promo_price' => 12.75,
                'start_date' => now()->subDays(2),
                'end_date' => now()->addDays(10),
                'is_active' => true,
            ],
            [
                'product_id' => 3,
                'name' => 'Специална оферта',
                'description' => '30% отстъпка за ограничено време',
                'promo_price' => 21.00,
                'start_date' => now(),
                'end_date' => now()->addDays(5),
                'is_active' => true,
            ],
            [
                'product_id' => 4,
                'name' => 'Седмична промоция',
                'description' => '10% отстъпка за тази седмица',
                'promo_price' => 18.00,
                'start_date' => now()->subDays(1),
                'end_date' => now()->addDays(6),
                'is_active' => true,
            ],
        ];

        foreach ($promotions as $promotion) {
            \App\Models\Promotion::create($promotion);
        }
    }
}
