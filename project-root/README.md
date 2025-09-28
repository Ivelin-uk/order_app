# Онлайн магазин система за поръчки

## Описание
Система за онлайн поръчки с три роли: Потребител, Администратор, Куриер

### Технологии
- **Backend**: Laravel 11 (API + Admin панел)
- **Mobile App**: React Native (Expo Go)
- **Database**: MySQL/PostgreSQL
- **Maps**: Google Maps API
- **Payments**: Stripe/PayPal
- **Notifications**: Laravel Echo / Firebase Cloud Messaging

### Роли и функционалности

#### 🛍️ Потребител (Customer)
- Преглед на дневни промоции
- Разглеждане на категории и продукти
- Детайлна информация за продукт
- Добавяне в количка
- Плащане с карта
- GPS локация или ръчно въвеждане на адрес
- Преглед на собствени поръчки

#### 👨‍💼 Администратор (Admin)
- Управление на продукти (CRUD)
- Управление на категории
- Преглед на всички поръчки
- Назначаване на куриери
- Получаване на известия за нови поръчки

#### 🚚 Куриер (Courier)
- Преглед на назначени поръчки
- Детайли за поръчки (час, продукти, адрес)
- Карта с локации
- Отбелязване като доставени
- Автоматично намаляване на наличност

## Структура на проекта

```
project-root/
├── backend-laravel/     # Laravel API
├── mobile-app/          # React Native клиент
├── database/            # SQL скриптове
├── docs/                # Документация
└── README.md
```

## Стартиране

### Backend (Laravel)
```bash
cd backend-laravel
composer install
php artisan migrate --seed
php artisan serve
```

### Mobile App (React Native)
```bash
cd mobile-app
npm install
npx expo start
```

## База данни

Основни таблици:
- `users` - потребители с роли
- `categories` - категории продукти
- `products` - продукти с наличност
- `promotions` - промоции
- `orders` - поръчки
- `order_items` - продукти в поръчка
- `payments` - плащания

## API endpoints

- `POST /api/auth/login` - вход
- `GET /api/products` - продукти
- `GET /api/categories` - категории
- `POST /api/orders` - създаване на поръчка
- `GET /api/orders` - поръчки на потребител
- `PUT /api/orders/{id}/status` - актуализиране статус

## Настройки

Копирайте `.env.example` към `.env` и конфигурирайте:
- Database credentials
- Stripe/PayPal API keys
- Google Maps API key
- JWT secret