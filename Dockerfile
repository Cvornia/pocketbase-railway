# Mulai dari image Ubuntu versi 22.04
FROM ubuntu:22.04

# Copy binary PocketBase (Linux) ke folder root dalam container
COPY pocketbase /pocketbase

# Copy folder data (pb_data) dan migrasi (jika ada)
COPY pb_data /data/pb_data
COPY migration /data/migration

# Buka port 8090 agar bisa diakses dari luar
EXPOSE 8090

# Jalankan PocketBase: serve di port 8090 dengan data & migrasi
CMD ["/pocketbase", "serve", "--http", "0.0.0.0:8090", "--dir", "/data/pb_data", "--migrations", "/data/migration"]