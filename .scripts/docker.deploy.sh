#!/usr/bin/env bash
echo "$DOCKER_PASS" | docker login -u $DOCKER_USER --password-stdin
docker pull $TRAVIS_REPO_SLUG:$TRAVIS_COMMIT
docker tag $TRAVIS_REPO_SLUG:$TRAVIS_COMMIT $TRAVIS_REPO_SLUG:latest
docker push $TRAVIS_REPO_SLUG