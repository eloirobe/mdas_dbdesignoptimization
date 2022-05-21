help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

init: clean up ## Initialize the project execution environment (compiles and starts docker containers)

up: ## Start all containers
	mkdir -p datadir
	docker compose up -d 

stop: ## Stop all container
	docker compose stop 

down: ## Down all container
	docker compose down

clean: ## Down and clean colume
	docker compose down -v 

load-emoloyees-db: ## Load employees db
	docker compose exec db sh -c 'mysqladmin -f -s  -u root -p$$MYSQL_ROOT_PASSWORD drop employees || true'
	docker compose exec db sh -c 'rm -fr /opt/datadir/employees-db'
	docker compose exec db sh -c 'mkdir -p /opt/datadir/employees-db'
	docker compose exec -w /opt/datadir/employees-db/ db sh -c 'git clone https://github.com/datacharmer/test_db.git' 
	docker compose exec -w /opt/datadir/employees-db/test_db/ db sh -c 'mysql -uroot  -p$$MYSQL_ROOT_PASSWORD < /opt/datadir/employees-db/test_db/employees.sql'

load-airport-db: ## Load airport db
	docker compose exec db sh -c 'mysqladmin -f -s  -u root -p$$MYSQL_ROOT_PASSWORD drop airportdb || true'
	docker compose exec db sh -c ' rm -fr /opt/datadir/airport-db'
	docker compose exec -w /opt/datadir/ db sh -c 'wget -O airport-db.tar.gz "https://lasalleuniversities-my.sharepoint.com/:u:/g/personal/eloi_rocamora_salle_url_edu/EYwebJSSe6tLiw9ortPoX0EBcsebHr-LtPYPtsAFLSIkLg?e=hffBGF&download=1"'
	docker compose exec -w /opt/datadir/ db sh -c 'tar xvzf airport-db.tar.gz'
	docker compose exec -w /opt/datadir/ db sh -c 'mysqlsh root@localhost -p$$MYSQL_ROOT_PASSWORD -- util load-dump /opt/datadir/airport-db --defer-table-indexes=all --ignore-version=true'

load-world-db: ## Load World db
	docker compose exec db sh -c 'mysqladmin -f -s  -u root -p$$MYSQL_ROOT_PASSWORD drop world_x || true'
	docker compose exec db sh -c ' rm -fr /opt/datadir/world_x-db'
	docker compose exec db sh -c ' rm -fr /opt/datadir/world_x-db.tar.gz'
	docker compose exec -w /opt/datadir/ db sh -c 'wget https://downloads.mysql.com/docs/world_x-db.tar.gz'
	docker compose exec -w /opt/datadir/ db sh -c 'tar xvzf world_x-db.tar.gz'
	docker compose exec -w /opt/datadir/ db sh -c 'mysql -uroot  -p$$MYSQL_ROOT_PASSWORD < /opt/datadir/world_x-db/world_x.sql '

load-flights-db: ## Load Flights db
	docker compose exec db sh -c 'mysqladmin -f -s  -u root -p$$MYSQL_ROOT_PASSWORD drop flightdb2 || true'
	docker compose exec -w /opt/datadir/ db sh -c 'gunzip < /opt/datadir/dumpflightdb2.sql.gz  | mysql -uroot  -p$$MYSQL_ROOT_PASSWORD'

bash: ## Enter commandline
	docker compose exec db bash