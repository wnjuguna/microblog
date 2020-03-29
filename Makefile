setup:
	python3 -m venv ~/.microblog && \
	. ~/.microblog/bin/activate && \
	pip install --upgrade pip && \
	pip install ansible && \
	pip install -r src/requirements.txt
