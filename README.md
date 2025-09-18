Cloud Resume Challenge – Full Stack on AWS (Terraform + GitHub Actions)

A production-style implementation of the Cloud Resume Challenge using:

Frontend: Static site in S3, served via CloudFront (OAC), custom domain in Route 53

Backend: API Gateway (HTTP API) → Lambda (Python) → DynamoDB (visitor counter)

IaC: Terraform (remote state in S3)

CI/CD: GitHub Actions for backend (Terraform) and frontend (S3 sync + CloudFront invalidation)


Architecture


graph TD
  A[User Browser] -->|HTTPS| CF[Amazon CloudFront<br/>Alias: your domain]
  CF --> S3[S3 Bucket<br/>Private static site]
  CF --> AGW[API Gateway HTTP API]
  AGW --> L[Lambda (Python)]
  L --> DDB[(DynamoDB VisitorCount)]
  R53[Route 53 DNS] --> CF
  ACM[ACM Cert<br/>us-east-1] --> CF

