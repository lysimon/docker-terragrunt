FROM hashicorp/terraform:latest
RUN apk add --no-cache bash
ADD https://github.com/gruntwork-io/terragrunt/releases/download/v0.16.11/terragrunt_linux_amd64 /usr/local/bin/terragrunt
RUN chmod +x /usr/local/bin/terragrunt
ENTRYPOINT ["/usr/local/bin/terragrunt"]
