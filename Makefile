setup:
    #Initialize the build environment
	python3 -m venv ~/.microblog && \
	. ~/.microblog/bin/activate && \
	pip install --upgrade pip && \
	pip install ansible && \
	pip install ansible-lint && \
	pip install cfn-lint && \
	pip install -r src/requirements.txt && \
	ansible-playbook -vv -i ansible/buildserver ansible/site.yml --tags setup

lint:
	#Ansible,Dockerfile and CFN linting
	. ~/.microblog/bin/activate && \
	ansible-lint ansible/site.yml -x 305 && \
	cfn-lint --template ansible/roles/buildservers/files/cloudformation/*.yml && \
	docker run --rm -i hadolint/hadolint < Dockerfile

build:
	#Build microblog image
	. ~/.microblog/bin/activate && \
	ansible-playbook -i ansible/buildserver ansible/site.yml --tags build

push:
	#Push docker image to ECR repository
	. ~/.microblog/bin/activate && \
	ansible-playbook -i ansible/buildserver ansible/site.yml --tags push

deploy:
	#k8s cluster deploy
	. ~/.microblog/bin/activate && \
	ansible-playbook -i ansible/buildserver ansible/site.yml --tags deploy