data "http" "agentip" {
  url    = "http://icanhazip.com"
  method = "GET"
}