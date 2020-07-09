<h1 align="center">Rogalabs Test API</h1>

<p align="center">
  <a href="https://github.com/tiagoleal/coin_conversion">
    <img alt="Current Version" src="https://img.shields.io/badge/version-1.0.0 -blue.svg">
  </a>
  <a href="https://ruby-doc.org/core-2.6.2/">
    <img alt="Ruby Version" src="https://img.shields.io/badge/Ruby-2.6.2 -brightgreen.svg" target="_blank">
  </a>
  <a href="https://guides.rubyonrails.org/5_2_release_notes.html">
    <img alt="" src="https://img.shields.io/badge/Rails-~> 5.2.4-blue.svg" target="_blank">
  </a>
  <a href="https://www.postgresql.org/">
    <img alt="" src="https://img.shields.io/badge/PostgreSQL-9.5-brightgreen.svg" target="_blank">
  </a>
  
</p>


## Stack the Project

- **Docker**
- **Rails Api**
- **Postgresql**
- **Authentication JWT**


## Features

- **Public:** 
   - Endpoint to user registration;
   - Endpoint to login;
   - Endpoint to Recover Password;

- **With Authentication:** 
    - Edit only logged user data;
    - Update the password only oflogged user;
    - List all registered complaints, with support for pagination;
    - Create and Edit a complaint with the fields description, status,latitude,  longitude, user who created the complaint;
    - Add the action adopted measure in the complaint and change the status;
    - List the complaints with the search per description;
    

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

You must have installed on your machine:

- Docker
- Docker Compose

### Installing

First step is to install the docker service:

```bash
#Linux: ubuntu,Mint
$ sudo apt-get update
$ sudo apt-get install docker-ce
$ sudo apt install docker-compose

# Fedora
$ sudo dnf update -y
$ sudo dnf install docker-ce
$ sudo dnf -y install docker-compose
```

For test if the service was installed with succeed, you can run the command for to check de version of docker:

```bash
$ docker --version
#Must be have the docker version: Docker version 18.06.0-ce
$ docker-compose --version
#Must be have the docker-compose version: docker-compose version 1.22.0
```

## First steps

Follow the instructions to have a project present and able to run it locally.
After copying the repository to your machine, go to the project's root site and:

1.  Construct the container

```
docker-compose build
```

2.  Create of Database

```
docker-compose run --rm app bundle exec rails db:create
```

3. Without turning off the server, open a new window and run the migrations and seeds

```
docker-compose run --rm app bundle exec rails db:migrate db:seed
```

4.  Run the project

```
docker-compose up - d
```

## Authors

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->
[<img src="https://avatars1.githubusercontent.com/u/5727529?s=460&v=4" width="100px;"/><br /><sub><b>Tiago Leal</b></sub>](https://github.com/tiagoleal)<br />
