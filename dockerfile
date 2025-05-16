# Dockerfile untuk menjalankan PocketBase

FROM alpine:latest

# Install bash dan unzip (dibutuhkan)
RUN apk add --no-cache bash

# Buat direktori kerja
WORKDIR /app

# Copy semua isi folder ke image Docker
COPY . .

# Buka port default PocketBase
EXPOSE 8090

# Jalankan PocketBase dengan file database dari pb_data
CMD ["./pocketbase", "serve", "--dir", "pb_data", "--publicDir", "public"]
