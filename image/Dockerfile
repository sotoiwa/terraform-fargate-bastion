FROM amazonlinux:2

RUN yum install -y https://s3.ap-northeast-1.amazonaws.com/amazon-ssm-ap-northeast-1/latest/linux_amd64/amazon-ssm-agent.rpm \
    && yum install -y awscli jq shadow-utils util-linux sudo \
    && yum clean all \
    && rm -rf /var/cache/yum

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
