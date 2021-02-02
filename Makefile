default: server

website:
	mkdocs build --clean

clean:
	rm -rf site

serve:
	mkdocs serve

deploy: project-deploy