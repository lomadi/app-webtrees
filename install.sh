#!/bin/bash

echo "Patch Docker Compose File and Create Data Folder for MySQL and Webtrees"
echo ""

folder="/yourpath/without/slash/at/the/end"
port="10080"

PROGNAME=$(basename $0)

usage()
{
    echo "Usage:    ./install.sh [OPTIONS]"
    echo "          ./install.sh [ --help | -v | --version ]"
    echo ""
    echo "OPTIONS:"
    echo "      -f, --folder                  Base Data Folder"
    echo "      -p, --port                    Port to Map Webtrees Container"
    echo ""
    echo "Example:"
    echo "      ./install.sh -f /yourpath/without/slash/at/the/end  -p 10080"
    echo ""
}

version()
{
  echo "Version: 1.0"
  echo "Build: 2016-10-24"
}

clean_up() {	
	exit $1
}

error_exit()
{
	echo "ERROR in ${PROGNAME}: ${1:-"Unknown Error"}" 1>&2
	clean_up 1
}

updateComposeFile()
{
    if  [[ ! -f docker-compose.yml ]]; then
        cp docker-compose.yml docker-compose.yml.old
    fi    
    cp docker-compose-template.yml docker-compose.yml
    sed -i -e  "s@§§FOLDER@${folder}@g" docker-compose.yml
    sed -i -e  "s@§§PORT@${port}@g"     docker-compose.yml
}

createFolders()
{
    mkdir -p "$folder/webtrees/var/lib/mysql"
    mkdir -p "$folder/webtrees/var/www/html/webtrees/data"
}

copyInitFiles()
{
    if [[ ! -d $folder/webtrees/var/www/html/webtrees/data/config.ini.php ]]; then
        cp images/webtrees/config/config.ini.php   $folder/webtrees/var/www/html/webtrees/data/config.ini.php 
    fi
}

checkParameters() 
{
    echo "Setup parameters:"
    
    if [[ "$folder" = "/yourpath/without/slash/at/the/end" ]]; then
        usage
        error_exit "No Data Folder set, use the -f option"
    else
        echo "Data Folder: $folder" 
    fi
    
    if [[ -z "$port" ]]; then
        usage
        error_exit "The port is not set."
    else
        echo "Port: $port"
    fi       
}


while [ "$1" != "" ]; do
    case $1 in
        -f | --folder )         shift
                                folder=$1
                                ;;
        -p | --port )           shift
                                port=$1
                                ;;
        -h | --help )           usage
                                clean_up
                                ;;
        -v | --version | version )  version
                                clean_up
                                ;;
        * )                     usage
                                error_exit "Parameters not matching"
    esac
    shift
done

echo "Patch Docker Compose File and Create Data Folder for MySQL and Webtrees"
echo ""

checkParameters
createFolders
copyInitFiles
updateComposeFile

echo ''
echo 'run docker-compose up -d'
echo ""
