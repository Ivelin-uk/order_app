-- Sample data for Online Orders System

-- Insert admin user
INSERT INTO users (name, email, password, role, created_at, updated_at) VALUES
('Админ', 'admin@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NOW(), NOW()),
('Иван Петров', 'courier1@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'courier', NOW(), NOW()),
('Мария Георгиева', 'courier2@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'courier', NOW(), NOW()),
('Петър Иванов', 'customer1@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'customer', NOW(), NOW()),
('Анна Димитрова', 'customer2@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'customer', NOW(), NOW());

-- Insert categories
INSERT INTO categories (name, description, created_at, updated_at) VALUES
('Електроника', 'Смартфони, лаптопи, таблети и други електронни устройства', NOW(), NOW()),
('Дрехи', 'Мъжки, дамски и детски дрехи за всеки сезон', NOW(), NOW()),
('Храна и напитки', 'Хранителни продукти, напитки и деликатеси', NOW(), NOW()),
('Книги', 'Художествена и научна литература, учебници', NOW(), NOW()),
('Спорт', 'Спортни стоки, екипировка и аксесоари', NOW(), NOW()),
('Дом и градина', 'Мебели, декорация и градински принадлежности', NOW(), NOW());

-- Insert products
INSERT INTO products (name, description, price, stock, category_id, image_url, created_at, updated_at) VALUES
-- Електроника
('iPhone 15 Pro', 'Най-новият iPhone с A17 Pro чип и титанов корпус', 2499.00, 25, 1, 'https://example.com/iphone15pro.jpg', NOW(), NOW()),
('Samsung Galaxy S24', 'Флагмански Android телефон с AI функции', 2199.00, 30, 1, 'https://example.com/galaxys24.jpg', NOW(), NOW()),
('MacBook Air M3', 'Тънък и лек лаптоп с невероятна производителност', 2899.00, 15, 1, 'https://example.com/macbookair.jpg', NOW(), NOW()),
('iPad Pro', 'Професионален таблет за работа и творчество', 1899.00, 20, 1, 'https://example.com/ipadpro.jpg', NOW(), NOW()),

-- Дрехи
('Мъжка риза', 'Елегантна памучна риза за всяка случай', 89.00, 50, 2, 'https://example.com/shirt.jpg', NOW(), NOW()),
('Дамска рокля', 'Стилна рокля за специални поводи', 129.00, 35, 2, 'https://example.com/dress.jpg', NOW(), NOW()),
('Детски панталон', 'Удобен и траен панталон за деца', 45.00, 60, 2, 'https://example.com/kidspants.jpg', NOW(), NOW()),

-- Храна и напитки
('Био мед', 'Натурален пчелен мед от българска пасека', 25.00, 100, 3, 'https://example.com/honey.jpg', NOW(), NOW()),
('Червено вино', 'Качествено българско червено вино', 35.00, 80, 3, 'https://example.com/wine.jpg', NOW(), NOW()),
('Кафе бобови зърна', 'Арабика кафе с богат аромат', 28.00, 45, 3, 'https://example.com/coffee.jpg', NOW(), NOW()),

-- Книги
('Под игото', 'Класическа българска литература', 18.00, 75, 4, 'https://example.com/podigoto.jpg', NOW(), NOW()),
('Програмиране с Python', 'Учебник за начинаещи програмисти', 55.00, 40, 4, 'https://example.com/python.jpg', NOW(), NOW()),

-- Спорт
('Футболна топка', 'Професионална футболна топка FIFA стандарт', 65.00, 30, 5, 'https://example.com/football.jpg', NOW(), NOW()),
('Фитнес постелка', 'Йога и фитнес постелка с противоплъзгащо покритие', 35.00, 25, 5, 'https://example.com/yogamat.jpg', NOW(), NOW()),

-- Дом и градина
('Офис стол', 'Ергономичен офис стол с люлееща функция', 299.00, 20, 6, 'https://example.com/chair.jpg', NOW(), NOW()),
('Градинска лейка', 'Пластмасова лейка за поливане 5л', 15.00, 40, 6, 'https://example.com/watercan.jpg', NOW(), NOW());

-- Insert promotions (active today)
INSERT INTO promotions (product_id, promo_price, start_date, end_date, created_at, updated_at) VALUES
(1, 2199.00, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 7 DAY), NOW(), NOW()), -- iPhone promotion
(5, 69.00, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 3 DAY), NOW(), NOW()),    -- Shirt promotion
(8, 20.00, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 5 DAY), NOW(), NOW()),    -- Honey promotion
(13, 249.00, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 10 DAY), NOW(), NOW()); -- Office chair promotion

-- Insert sample orders
INSERT INTO orders (user_id, courier_id, total_price, status, payment_status, order_time, address, latitude, longitude, created_at, updated_at) VALUES
(4, 2, 2328.00, 'delivered', 'paid', DATE_SUB(NOW(), INTERVAL 2 DAY), 'ул. Витоша 15, София', 42.6977, 23.3219, DATE_SUB(NOW(), INTERVAL 2 DAY), NOW()),
(5, NULL, 164.00, 'pending', 'paid', DATE_SUB(NOW(), INTERVAL 1 HOUR), 'бул. Христо Ботев 25, Пловдив', 42.1354, 24.7453, DATE_SUB(NOW(), INTERVAL 1 HOUR), NOW());

-- Insert sample order items
INSERT INTO order_items (order_id, product_id, quantity, price, created_at, updated_at) VALUES
-- Order 1
(1, 1, 1, 2199.00, DATE_SUB(NOW(), INTERVAL 2 DAY), DATE_SUB(NOW(), INTERVAL 2 DAY)),
(1, 5, 1, 69.00, DATE_SUB(NOW(), INTERVAL 2 DAY), DATE_SUB(NOW(), INTERVAL 2 DAY)),
(1, 8, 2, 20.00, DATE_SUB(NOW(), INTERVAL 2 DAY), DATE_SUB(NOW(), INTERVAL 2 DAY)),
-- Order 2  
(2, 6, 1, 129.00, DATE_SUB(NOW(), INTERVAL 1 HOUR), DATE_SUB(NOW(), INTERVAL 1 HOUR)),
(2, 7, 1, 45.00, DATE_SUB(NOW(), INTERVAL 1 HOUR), DATE_SUB(NOW(), INTERVAL 1 HOUR));