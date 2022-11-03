variable "region" {
    default =   "us-west-2"
}

variable "imageId" {
    default =   "ami-08e2d37b6a0129927"
}

variable "instanceType" {
    default =   "t2.micro"
}

variable "bucketName" {
    default =   "alkor-r37-bucket"
}

variable "dbPort" {
    default =   "5432"
}

variable "rdsFile" {
    default =   "rds-script.sql"
}

variable "dynamoFile" {
    default =   "dynamodb-script.sh"
}