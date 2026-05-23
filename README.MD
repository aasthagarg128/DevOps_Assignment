# Distributed Inference System

## Architecture

Internet → API VM → Private Workers (RPC mesh)

## API Usage

curl -X POST http://<API_IP>/infer \
-H "Content-Type: application/json" \
-d '{"input": 5}'

Response:
{
  "result": 30
}

## Deploy

terraform init
terraform apply

## Notes

- Workers are private (no public IP)
- Only API is public
- RPC uses private IPs

