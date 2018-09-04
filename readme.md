## Build image
 docker build -t rogeriosilvarocha/delphi-sample-odbc .

## run
  docker run -p 64211:64211 -p 8080:8080 -t -i -e ODBC_SERVER=tcp:127.18.10.157,2001 -e ODBC_NAME=HOMO rogeriosilvarocha/delphi-sample-odbc


### Test 
into-> isql -v HOMO rpsr 'senha'