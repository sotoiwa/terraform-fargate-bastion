#!/bin/sh

# SSM サービスロール名
SSM_SERVICE_ROLE_NAME="fargate-bastion-ssm-service-role"

# アクティベーションコードの作成
SSM_ACTIVATION=$(aws ssm create-activation \
  --default-instance-name "bastion" \
  --iam-role ${SSM_SERVICE_ROLE_NAME} \
  --registration-limit 1 \
  --tags Key=Type,Value=Bastion \
  --region ${AWS_REGION})

SSM_ACTIVATION_ID=$(echo ${SSM_ACTIVATION} | jq -r .ActivationId)
SSM_ACTIVATION_CODE=$(echo ${SSM_ACTIVATION} | jq -r .ActivationCode)

# インスタンスの登録
amazon-ssm-agent -register -code "${SSM_ACTIVATION_CODE}" -id "${SSM_ACTIVATION_ID}" -region ${AWS_REGION}

# アクティベーションコードの削除
aws ssm delete-activation --activation-id ${SSM_ACTIVATION_ID}

# SSM エージェントを実行
amazon-ssm-agent
