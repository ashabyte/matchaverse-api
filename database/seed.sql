-- MatchaTea Seed Data
USE matchatea_db;

-- Matcha Products
INSERT IGNORE INTO matcha_products (name, description, category, price, rating, origin, grade) VALUES
('Matcha Latte Premium', 'Minuman matcha hangat dengan susu oat organik, creamy dan lembut', 'Minuman', 45000, 4.8, 'Uji, Japan', 'Ceremonial'),
('Matcha Croissant', 'Croissant renyah dengan filling matcha cream premium dari Kyoto', 'Makanan', 35000, 4.7, 'Kyoto, Japan', 'Culinary Grade'),
('Matcha Mochi', 'Mochi lembut berisi matcha paste tradisional Jepang', 'Dessert', 25000, 4.6, 'Nishio, Japan', 'Ceremonial'),
('Matcha Tiramisu', 'Tiramisu dengan twist matcha layer, kombinasi sempurna', 'Dessert', 55000, 4.9, 'Kyoto, Japan', 'Culinary Grade'),
('Matcha Cookies', 'Cookies renyah dengan matcha powder berkualitas tinggi', 'Snack', 28000, 4.5, 'Uji, Japan', 'Culinary Grade'),
('Ceremonial Grade Matcha', 'Matcha bubuk premium untuk upacara teh tradisional Jepang', 'Ceremonial', 285000, 5.0, 'Uji, Japan', 'Ceremonial'),
('Matcha Smoothie Bowl', 'Smoothie bowl sehat dengan topping granola dan buah segar', 'Minuman', 52000, 4.7, 'Shizuoka, Japan', 'Culinary Grade'),
('Matcha Cake Roll', 'Roll cake lembut dengan filling matcha cream cheese', 'Dessert', 75000, 4.8, 'Uji, Japan', 'Culinary Grade');

-- Recipes
INSERT IGNORE INTO recipes (title, description, ingredients, steps, servings, prep_time, difficulty, author_name) VALUES
('Matcha Latte Iced', 'Matcha latte dingin yang menyegarkan, mudah dibuat di rumah',
  '["2g matcha powder", "30ml air panas 80°C", "200ml oat milk", "Es batu secukupnya", "Simple syrup sesuai selera"]',
  '["Sift matcha powder ke dalam gelas.", "Tuang air panas, aduk hingga pasta matcha terbentuk.", "Tambahkan simple syrup, aduk rata.", "Masukkan es batu.", "Tuang oat milk perlahan dari sisi gelas.", "Sajikan segera."]',
  1, 5, 'Mudah', 'MatchaTea Admin'),
('Matcha Mochi Homemade', 'Mochi lembut berisi matcha paste yang bisa dibuat sendiri di rumah',
  '["150g tepung ketan", "200ml air", "50g gula", "2 sdm matcha powder untuk filling", "100g white bean paste", "Tepung maizena untuk taburan"]',
  '["Campur tepung ketan, air, dan gula. Aduk rata.", "Kukus adonan 20 menit hingga matang.", "Buat filling: campur white bean paste dengan matcha powder.", "Ambil adonan mochi, pipihkan di atas tepung maizena.", "Isi dengan matcha paste, bentuk bola.", "Sajikan segera atau simpan dalam kulkas."]',
  8, 45, 'Sedang', 'MatchaTea Admin');

-- News
INSERT IGNORE INTO matcha_news (title, summary, content, source) VALUES
('Tren Matcha Global 2026: Pasar Diprediksi Tumbuh 15%', 'Industri matcha dunia terus berkembang pesat didorong meningkatnya kesadaran kesehatan.', 'Laporan terbaru dari Grand View Research menunjukkan pasar matcha global diperkirakan akan tumbuh 15% pada tahun 2026, didorong oleh meningkatnya permintaan dari konsumen yang sadar kesehatan...', 'MatchaTea News'),
('Penelitian Baru: Matcha Bantu Kurangi Stres', 'Studi dari Universitas Nagoya membuktikan konsumsi matcha rutin dapat mengurangi kadar kortisol.', 'Sebuah penelitian terbaru yang diterbitkan di Journal of Nutritional Science mengungkapkan bahwa konsumsi matcha secara rutin dapat membantu mengurangi kadar kortisol, hormon stres utama dalam tubuh...', 'MatchaTea News'),
('Kafe Matcha Specialty Bermunculan di Jakarta', 'Jakarta menjadi salah satu kota dengan pertumbuhan kafe matcha specialty tercepat di Asia Tenggara.', 'Dalam setahun terakhir, lebih dari 50 kafe matcha specialty baru telah membuka gerai di Jakarta, menjadikan kota ini sebagai salah satu pusat budaya matcha terbesar di Asia Tenggara...', 'MatchaTea News');

