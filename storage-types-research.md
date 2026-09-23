# Storage Types Research

| Storage Type | Description | Primary Use Case | Cloud Provider Example |
|---|---|---|---|
| Block Storage | Splits data into fixed-size blocks and stores them on raw disk volumes attached to a server. | Databases, virtual machine disks, applications needing low-latency read/write. | AWS EBS |
| File Storage | Organizes data in a hierarchical folder/file structure shared over a network. | Shared file access across multiple servers or users, content management systems. | AWS EFS |
| Object Storage | Stores data as discrete objects (data + metadata + unique ID) in a flat address space. | Unstructured data at massive scale: images, videos, backups, static website assets. | AWS S3 |

Object Storage is the best choice for the client's photo-sharing application because it is built to handle massive amounts of unstructured data like images without a rigid folder hierarchy. It also scales virtually without limit and each object is directly accessible over HTTP, making it easy to serve millions of user-uploaded photos efficiently and reliably.
