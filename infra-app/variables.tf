variable "env"{

        description="This is an Enviornment"
        type=string
}

variable "bucket_name"{

        description="This is an name given to the bucket"
        type=string
}

variable "instance_count"{

        description="This is a number of count of instance"
        type=number
}

variable "instance_type"{

        description="This is an instance type for ec2 infra"
        type=string
}

variable "ec2_ami_id"{

        description="This is an ami of of ec2 instance"
        type=string
}

variable "hash_key"{

        description="This is an hash key on an instance"
        type=string
}

variable "public_key" {
  description = "Public key for EC2"
  type        = string
}
