database:
	echo "Running PostgreSQL and PostGIS instance."
	bash bin/deploy_brain.sh 9001 v1.1.2

jupyter:
	echo "Running Jupyter instance."
	jupyter notebook