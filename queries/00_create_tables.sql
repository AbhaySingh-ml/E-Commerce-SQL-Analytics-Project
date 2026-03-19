-- Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name TEXT,
    city TEXT,
    signup_date DATE
);

-- Products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name TEXT,
    category TEXT,
    price NUMERIC
);

-- Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    payment_method TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order Items table
CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    price NUMERIC,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);