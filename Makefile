test:
	docker-compose -f test/docker-compose.yml run test
.PHONY: test

tinker:
	docker-compose -f test/docker-compose.yml run test /bin/sh
.PHONY: tinker

clean-up:
	docker-compose -f test/docker-compose.yml down -v
.PHONY: clean-up