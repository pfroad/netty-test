#!/bin/sh

PRG="$0"
PRGDIR=`dirname "$PRG"`

if [ -z "$JAVA_HOME" -a -z "$JRE_HOME" ]; then
	JAVA_PATH=`which java`
	if [ "x$JAVA_PATH" != "x" ]; then
		JAVA_PATH=`dirname $JAVA_PATH`
		JRE_HOME=`dirname $JAVA_PATH`
	fi
	if [ -z "$JAVA_HOME" -a -z "$JRE_HOME" ]; then
		echo "Neither the JAVA_HOME nor the JRE_HOME environment variable is defined"
		echo "At least one of these environment variable is needed to run this program"
		exit 1
	fi
fi

if [ -z "$JRE_HOME" ]; then
  JRE_HOME="$JAVA_HOME"
fi

if [ -z "$_RUNJAVA" ]; then
  _RUNJAVA="$JRE_HOME"/bin/java
fi

eval "\"$_RUNJAVA\"" \
      -server -Xms128M -Xmx512M -XX:PermSize=64M -XX:MaxPermSize=128M \
      -jar \
      mallgo-pns-0.0.1-SNAPSHOT.jar \
      > /dev/null 2>&1 "&"
echo "Started."  