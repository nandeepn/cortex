#!/bin/bash

# Copyright 2020 Cortex Labs, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e

EKSCTL_TIMEOUT=45m

echo -e "spinning down the cluster ...\n"

eksctl delete cluster --wait --name=$CORTEX_CLUSTER_NAME --region=$CORTEX_REGION --timeout=$EKSCTL_TIMEOUT

echo -e "\n✓ please check CloudFormation to ensure that all resources for the ${CORTEX_CLUSTER_NAME} cluster eventually become successfully deleted: https://console.aws.amazon.com/cloudformation/home?region=${CORTEX_REGION}#/stacks?filteringText=-${CORTEX_CLUSTER_NAME}-"
