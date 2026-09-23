# Mission 5 Reflection

Object storage is better suited for storing millions of photos compared to a traditional block storage hard drive because it is built to scale horizontally across many servers rather than being limited by the capacity of a single disk. Block storage is designed for structured, frequently-updated data like databases, where low-latency read/write to specific blocks matters. Photos, on the other hand, are unstructured and rarely modified after upload — object storage handles that pattern far more efficiently, storing each photo as a self-contained object with metadata, accessible through a simple API call regardless of how many millions of files exist.

Using Docker made deploying MinIO significantly easier because I didn't need to manually install, configure, or manage dependencies on the host machine. A single `docker run` command with the right environment variables spun up a fully functional S3-compatible server in seconds, with the API and console ports mapped and ready to use. This let me focus on the cloud storage concepts instead of fighting with installation steps.

In the context of cloud storage, a "bucket" is a top-level container used to organize and hold objects (files). It functions similarly to a root folder, and every object stored in that system belongs to exactly one bucket, which can have its own access policies, permissions, and naming rules.

Large enterprise companies ensure their object storage data is not lost during a physical server crash through redundancy — replicating data across multiple physical drives, servers, and often multiple geographic data centers. Techniques like erasure coding and multi-region replication allow the system to reconstruct or recover data even if several storage nodes fail at once.

My confidence in navigating the Linux command line continues to grow with each mission. Tasks that used to feel intimidating — running Docker commands, mapping ports, and managing containers — are becoming more familiar and intuitive. I'm getting more comfortable troubleshooting issues on my own and understanding what each command actually does instead of just copying instructions.
