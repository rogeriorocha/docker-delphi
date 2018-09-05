# About
Conteiner Docker image:

| item                 | version |
| ---------------------|---------|
| SO Ubuntu            | 18.04   |
| unixODBC             | 2.3.4   |
| SQL Server Driver    | 17.0    |


# Requires
- [Docker](https://docs.docker.com/install/). *With windows i recommend toolbox version*

# run conteiner
```sh
$ docker run  --name delphi -p 64211:64211 -p 8080:8080 -t -i -e ODBC_SERVER=tcp:172.18.10.157,2001 -e ODBC_NAME=HOMO -e PASERVER_PASSWORD=1234 rogeriosilvarocha/delphi-sample-odbc
```

Enviroment variables:

| variable           | description                       |
| -------------------|-----------------------------------|
| ODBC_SERVER        | ODBC server connection            |
| ODBC_NAME          | ODBC DNS NAME                     |
| PASERVER_PASSWORD  | PAServer RAD Studio Password     |


## Enter conteiner via bash
```sh
$ docker exec -it $(docker ps -f name=delphi -q) bash
```

## Test connection
```sh
$ isql -v HOMO rpsr 'senha'
```

```sql
select 1
```
