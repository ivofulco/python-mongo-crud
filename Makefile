mongdb-community-docker:
	docker pull mongodb/mongodb-community-server;
	docker run --name mongo -e MONGO_INITDB_ROOT_USERNAME=user -e MONGO_INITDB_ROOT_PASSWORD=password -p 27017:27017 -v /home/${USER}/.docker/desktop/vms/0/data/mongodb:/var/lib/mongodb/data -d mongo
	docker container ls;

#docker exec -it mongo mongosh
#db.runCommand(
#   {
#      hello: 1
#   }
#)

#source demo/bin/activate
#pip install -r requirements.txt
#mongodb://localhost:27017


install-mongo-shell:
	wget -qO- https://www.mongodb.org/static/pgp/server-6.0.asc | sudo tee /etc/apt/trusted.gpg.d/server-6.0.asc;
	sudo apt-get install gnupg;
	wget -qO- https://www.mongodb.org/static/pgp/server-6.0.asc | sudo tee /etc/apt/trusted.gpg.d/server-6.0.asc;
	echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list;
	sudo apt-get update -y;
	sudo apt-get install -y mongodb-mongosh;
	sudo apt-get install -y mongodb-mongosh-shared-openssl11;
	sudo apt-get install -y mongodb-mongosh-shared-openssl3;
	mongosh --version;

mongo-schema: install-mongo-shell
	mongosh --file create-schema.js


mongo-load-data:
	curl -X POST -H "Content-type: application/json" -d "{\"book\" : \"John\", \"pages\" : \"5\"}" "localhost:5000/books"
#curl -X POST -H "Content-type: application/json" -d "{\"book\" : \"John\", \"pages\" : \"5\"}" "localhost:5000/books"

