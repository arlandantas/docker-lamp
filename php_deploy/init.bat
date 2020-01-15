docker build -t ipphpdeploy:0.1 .
docker run --publish 8080:80 --publish 8022:22 --rm --name testedepphp1 -dit ipphpdeploy:0.1
echo informe a senha para o usuário ipsuporte:
docker exec -ti testedepphp1 passwd ipsuporte