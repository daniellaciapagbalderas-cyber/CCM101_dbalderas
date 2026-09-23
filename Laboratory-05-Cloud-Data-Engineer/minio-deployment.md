# MinIO Deployment Documentation

## Docker Command Used
```bash
docker run -d -p 9000:9000 -p 9001:9001 --name minio-server \
-e "MINIO_ROOT_USER=cloudadmin" \
-e "MINIO_ROOT_PASSWORD=CloudNova2026!" \
minio/minio server /data --console-address ":9001"
```

## Access Details
- **Web Console Port:** 9001
- **API Port:** 9000
- **Bucket Created:** client-photos

## Environment Variables Explained
- `MINIO_ROOT_USER`: Sets the admin username used to log in to the MinIO console/API. Acts as the root access key.
- `MINIO_ROOT_PASSWORD`: Sets the admin password (secret key) paired with the root user for authentication.

These environment variables configure the root credentials at container startup, securing access to the storage server and its web console.
