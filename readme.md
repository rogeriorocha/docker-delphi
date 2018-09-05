# delphi-sample-odbc

Conteiner Docker image running Embarcadero RAD Studio PAServer (**P**latform **A**ssistant **S**erver **A**pplication) and unixODBC connection with SQL Server.

## Getting Started

Conteiner embledded with:

| item                 | version |
| ---------------------|---------|
| SO Ubuntu            | 18.04   |
| unixODBC             | 2.3.4   |
| SQL Server Driver    | 17.0    |

### Prerequisites

- [Docker](https://docs.docker.com/install/). *With windows i recommend toolbox version*

### running conteiner

start conteiner

```sh
$ docker run  --name delphi -p 64211:64211 -p 8080:8080 -t -i -e ODBC_SERVER=tcp:172.18.10.157,2001 -e ODBC_NAME=HOMO -e PASERVER_PASSWORD=1234 rogeriosilvarocha/delphi-sample-odbc
```

Enviroment variables:

| variable           | description                       |
| -------------------|-----------------------------------|
| ODBC_SERVER        | ODBC server connection            |
| ODBC_NAME          | ODBC DNS NAME                     |
| PASERVER_PASSWORD  | PAServer RAD Studio Password     |

Test connection
```sh
$ isql -v HOMO rpsr 'psw'
```

execute command in SQL Server

```sql
select 1
```

## Running the tests

Explain how to run the automated tests for this system


## Deployment

Build docker image:

```sh
docker build -t rogeriosilvarocha/delphi-sample-odbc .
```


## Built With

* [Docker](https://www.docker.com/) - DevOps

## Contributing

Please read [CONTRIBUTING.md](https://github.com/rogeriorocha/delphi-sample-odbc/contributors) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Rogerio Rocha** - *Initial work* - [RogerioRocha](https://github.com/rogeriorocha)

See also the list of [contributors](https://github.com/delphi-sample-odbc/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc
