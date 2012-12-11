# You must have installed the App Engine SDK toolkit in
# /usr/local/google_appengine.  For the required version see README.
GAE=/usr/local/google_appengine
PORT=8080
ADDRESS=localhost
PYTHON=python -Wignore
APPCFG=$(GAE)/appcfg.py
DEV_APPSERVER=$(GAE)/dev_appserver.py

serve:
	$(DEV_APPSERVER) ./app --port $(PORT) --address $(ADDRESS) $(FLAGS)