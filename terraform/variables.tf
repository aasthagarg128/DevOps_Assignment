variable "region"{
    default= "ap-south-1"
}

variables "instance-type"{
    default= "t2.micro"
}

variable "worker_count"{
    default= 3
}

variable "key_name"{
    description= "SSH key pair name" 
}