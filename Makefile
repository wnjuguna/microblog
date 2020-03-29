setup:
    #Initialize the build environment
	python3 -m venv ~/.microblog && \
	. ~/.microblog/bin/activate && \
	pip install --upgrade pip && \
	pip install ansible && \
	pip install ansible-lint &&\
	pip install -r src/requirements.txt

lint:
	#Ansible linting
	. ~/.microblog/bin/activate && \
	ansible-lint ansible/site.yml -x 305