#!/bin/sh
# Build and install snapshot plugin in Sonar

# Build first and check status
mvn clean license:format install
if [ "$?" != 0 ]; then
	echo "ERROR - Java build failed!" 1>&2
	exit $?
fi

# Run shell tests
#shelltest src/test/shell --execdir --diff
#if [ "$?" != 0 ]; then
#	echo "ERROR - Shell tests failed!" 1>&2
#	exit $?
#fi

# Deploy new version of plugin in Sonar dir
rm target/*sources.jar
cp target/*.jar $SONARQUBE_HOME/extensions/plugins

# Stop/start Sonar
unset GEM_PATH GEM_HOME
$SONARQUBE_HOME/bin/macosx-universal-64/sonar.sh stop
$SONARQUBE_HOME/bin/macosx-universal-64/sonar.sh start

