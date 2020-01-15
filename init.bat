docker build -t iplamp:0.1 -f .
docker run --publish 8080:80 --publish 8022:22 --rm --name teste1 -dit iplamp:0.1
echo informe a senha para o usuário git:
docker exec -ti teste1 passwd git