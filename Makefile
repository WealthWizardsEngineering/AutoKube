test:
	@ ./test/git2consul_config.sh
	@ docker-compose -f test/docker-compose.yml up -d init
	@ if ! docker-compose -f test/docker-compose.yml run --user $(shell id -u):$(shell id -g) test; then \
		docker-compose -f test/docker-compose.yml logs; \
		docker-compose -f test/docker-compose.yml down; \
		rm -f ./test/git2consul_config.json; \
		false; \
	  fi
	@ docker-compose -f test/docker-compose.yml down
	@ rm -f ./test/git2consul_config.json
.PHONY: test

tinker:
	docker-compose -f test/docker-compose.yml run test /bin/sh
.PHONY: tinker

clean-up:
	docker-compose -f test/docker-compose.yml down -v
.PHONY: clean-up
