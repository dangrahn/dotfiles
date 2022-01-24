#export JAVA_14_HOME=$(/usr/libexec/java_home -v14)
export JAVA_15_HOME=$(/usr/libexec/java_home -v15)
#export JAVA_16_HOME=$(/usr/libexec/java_home -v16)

export JAVA_HOME=$JAVA_15_HOME
export PATH=${JAVA_HOME}/bin:$PATH
export PATH=$PATH:$JAVA_HOME