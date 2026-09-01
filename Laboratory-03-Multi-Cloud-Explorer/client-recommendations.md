# Client Recommendations

## Client A – Startup Company
**Scenario:** A startup company wants to launch a new mobile application. Their budget is limited, but they expect rapid growth within the next few years.

**Recommended Platform:** Google Cloud Platform (GCP)

**Explanation:**
GCP is a strong fit for a budget-conscious startup because of its pay-as-you-go pricing with automatic sustained-use discounts, meaning costs scale down naturally without requiring long-term commitments. Its serverless and managed services reduce the need for a large DevOps team early on, which keeps operational costs low. As the app grows, GCP's global network and container tools (Kubernetes/GKE) make it easy to scale the mobile backend without re-architecting. GCP also offers generous free-tier credits that are attractive for early-stage startups.

**Services to use:**
1. Cloud Functions (serverless backend for mobile API)
2. Firebase (mobile app backend, authentication, real-time database)
3. Cloud Storage (storing user-uploaded content/media)

## Client B – University
**Scenario:** A university already uses Windows Server, Microsoft 365, and Active Directory, and wants to migrate some services to the cloud.

**Recommended Platform:** Microsoft Azure

**Explanation:**
Azure is the clear choice because the university's existing infrastructure is already built on Microsoft products. Azure Active Directory integrates directly with the university's current Active Directory setup, allowing a smoother identity migration with minimal disruption to student and staff accounts. Azure also offers education-specific pricing and grant programs. Because Windows Server workloads are natively supported, the university can move services to the cloud gradually through a hybrid approach rather than an all-at-once migration.

**Services to use:**
1. Azure Active Directory (identity and access management)
2. Azure Virtual Machines (hosting migrated Windows Server workloads)
3. Microsoft 365 cloud integration / Azure Files (shared storage for departments)

## Client C – AI Research Company
**Scenario:** A research company develops Artificial Intelligence and Machine Learning applications that require high-performance computing.

**Recommended Platform:** Google Cloud Platform (GCP)

**Explanation:**
GCP is the strongest choice for AI/ML workloads since Google developed TensorFlow and offers Vertex AI, a unified platform for building, training, and deploying machine learning models. GCP also provides access to specialized hardware like TPUs (Tensor Processing Units), which are optimized specifically for machine learning training and not widely available elsewhere. Its data analytics tools like BigQuery also let researchers process massive datasets efficiently alongside their AI workloads.

**Services to use:**
1. Vertex AI (model training and deployment)
2. Compute Engine with GPU/TPU support (high-performance computing)
3. BigQuery (large-scale data analysis)

## Client D – Global E-Commerce Company
**Scenario:** A multinational online shopping company serves customers around the world and requires highly available infrastructure with automatic scaling.

**Recommended Platform:** Amazon Web Services (AWS)

**Explanation:**
AWS is best suited for a global e-commerce company due to its unmatched number of regions and availability zones, ensuring low latency and high availability for customers worldwide. AWS's auto-scaling capabilities and load balancing services are mature and battle-tested, having powered Amazon's own retail platform for years. Its broad service catalog also covers everything an e-commerce business needs, from payments to recommendation engines, all within one ecosystem.

**Services to use:**
1. Amazon EC2 with Auto Scaling (handling traffic spikes)
2. Amazon RDS (managing product and order databases)
3. Amazon CloudFront (global content delivery for fast page loads)
