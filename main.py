import time
import random
import subprocess
import datetime as dt1
from datetime import date, datetime, timedelta
from pytz import timezone


START_TIME = float(5)
END_TIME = float(13)


def wait():
    currentHour = dt1.datetime.now(timezone('America/New_York')).hour
    if not (currentHour >= START_TIME and currentHour < END_TIME):
        range = (START_TIME-currentHour) if (currentHour < START_TIME) else ((24 - currentHour) + START_TIME)
        time.sleep((range) * 3600)
    return
  
  
def runScript():
    process = subprocess.run(["npm", "start"], stdout=subprocess.PIPE, stderr=subprocess.STDOUT, universal_newlines=True)
    print(f'Script Stdout: {process.stdout}')
    print(f'Errorcode script: {process.returncode}')

runScript()
while True:
  wait()
  hours = random.randint(3, 8)
  runScript()
  time.sleep(3600 * hours)