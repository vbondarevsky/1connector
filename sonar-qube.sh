temp=`cat packagedef | grep ".Версия(" | sed 's|[^"]*"||' | sed -r 's/".+//'`
version=${temp##*|}
if [ "$TRAVIS_SECURE_ENV_VARS" == "true" ]; then
  if [ "$TRAVIS_PULL_REQUEST" != "false" ]; then
    wget -O bsl-language-server.jar https://github.com/1c-syntax/bsl-language-server/releases/download/v0.3.0/bsl-language-server-0.3.0.jar
    java -jar ./bsl-language-server.jar -a -s ./src -r json
    
    sonar-scanner \
        -Dsonar.host.url=https://sonar.silverbulleters.org \
        -Dsonar.analysis.mode=issues \
        -Dsonar.github.pullRequest=$TRAVIS_PULL_REQUEST \
        -Dsonar.github.repository=$TRAVIS_REPO_SLUG \
        -Dsonar.github.oauth=$GITHUB_OAUTH_TOKEN \
        -Dsonar.login=$SONAR_TOKEN \
        -Dsonar.scanner.skip=false

  elif [ "$TRAVIS_BRANCH" == "develop" ] && [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
    wget -O bsl-language-server.jar https://github.com/1c-syntax/bsl-language-server/releases/download/v0.3.0/bsl-language-server-0.3.0.jar
    java -jar ./bsl-language-server.jar -a -s ./src -r json
    sonar-scanner \
        -Dsonar.host.url=https://sonar.oscript.ru \
        -Dsonar.login=$SONAR_TOKEN \
        -Dsonar.projectVersion=$version\
        -Dsonar.scanner.skip=false
  fi
fi

