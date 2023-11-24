#!/bin/bash
echo "----------------------------------"
echo " 1) Get the packages list"
echo " 2) Download all packages"
echo "----------------------------------"
echo ""

read -p "Please choose the option [1-2]: " choice
read -p "Install or update [install, update]: " yum_option
read -p "Input the package list (Use spaces to separate multiple packages: " yum_packages

case "$choice" in
  "1")
    echo "Get the packages list..."
    yum $yum_option $yum_packages --assumeno | awk '/Installing:/, /Transaction Summary/' | sed 's/Installing\://g;s/Installing for dependencies\://g;s/Transaction Summary//g;/^$/d' | awk '{print $1"-"$3"."$2 }' > packages.list
    echo "Packages list has alreaady created."
    ;;
  "2")
    echo "Download all packages"
    rm -rf ./packages
    mkdir packages
    yum $yum_option $yum_packages  --assumeno | awk '/Installing:/, /Transaction Summary/' | sed 's/Installing\://g;s/Installing for dependencies\://g;s/Transaction Summary//g;/^$/d' | awk '{print $1"-"$3"."$2 }' | xargs -I @ yumdownloader @ --destdir packages
    echo "All packages have downloaded successfully into packages folder."
    ;;
  *)  
    echo "Please input the correct option!"
    exit 1
    ;;
esac
