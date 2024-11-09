data "aws_ssm_parameter" "github_token" {
  name = "GitHubOAuthToken"
}

resource "aws_cloudformation_stack" "app" {
  name = "analytics-application-pipeline"
  capabilities = ["CAPABILITY_IAM"]
  parameters = {
    GitHubOAuthToken = data.aws_ssm_parameter.github_token.value
  }
  template_body = file("./cloudformation/pipeline.yml")
}
