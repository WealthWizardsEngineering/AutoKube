test:
	@ ./test/git2consul_config.sh
	@ docker-compose -f test/docker-compose.yml run test
	@ docker-compose -f test/docker-compose.yml down
	@ rm -f ./test/git2consul_config.json
.PHONY: test

tinker:
	docker-compose -f test/docker-compose.yml run test /bin/sh
.PHONY: tinker

clean-up:
	docker-compose -f test/docker-compose.yml down -v
.PHONY: clean-up