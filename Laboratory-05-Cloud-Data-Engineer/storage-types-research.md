# Checkpoint 2 - Research: Types of Cloud Storage

| Storage Type | Description | Primary Use Case | Cloud Provider Example |
|---|---|---|---|
| Block Storage | Stores data as blocks that can be attached to a virtual machine like a hard disk. | Best for operating systems, databases, and applications that need fast and direct disk access. | AWS EBS |
| File Storage | Stores data as files in folders and directories that can be accessed through a shared file system. | Best for shared files, content management systems, and applications that need multiple users or servers to access the same files. | AWS EFS |
| Object Storage | Stores data as objects along with metadata and a unique identifier inside a storage bucket. | Best for images, videos, backups, documents, and other large amounts of unstructured data. | AWS S3 |

## Recommendation for User-Uploaded Images

Object Storage is the best choice for storing user-uploaded images because it is designed to handle large amounts of unstructured data such as photos and other media files. It is also highly scalable and makes it easy for applications to store and retrieve images without managing traditional file systems or disks.
