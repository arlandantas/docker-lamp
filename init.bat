docker build -t iplamp:0.1 -f ./docker/Dockerfile .
docker container rm teste1
docker run --publish 82:80 --rm --name teste1 -dit iplamp:0.1
REM docker run --publish 82:80 --rm --name teste1 -d iplamp:0.1 /bin/sh
REM docker create --publish 82:80 --rm --name teste1 iplamp:0.1
REM docker start teste1