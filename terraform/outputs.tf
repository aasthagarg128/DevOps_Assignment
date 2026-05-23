output "api_public_ip"{
    value=module.compute.api_public_ip
}

output "worker_private_ips"{
    value=module.compute.worker_private_ips
}