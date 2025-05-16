# Gunakan image Ubuntu sebagai dasar
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Set direktori kerja
WORKDIR /app

# Salin file pocketbase binary ke container
COPY pocketbase /pocketbase

# Salin data PocketBase
COPY pb_data /data/pb_data

# Salin folder migrasi jika ada
COPY pb_migrations /data/pb_migrations

# Buka port 8090
EXPOSE 8090

# Jalankan PocketBase saat container start
CMD ["/pocketbase", "serve", "--dir", "/data"]
