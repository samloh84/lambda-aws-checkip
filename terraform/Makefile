SHELL := /bin/bash
.SHELLFLAGS := -ec

.PHONY: apply output refresh destroy var_file

TERRAFORM_TFVARS_FILE_PATTERNS := *.tfvars *.tfvars.json

define _LOAD_AWSRC :=
	if [[ -f "$${HOME}/.awsrc" ]]; then \
		source "$${HOME}/.awsrc"; \
	fi; \
	if [[ -f "$(CURDIR)/.awsrc" ]]; then \
		source "$(CURDIR)/.awsrc";  \
	fi
endef

define _SET_TERRAFORM_VAR_FILE_ARGS :=
	if [[ ! -z "$(TERRAFORM_TFVARS_FILE_PATTERNS)" ]]; then \
		TERRAFORM_TFVARS_FILE_PATTERNS=($(TERRAFORM_TFVARS_FILE_PATTERNS)); \
	else \
		TERRAFORM_TFVARS_FILE_PATTERNS=(); \
	fi; \
	TERRAFORM_VAR_FILE_ARGS=(); \
	for TERRAFORM_TFVARS_FILE_PATTERN in $${TERRAFORM_TFVARS_FILE_PATTERNS[@]}; do \
		for TERRAFORM_TFVARS_FILE in $$(find $(CURDIR) -name "$${TERRAFORM_TFVARS_FILE_PATTERN}"); do \
			TERRAFORM_VAR_FILE_ARGS+=("-var-file" "$${TERRAFORM_TFVARS_FILE}"); \
		done; \
	done
endef

define _SET_CENTOS_WORKLOADS_PRIVATE_IPS :=
	TERRAFORM_OUTPUT_PROJECT=$$(terraform output project); \
	TERRAFORM_OUTPUT_OWNER=$$(terraform output owner); \
	AWS_FILTERS=("--filters"); \
	AWS_FILTERS+=("Name=instance-state-name,Values=running"); \
	AWS_FILTERS+=("Name=tag:Name,Values=$${TERRAFORM_OUTPUT_PROJECT}-centos-workload"); \
	AWS_FILTERS+=("Name=tag:Project,Values=$${TERRAFORM_OUTPUT_PROJECT}"); \
	AWS_FILTERS+=("Name=tag:Owner,Values=$${TERRAFORM_OUTPUT_OWNER}"); \
	AWS_EC2_DESCRIBE_INSTANCES_OUTPUT="$$(aws ec2 describe-instances $${AWS_FILTERS[@]})"; \
	CENTOS_WORKLOADS_PRIVATE_IPS=("$$(echo "$${AWS_EC2_DESCRIBE_INSTANCES_OUTPUT}" | jq -r '.Reservations[].Instances[].PrivateIpAddress' )")
endef

define _SET_WINDOWS_WORKLOADS_PRIVATE_IPS :=
	TERRAFORM_OUTPUT_PROJECT=$$(terraform output project); \
	TERRAFORM_OUTPUT_OWNER=$$(terraform output owner); \
	AWS_FILTERS=("--filters"); \
	AWS_FILTERS+=("Name=instance-state-name,Values=running"); \
	AWS_FILTERS+=("Name=tag:Name,Values=$${TERRAFORM_OUTPUT_PROJECT}-windows-workload"); \
	AWS_FILTERS+=("Name=tag:Project,Values=$${TERRAFORM_OUTPUT_PROJECT}"); \
	AWS_FILTERS+=("Name=tag:Owner,Values=$${TERRAFORM_OUTPUT_OWNER}"); \
	AWS_EC2_DESCRIBE_INSTANCES_OUTPUT="$$(aws ec2 describe-instances $${AWS_FILTERS[@]})"; \
	WINDOWS_WORKLOADS_PRIVATE_IPS=("$$(echo "$${AWS_EC2_DESCRIBE_INSTANCES_OUTPUT}" | jq -r '.Reservations[].Instances[].PrivateIpAddress' )"); \
	WINDOWS_WORKLOADS_INSTANCE_IDS=("$$(echo "$${AWS_EC2_DESCRIBE_INSTANCES_OUTPUT}" | jq -r '.Reservations[].Instances[].InstanceId' )")
endef



define _SET_GUACAMOLE_JUMPHOSTS_PUBLIC_IPS :=
	TERRAFORM_OUTPUT_PROJECT=$$(terraform output project); \
	TERRAFORM_OUTPUT_OWNER=$$(terraform output owner); \
	AWS_FILTERS=("--filters"); \
	AWS_FILTERS+=("Name=instance-state-name,Values=running"); \
	AWS_FILTERS+=("Name=tag:Name,Values=$${TERRAFORM_OUTPUT_PROJECT}-guacamole-jumphost"); \
	AWS_FILTERS+=("Name=tag:Project,Values=$${TERRAFORM_OUTPUT_PROJECT}"); \
	AWS_FILTERS+=("Name=tag:Owner,Values=$${TERRAFORM_OUTPUT_OWNER}"); \
	AWS_EC2_DESCRIBE_INSTANCES_OUTPUT="$$(aws ec2 describe-instances $${AWS_FILTERS[@]})"; \
	GUACAMOLE_JUMPHOSTS_PUBLIC_IPS=("$$(echo "$${AWS_EC2_DESCRIBE_INSTANCES_OUTPUT}" | jq -r .Reservations[].Instances[].PublicIpAddress )")
endef

define _SET_SSH_KEY_PAIR_NAME :=
	SSH_KEY_PAIR_NAME="$$(terraform output key_pair_name)"
endef

all: apply

apply:
	set -euxo pipefail; \
	$(call _LOAD_AWSRC); \
	$(call _SET_TERRAFORM_VAR_FILE_ARGS); \
	TERRAFORM_APPLY_ARGS=("-auto-approve" "$${TERRAFORM_VAR_FILE_ARGS[@]}"); \
	terraform init; \
	terraform apply "$${TERRAFORM_APPLY_ARGS[@]}"

destroy:
	set -euxo pipefail; \
	$(call _LOAD_AWSRC); \
	$(call _SET_TERRAFORM_VAR_FILE_ARGS); \
	TERRAFORM_DESTROY_ARGS=("-auto-approve" "$${TERRAFORM_VAR_FILE_ARGS[@]}"); \
	terraform init; \
	terraform destroy "$${TERRAFORM_DESTROY_ARGS[@]}"

refresh:
	set -euxo pipefail; \
	$(call _LOAD_AWSRC); \
	$(call _SET_TERRAFORM_VAR_FILE_ARGS); \
	TERRAFORM_REFRESH_ARGS=("$${TERRAFORM_VAR_FILE_ARGS[@]}"); \
	terraform init; \
	terraform refresh "$${TERRAFORM_REFRESH_ARGS[@]}"

output:
	set -euxo pipefail; \
	$(call _LOAD_AWSRC); \
	terraform init; \
	terraform output

lambda:
	set -euxo pipefail; \
	cd ../ && npm run zip