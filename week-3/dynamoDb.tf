resource "aws_dynamodb_table" "dynamodb-table" {
  name           = "Test"
  hash_key       = "UserId"
  read_capacity = 1
  write_capacity = 1

  attribute {
    name = "UserId"
    type = "S"
  }
}