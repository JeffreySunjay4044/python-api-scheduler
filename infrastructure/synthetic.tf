
resource "datadog_synthetics_test" "datadog-synthetic" {
  type    = "api"
  subtype = "http"
  request_definition {
    method = "GET"
    url    = var.request_url
    port   = 443
  }
  request_headers {
    Content-Type   = "application/json"
    Authentication = var.authentication_token
  }
  assertion {
    type     = "statusCode"
    operator = "is"
    target   = var.expected_status_code
  }
  locations = [var.region]
  options_list {
    tick_every = 900

    retry {
      count    = 2
      interval = 300
    }

    monitor_options {
      renotify_interval = 100
    }
  }
  name    = var.name
  message = "Notify @test"
  tags    = ["env:test"]

  status = "live"
}
