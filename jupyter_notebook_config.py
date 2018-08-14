import os
from IPython.lib import passwd

c = c  # pylint:disable=undefined-variable
c.NotebookApp.ip = '*'
c.NotebookApp.port = int(os.getenv('PORT', 8888))
c.NotebookApp.open_browser = False
c.NotebookApp.password = u'sha1:aeb2981231a1:7997b29cf6b87de73cb7c91f3c207cafb5b10f88'
