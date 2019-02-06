

set -e
echo "Устанавливаю версию OScript <$OSCRIPT_VERSION>"
curl http://oscript.io/downloads/$OSCRIPT_VERSION/deb > oscript.deb 
dpkg -i oscript.deb 
rm -f oscript.deb

opm install 1testrunner; 
opm install 1bdd; 
opm install notify;
opm install coverage;
opm install; 

opm run coverage; 