-- Fun Facts
INSERT IGNORE INTO fun_facts (fact, category) VALUES
('Matcha mengandung L-theanine yang menghasilkan efek relaksasi tanpa mengantuk, sehingga disebut "calm alertness".', 'Kesehatan'),
('Satu cangkir matcha setara dengan 10 cangkir teh hijau biasa dalam hal kandungan antioksidan.', 'Nutrisi'),
('Upacara teh Jepang (Chado) telah ada sejak abad ke-12 dan masih dipraktikkan hingga kini.', 'Sejarah'),
('Matcha ceremonial grade dipetik hanya sekali setahun di musim semi (ichibancha).', 'Produksi'),
('Warna hijau terang matcha berasal dari klorofil yang melimpah karena ditanam dalam naungan 3-4 minggu sebelum panen.', 'Produksi'),
('L-theanine dalam matcha bekerja sinergis dengan kafein untuk meningkatkan fokus dan konsentrasi.', 'Kesehatan'),
('Matcha Uji dari Prefektur Kyoto dianggap sebagai matcha terbaik di dunia karena kondisi tanah dan iklimnya.', 'Produksi'),
('Satu sendok teh (2g) matcha mengandung sekitar 70mg kafein, hampir setara dengan satu shot espresso.', 'Nutrisi');

-- Missions
INSERT IGNORE INTO missions (title, description, mission_type, points_reward, emoji) VALUES
('Minum Matcha Pertama', 'Catat konsumsi matcha pertamamu hari ini', 'daily', 10, '🍵'),
('Explorer Hari Ini', 'Buka halaman Eksplorasi dan baca 1 berita matcha', 'daily', 15, '📰'),
('Cek Resep Baru', 'Lihat minimal 1 resep di halaman Resep', 'daily', 10, '📖'),
('Bagikan Perjalanan', 'Buat 1 postingan di komunitas MatchaTea', 'daily', 20, '✍️'),
('5 Hari Berturut-turut', 'Catat konsumsi matcha 5 hari berturut-turut minggu ini', 'weekly', 50, '🔥'),
('Matcha Explorer', 'Eksplorasi 10 produk matcha berbeda minggu ini', 'weekly', 40, '🗺️'),
('Community Contributor', 'Buat 3 postingan komunitas minggu ini', 'weekly', 60, '👥'),
('Health Tracker Pro', 'Catat konsumsi matcha setiap hari selama 7 hari berturut-turut', 'weekly', 75, '💪');

-- Badges
INSERT IGNORE INTO badges (name, description, emoji, condition_type, condition_value) VALUES
('Matcha Newbie', 'Catat konsumsi matcha pertamamu', '🌱', 'intake_count', 1),
('Matcha Regular', 'Catat 10x konsumsi matcha', '🍵', 'intake_count', 10),
('Matcha Addict', 'Catat 50x konsumsi matcha', '🏆', 'intake_count', 50),
('Mission Master', 'Selesaikan 10 misi', '⭐', 'mission_count', 10),
('Community Star', 'Buat 5 postingan komunitas', '🌟', 'post_count', 5),
('Health Guardian', 'Pantau kafein selama 30 hari', '💚', 'tracking_days', 30),
('Recipe Creator', 'Tambahkan resep pertamamu', '👨‍🍳', 'recipe_count', 1),
('Leaderboard Champion', 'Masuk Top 10 leaderboard', '👑', 'rank', 10);

SELECT 'Seed data berhasil diinsert!' AS status;
