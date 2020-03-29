setup:
	python3 -m venv ~/.microblog && \
	source ~/.microblog/bin/activate && \
	pip install --upgrade pip && \
	pip install ansible && \
	pip install -r requirements.txt
