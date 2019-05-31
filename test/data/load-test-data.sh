#!/usr/bin/env sh

for f in /usr/test/data/*.json
do
	consul kv import @$f
done