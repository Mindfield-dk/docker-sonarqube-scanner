# Docker SonarQube Scanner
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Flocalgod%2Fdocker-sonarqube-scanner.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2Flocalgod%2Fdocker-sonarqube-scanner?ref=badge_shield)


[The SonarQube Scanner](http://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner) is recommended as the default launcher to analyse a project with SonarQube.

## Prerequisite

A `sonar-project.properties` (or it's equivalent in dynamic configuration) is required in the root of you project with as a minimum the following values:

```
sonar.projectKey=uniqueKey
sonar.projectName=Project Name
sonar.projectVersion=0.0.1
sonar.sources=.
sonar.projectDescription=Project Description
```

## Run

By default `https://sonarcloud.io` is assumed to be the server to connect to.

    docker run --rm --user $(id -u):$(id -g) -w /data -v $(pwd):/data localgod/docker-sonarqube-scanner:3.0.3.778 <parameters_if_required>

You can override this by providing the server name as a environment variable:

    docker run --rm --user $(id -u):$(id -g) -e "SONAR_HOST=http://localhost:9000" -w /data -v $(pwd):/data localgod/docker-sonarqube-scanner:3.0.3.778 <parameters_if_required>


## License
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Flocalgod%2Fdocker-sonarqube-scanner.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2Flocalgod%2Fdocker-sonarqube-scanner?ref=badge_large)