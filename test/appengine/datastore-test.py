from google.appengine.ext import db
from base import BaseTestCase

class DatestoreTest(BaseTestCase):
	def testEventuallyConsistentGlobalQueryResult(self):
	    class TestModel(db.Model):
	      pass

	    user_key = db.Key.from_path('User', 'ryan')
	    # Put two entities
	    db.put([TestModel(parent=user_key), TestModel(parent=user_key)])

	    # Global query doesn't see the data.
	    self.assertEqual(0, TestModel.all().count(3))
	    # Ancestor query does see the data.
	    self.assertEqual(2, TestModel.all().ancestor(user_key).count(3))
