FROM hashicorp/terraform:latest
RUN apk add --no-cache bash jq
RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        && \
    pip install --upgrade awscli==1.14.5 s3cmd==2.0.1 python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*
ADD https://github.com/gruntwork-io/terragrunt/releases/download/v0.16.11/terragrunt_linux_amd64 /usr/local/bin/terragrunt
RUN chmod +x /usr/local/bin/terragrunt
ENTRYPOINT ["/usr/local/bin/terragrunt"]
