data "aws_ssm_parameter" "github_token" {
  name = "GitHubOAuthToken"
}

resource "aws_cloudformation_stack" "app" {
  depends_on = [ data.aws_ssm_parameter.github_token ]
  name = "analytics-application-pipeline"
  capabilities = ["CAPABILITY_IAM"]
  parameters = {
    GitHubOAuthToken = "GitHubOAuthToken"
  }
  template_body = file("./cloudformation/pipeline.yml")
}
