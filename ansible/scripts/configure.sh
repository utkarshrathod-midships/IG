# !/bin/sh
Environment variable
export IG_HOME="/opt/ig"
export IG_APP="${IG_HOME}/app" 
export IG_INSTANCE="${IG_HOME}/app/instance"
export IG_SCRIPTS="${IG_HOME}/scripts"
export JAVA_CACERTS="/etc/ssl/certs/java/cacerts"
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64/"
export OPENDJ_JAVA_HOME="${JAVA_HOME}
echo "----------------------------------------------------"
echo "****************************************************"
echo "[[ forgerock Identity Gateway (IG) - IG Server ]]"
echo "->               Server Name: ${HOSTNAME}"
echo "->                   IG_HOME: ${IG_HOME}"
echo "->                    IG_APP: ${IG_APP}"
echo "->               IG_INSTANCE: ${IG_INSTANCE}"
echo "->                IG_SCRIPTS: ${IG_SCRIPTS}"
echo "->                 JAVA_HOME: ${JAVA_HOME}"
echo "->              JAVA_CACERTS: ${JAVA_CACERTS}"
echo "----------------------------------------------------"
echo ""

echo "Configuring IG"
echo "Changing directory to the Source Path"
cd ${IG_HOME}/bin/
echo "Changing directory to the Source Path"
ls -ltra
echo "Checking if IG the service is up or not";
