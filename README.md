# 🚀 Ramarmalia - Laravel + FrankenPHP + Docker

Selamat datang di **Ramarmalia**, proyek Laravel yang berjalan dengan **FrankenPHP** dan dikelola menggunakan **Docker**! 🎉

## 🎯 Fitur

✅ Laravel + FrankenPHP untuk performa tinggi ⚡  
✅ Nginx sebagai reverse proxy 🔄  
✅ MySQL (MariaDB) sebagai database 🗄️  
✅ Redis untuk caching dan session 🔥  
✅ Docker Compose untuk kemudahan deployment 📦

---

## 📥 1. Clone Repository

Pertama, pastikan kamu sudah menginstal **Git** dan **Docker** di sistem kamu.

Jalankan perintah berikut untuk menyalin kode proyek ke komputer kamu:

```sh
git clone https://github.com/username/repository-name.git
cd repository-name
```

---

## ⚙️ 2. Konfigurasi Environment

Buat file `.env` dengan menyalin contoh konfigurasi:

```sh
cp .env.example .env
```

Lalu, edit `.env` sesuai kebutuhan (terutama database dan cache):

```
DB_HOST=mysql
DB_DATABASE=sepatu
DB_USERNAME=root
DB_PASSWORD=root
CACHE_DRIVER=redis
SESSION_DRIVER=redis
REDIS_HOST=redis
```

---

## 🏗️ 3. Build dan Jalankan Docker

Jalankan perintah ini untuk membangun dan menjalankan container Docker:

```sh
docker-compose up -d --build
```

**Penjelasan:**

-   `-d` → Menjalankan container di background (detached mode).
-   `--build` → Membangun ulang image jika ada perubahan.

Untuk memastikan semua container berjalan, gunakan:

```sh
docker ps
```

Jika semua berjalan normal, kamu akan melihat **nginx, php, mysql, dan redis** dalam daftar container aktif. 🎯

---

## 🔥 4. Instal Dependensi Laravel

Jalankan perintah berikut untuk menginstal dependensi Laravel:

```sh
docker exec -it ramarmalia-laravel composer install --optimize-autoloader --no-dev
```

Kemudian, jalankan migrasi database:

```sh
docker exec -it ramarmalia-laravel php artisan migrate --seed
```

---

## 🛠️ 5. Set Permission Storage

Pastikan direktori `storage` dan `bootstrap/cache` memiliki izin yang benar:

```sh
docker exec -it ramarmalia-laravel chmod -R 777 storage bootstrap/cache
```

---

## 🚀 6. Akses Website

Sekarang, buka browser dan akses proyek ini melalui:

```
http://localhost
```

🎉 **Selamat! Laravel + FrankenPHP + Docker sudah berjalan!** 🎉

---

## 🛑 7. Menghentikan dan Menghapus Container

Jika ingin menghentikan layanan, jalankan:

```sh
docker-compose down
```

Untuk menghapus seluruh container dan volume:

```sh
docker-compose down -v
```

⚠️ **Hati-hati!** Perintah `-v` akan menghapus semua data database. 🚨

---

## 📌 8. Debugging & Troubleshooting

Jika ada kendala, cek log dengan perintah:

```sh
docker logs -f ramarmalia-laravel
```

Atau masuk ke dalam container untuk debugging:

```sh
docker exec -it ramarmalia-laravel sh
```

---

## 🎯 Selesai!

Sekarang kamu bisa mulai mengembangkan proyek ini! 🚀

Jangan lupa ⭐ **star repository ini** jika bermanfaat!  
Happy coding! 🎉
