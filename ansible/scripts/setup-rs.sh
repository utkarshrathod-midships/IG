# !/bin/sh
# Environment variable
# export DS_HOME="/opt/ds"
# export DS_APP="${DS_HOME}/app" 
# export DS_INSTANCE="${DS_HOME}/app/instance"
# export DS_SCRIPTS="${DS_HOME}/scripts"
# export JAVA_CACERTS="/etc/ssl/certs/java/cacerts"
# export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64/"
# export OPENDJ_JAVA_HOME="${JAVA_HOME}"

# echo "----------------------------------------------------"
# echo "****************************************************"
# echo "[[ forgerock Directory Server (DS) - Replication Server ]]"
# echo "->               Server Name: ${HOSTNAME}"
# echo "->                   DS_HOME: ${DS_HOME}"
# echo "->                    DS_APP: ${DS_APP}"
# echo "->               DS_INSTANCE: ${DS_INSTANCE}"
# echo "->                DS_SCRIPTS: ${DS_SCRIPTS}"
# echo "->                 JAVA_HOME: ${JAVA_HOME}"
# echo "->              JAVA_CACERTS: ${JAVA_CACERTS}"
# echo "----------------------------------------------------"
# echo ""

echo "Downloading RS"
echo "Getting RS"
curl -u midships:Midships202! "ftp://ruhle.drayddns.com/forgerock/directory-services/DS-7.1.2.zip" -o DS.zip
touch /tmp/$(date +"%Y-%m-%d-%H-%M-%S").log
echo "Setting up pre-requsite(s)"
sudo unzip DS.zip -d /opt/ds

echo "-> Copying DS setup files";
if [ -f "${path_tmp}/${ds_filename}" ]; then
  unzip ${path_tmp}/${ds_filename} -d ${DS_HOME}
  echo "-- Done";
  echo "";
else
  echo "-- ERROR: '${path_tmp}/${ds_filename}' NOT found. Exiting ..."
  exit 1
fi

echo "-> Backing up DS binary incase needed for upgrade later";
mv ${path_tmp}/${ds_filename} ${DS_HOME}/
if [ -f "${DS_HOME}/${ds_filename}" ]; then
  echo "-- Done";
  echo "";
else
  echo "-- ERROR: '${DS_HOME}/${ds_filename}' NOT found. Exiting ..."
  exit 1
fi

echo "-> Creating 'setupFiles' folder";
mv -f "${DS_HOME}/opendj" "${DS_HOME}/setupFiles"
echo "-- Files in ${DS_HOME}/setupFiles"
ls -A "${DS_HOME}/setupFiles"
echo "-- Done";
echo "";

echo "-> Setting permission(s)";
chown -R ds:ds ${MIDSHIPS_SCRIPTS} ${DS_HOME} ${JAVA_CACERTS} ${path_tmp};
chmod -R u=rwx,g=rx,o=r ${DS_HOME}/setupFiles;
echo "-- Done";
echo "";

echo "-> Cleaning up";
rm -rf ${path_tmp};
echo "-- Done";
echo "";


