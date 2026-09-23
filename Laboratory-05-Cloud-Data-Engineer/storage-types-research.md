# Types of Cloud Storage

| Storage Type   | Description                                                                 | Primary Use Case                                      | Cloud Provider Example |
|-----------------|-------------------------------------------------------------------------------|---------------------------------------------------------|--------------------------|
| Block Storage   | Splits data into fixed-size blocks, each with a unique address, and attaches directly to a server like a raw hard drive. | Databases, OS boot volumes, applications needing high-speed, low-latency read/write. | AWS EBS |
| File Storage    | Organizes data in a hierarchical structure of files and folders, accessed over a network by multiple systems at once. | Shared file systems, content repositories, home directories, dev environments. | AWS EFS |
| Object Storage  | Stores data as discrete objects (data + metadata + unique ID) in a flat address space, accessed via HTTP/API calls. | Storing unstructured data at massive scale — images, videos, backups, static website assets. | AWS S3 |

## Why Object Storage for Client Photos

Object storage is the best fit for the client's photo-sharing app because it can scale to millions of files without worrying about drive limits or complex directory structures. Each photo is stored as an independent object accessible via a simple URL/API, making it easy to serve images directly to users at scale. It's also more cost-effective and durable than block storage for storing large volumes of static, rarely-modified files like user-uploaded images.
