#!/bin/bash
set -e
set -x

EXT_HOME=~/.local/share/gnome-shell/extensions/NetworkSpeed@m0hithreddy
PROJECT_HOME=https://raw.githubusercontent.com/m0hithreddy/NetworkSpeed/main

#Create a directory structure
mkdir -p ${EXT_HOME}
mkdir -p ${EXT_HOME}/schemas

#Copy required files
curl ${PROJECT_HOME}/convenience.js -o ${EXT_HOME}/convenience.js
curl ${PROJECT_HOME}/extension.js -o ${EXT_HOME}/extension.js
curl ${PROJECT_HOME}/metadata.json -o ${EXT_HOME}/metadata.json
curl ${PROJECT_HOME}/prefs.js -o ${EXT_HOME}/prefs.js
curl ${PROJECT_HOME}/stylesheet.css -o ${EXT_HOME}/stylesheet.css
curl ${PROJECT_HOME}/schemas/gschemas.compiled -o ${EXT_HOME}/schemas/gschemas.compiled
curl ${PROJECT_HOME}/schemas/org.gnome.shell.extensions.NetworkSpeed.gschema.xml -o ${EXT_HOME}/schemas/org.gnome.shell.extensions.NetworkSpeed.gschema.xml

#Optional files
curl ${PROJECT_HOME}/LICENSE -o ${EXT_HOME}/LICENSE

#Reloading shell; Sending SIGHUP signal to gnome-shell (equivalent to alt + f2 ; r ; enter)
busctl --user call org.gnome.Shell /org/gnome/Shell org.gnome.Shell Eval s 'Meta.restart("Restarting…")'

#Enabling Gnome extension.
gnome-extensions enable NetworkSpeed@m0hithreddy