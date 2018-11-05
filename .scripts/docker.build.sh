#!/usr/bin/env bash
echo "$DOCKER_PASS" | docker login -u $DOCKER_USER --password-stdin
docker build -t $TRAVIS_REPO_SLUG:$TRAVIS_COMMIT .
docker push $TRAVIS_REPO_SLUG