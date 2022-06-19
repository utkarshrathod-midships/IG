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
echo "[[ forgerock Directory Server (DS) - IG Server ]]"
echo "->               Server Name: ${HOSTNAME}"
echo "->                   IG_HOME: ${IG_HOME}"
echo "->                    IG_APP: ${IG_APP}"
echo "->               IG_INSTANCE: ${IG_INSTANCE}"
echo "->                IG_SCRIPTS: ${IG_SCRIPTS}"
echo "->                 JAVA_HOME: ${JAVA_HOME}"
echo "->              JAVA_CACERTS: ${JAVA_CACERTS}"
echo "----------------------------------------------------"
echo ""

echo "-> Installing Java";
tar -xf ${path_tmp}/${filename_java} -C ${JVM_PATH}/
echo "-- Done";
echo "";

echo "-> Checking Java";
echo "-- JAVA_HOME is set to ${JAVA_HOME}";
java -version;
echo "-- Done";
echo ""

if (( ${JAVA_VERSION_MAJOR} <= 8 )); then
  echo "-> Removing vulnerable jetty-server (v8.1.14) to resolve CVE-2017-7657";
  find  ${JAVA_HOME}/lib/missioncontrol/plugins/ -name 'org.eclipse.jetty.*' -exec rm {} \;
  echo "-- Done";
  echo "";
fi

echo "-> Copying IG setup files";
if [ -f "${path_tmp}/${IG_filename}" ]; then
  unzip ${path_tmp}/${IG_filename} -d ${IG_HOME}
  echo "-- Done";
  echo "";
else
  echo "-- ERROR: '${path_tmp}/${IG_filename}' NOT found. Exiting ..."
  exit 1
fi

echo "Downloading IG"
echo "Getting IG"
curl "http://161.97.114.126:8081/repository/forgerock-raw/openig/7.1.2/IG-7.1.2.zip" -o IG.zip
touch /tmp/$(date +"%Y-%m-%d-%H-%M-%S").log
echo "Setting up pre-requsite(s)"
sudo unzip IG.zip -d ${path_tmp}/IG
echo "Changing the directory"
cd ${path_tmp}/IG/bin
chmod +x startup.sh
echo "Starting the services"
su /startup.sh
echo "Verify /if the services are up and running"
# Check IG at
ping http://openig.example.com:8080/openig/ping

echo "-> Cleaning up";
rm -rf ${path_tmp};
echo "-- Done";
echo "";