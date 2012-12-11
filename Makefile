# Inspired by (borrowed) http://code.google.com/p/appengine-ndb-experiment/source/browse/Makefile

# You must have installed the App Engine SDK toolkit in
# /usr/local/google_appengine.  For the required version see README.

SDK=/usr/local/google_appengine
APP=./app
PORT=8080
ADDRESS=localhost
PYTHON=python -Wignore
APPCFG=$(SDK)/appcfg.py
DEV_APPSERVER=$(SDK)/dev_appserver.py
DATASTORE_PATH=tmp/dev_appserver.datastore

serve:
	$(PYTHON) $(DEV_APPSERVER) $(APP) --port $(PORT) --address $(ADDRESS) $(FLAGS) --datastore_path=$(DATASTORE_PATH)

appengine-tests:
	rm /usr/local/bin/dev_appserver.pyc
	nosetests -v --gae-application=$(APP) --with-gae test/appengine/

setup:
	pip install -r requirements.txt
	npm install app/ui/