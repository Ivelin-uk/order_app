# Система за онлайн поръчки - ER диаграма

## Структура на базата данни

### Основни таблици:

#### users
- id (PK)
- name
- email (unique)
- password
- role (admin|courier|customer)
- timestamps

#### categories  
- id (PK)
- name
- description
- timestamps

#### products
- id (PK)
- name
- description
- price
- stock
- category_id (FK)
- image_url
- timestamps

#### promotions
- id (PK)
- product_id (FK)
- promo_price
- start_date
- end_date
- timestamps

#### orders
- id (PK)
- user_id (FK)
- courier_id (FK, nullable)
- total_price
- status (pending|assigned|in_transit|delivered|cancelled)
- payment_status (pending|paid|failed)
- order_time
- address
- latitude, longitude
- transaction_id
- timestamps

#### order_items
- id (PK)
- order_id (FK)
- product_id (FK)
- quantity
- price
- timestamps

#### payments
- id (PK)
- order_id (FK)
- method (stripe|paypal)
- amount
- status (pending|completed|failed|refunded)
- transaction_id
- gateway_response (JSON)
- timestamps

### Връзки:

- users 1:N orders (като клиент)
- users 1:N orders (като куриер)
- categories 1:N products
- products 1:N promotions
- products 1:N order_items
- orders 1:N order_items
- orders 1:1 payments

### Индекси:

- users: role, email
- products: category_id, stock
- promotions: product_id, dates
- orders: user_id, courier_id, status, payment_status, order_time
- order_items: order_id, product_id
- payments: order_id, status, transaction_id