setup:
    #Initialize the build environment
	python3 -m venv ~/.microblog && \
	. ~/.microblog/bin/activate && \
	pip install --upgrade pip && \
	pip install ansible && \
	pip install ansible-lint && \
	pip install -r src/requirements.txt && \
	ansible-playbook -vv -i ansible/buildserver ansible/site.yml --tags lint

lint:
	#Ansible and Dockerfile linting
	. ~/.microblog/bin/activate && \
	ansible-lint ansible/site.yml -x 305 && \
	docker run --rm -i hadolint/hadolint < Dockerfile

build:
	#Build microblog image
	ansible-playbook -i ansible/buildserver ansible/site.yml --tags build