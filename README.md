# Docker SonarQube Scanner

[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Flocalgod%2Fdocker-sonarqube-scanner.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2Flocalgod%2Fdocker-sonarqube-scanner?ref=badge_shield)

[The SonarQube Scanner](https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner) is recommended as the default launcher to analyse a project with SonarQube.

## Official image

There is now an official docker image provided by SonarQube. You can get it [here](https://hub.docker.com/r/sonarsource/sonar-scanner-cli).

## Prerequisite

A `sonar-project.properties` (or it's equivalent in dynamic configuration) is required in the root of you project with as a minimum the following values:

```ini
sonar.projectKey=uniqueKey
sonar.projectName=Project Name
sonar.projectVersion=0.0.1
sonar.sources=.
sonar.projectDescription=Project Description
```

## Run

By default `https://sonarcloud.io` is assumed to be the server to connect to.

```bash
docker run --rm --user $(id -u):$(id -g) -w /data -v $(pwd):/data localgod/docker-sonarqube-scanner:1.1.1 -Dsonar.login=08b0d2062d8e20008c92d29f314ab5bea728448e <more_parameters_if_required>
```

You can override this by providing the server name as an environment variable:

```bash
docker run --rm --user $(id -u):$(id -g) -e "SONAR_HOST=http://localhost:9000" -w /data -v $(pwd):/data localgod/docker-sonarqube-scanner:1.1.1 <parameters_if_required>
```

## License

[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Flocalgod%2Fdocker-sonarqube-scanner.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2Flocalgod%2Fdocker-sonarqube-scanner?ref=badge_large)
