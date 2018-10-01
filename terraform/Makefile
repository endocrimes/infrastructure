.PHONY: fmt
fmt:
	@echo "=> Formatting terraform"
	@terraform fmt

.PHONY: lint
lint:
	@echo "=> Linting terraform"
	@terraform validate

.PHONY: plan
plan:
	@echo "=> Planning"
	@terraform plan -out terraform.plan.old

terraform.plan.old: *.tf
	@make plan

.PHONY: apply
apply: terraform.plan.old
	@echo "=> Applying"
	@terraform apply terraform.plan.old
