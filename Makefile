init:
	terraform init

validate:
	terraform validate

plan:
	terraform plan -out=tfplan

apply:
	terraform apply -auto-approve tfplan

destroy:
	terraform destroy -auto-approve