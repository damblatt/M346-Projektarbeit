#!/bin/bash

source config.sh

aws iam create-role --role-name $roleName --assume-role-policy-document file://$lambdaPolicySource
