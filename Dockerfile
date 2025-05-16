# Gunakan image Ubuntu sebagai dasar
FROM ubuntu:22.04

# Install curl dan chmod
RUN apt update && apt install -y curl && apt clean

# Buat folder kerja di dalam container
WORKDIR /app

# Salin file binary PocketBase ke dalam container
COPY pocketbase /pocketbase

# Salin folder data (pb_data) dan migrasi (pb_migrations)
COPY pb_data /data/pb_data
COPY pb_migrations /data/migration

# Buka port 8090 agar bisa diakses dari luar
EXPOSE 8090

# Jalankan PocketBase saat container di-start
CMD ["/pocketbase", "serve", "--http=0.0.0.0:8090"]
