# Build image
> docker build -t rogeriosilvarocha/delphi-sample-odbc .

# run conteiner
> docker run  --name delphi -p 64211:64211 -p 8080:8080 -t -i -e ODBC_SERVER=tcp:172.18.10.157,2001 -e ODBC_NAME=HOMO -e PASERVER_PASSWORD=1234 rogeriosilvarocha/delphi-sample-odbc


## Enter conteiner via bash
> docker exec -it $(docker ps -f name=delphi -q) bash

## Test 
> isql -v HOMO rpsr 'senha'
