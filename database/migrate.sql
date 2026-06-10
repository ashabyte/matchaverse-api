-- MatchaTea Database Schema
-- Jalankan: mysql -u root -p matchatea_db < migrate.sql

CREATE DATABASE IF NOT EXISTS matchatea_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE matchatea_db;

-- =============================================
-- USERS
-- =============================================
CREATE TABLE IF NOT EXISTS users (
    id VARCHAR(128) PRIMARY KEY COMMENT 'Firebase UID',
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    photo_url TEXT,
    fcm_token TEXT,
    points INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- =============================================
-- MATCHA PRODUCTS (CATALOG)
-- =============================================
CREATE TABLE IF NOT EXISTS matcha_products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    category ENUM('Minuman', 'Dessert', 'Makanan', 'Snack', 'Ceremonial', 'Culinary Grade') NOT NULL,
    price DECIMAL(12,2) DEFAULT 0,
    image_url TEXT,
    rating DECIMAL(3,2) DEFAULT 0,
    origin VARCHAR(100),
    grade VARCHAR(50),
    is_active TINYINT(1) DEFAULT 1,
    created_by VARCHAR(128),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL
);

-- =============================================
-- RECIPES
-- =============================================
CREATE TABLE IF NOT EXISTS recipes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    ingredients JSON COMMENT 'Array of ingredient strings',
    steps JSON COMMENT 'Array of step strings',
    image_url TEXT,
    servings INT DEFAULT 1,
    prep_time INT DEFAULT 0 COMMENT 'Menit',
    difficulty ENUM('Mudah', 'Sedang', 'Sulit') DEFAULT 'Mudah',
    author_id VARCHAR(128),
    author_name VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (author_id) REFERENCES users(id) ON DELETE SET NULL
);

-- =============================================
-- NEWS
-- =============================================
CREATE TABLE IF NOT EXISTS matcha_news (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(500) NOT NULL,
    summary TEXT,
    content LONGTEXT,
    image_url TEXT,
    source VARCHAR(255),
    published_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- FUN FACTS
-- =============================================
CREATE TABLE IF NOT EXISTS fun_facts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fact TEXT NOT NULL,
    category VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- HEALTH INTAKE RECORDS
-- =============================================
CREATE TABLE IF NOT EXISTS intake_records (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(128) NOT NULL,
    matcha_type VARCHAR(255) NOT NULL,
    grams_consumed DECIMAL(8,2) NOT NULL,
    caffeine_amount DECIMAL(8,2) NOT NULL COMMENT 'mg',
    notes TEXT,
    consumed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_user_date (user_id, consumed_at)
);

-- =============================================
-- MISSIONS
-- =============================================
CREATE TABLE IF NOT EXISTS missions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    mission_type ENUM('daily', 'weekly') DEFAULT 'daily',
    points_reward INT DEFAULT 10,
    emoji VARCHAR(10) DEFAULT '🎯',
    is_active TINYINT(1) DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS user_missions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(128) NOT NULL,
    mission_id INT NOT NULL,
    mission_type ENUM('daily', 'weekly') DEFAULT 'daily',
    is_completed TINYINT(1) DEFAULT 0,
    completed_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (mission_id) REFERENCES missions(id) ON DELETE CASCADE,
    UNIQUE KEY unique_user_mission (user_id, mission_id)
);

-- =============================================
-- BADGES
-- =============================================
CREATE TABLE IF NOT EXISTS badges (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    emoji VARCHAR(10) DEFAULT '🏅',
    condition_type VARCHAR(100) COMMENT 'e.g. intake_count, mission_count',
    condition_value INT COMMENT 'e.g. 10 (untuk 10x intake)',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS user_badges (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(128) NOT NULL,
    badge_id INT NOT NULL,
    earned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (badge_id) REFERENCES badges(id) ON DELETE CASCADE,
    UNIQUE KEY unique_user_badge (user_id, badge_id)
);

-- =============================================
-- COMMUNITY POSTS
-- =============================================
CREATE TABLE IF NOT EXISTS community_posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(128) NOT NULL,
    user_name VARCHAR(255),
    user_photo TEXT,
    content TEXT NOT NULL,
    image_url TEXT,
    tags JSON,
    likes INT DEFAULT 0,
    comments INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS post_likes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT NOT NULL,
    user_id VARCHAR(128) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES community_posts(id) ON DELETE CASCADE,
    UNIQUE KEY unique_post_like (post_id, user_id)
);

SELECT 'Database migration selesai!' AS status;
