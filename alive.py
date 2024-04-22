from flask import Flask
from threading import Thread
import time
import random
import subprocess
import datetime as dt1
from datetime import date, datetime, timedelta


START_TIME = float(5)
END_TIME = float(13)

app = Flask(__name__)

@app.route('/')
def index():
    return "App is Running..."
def run():
  app.run(host='0.0.0.0',port=8080)
def keep_alive():  
    t = Thread(target=run)
    t.start()
    
    
def wait():
    currentHour = dt1.datetime.now(timezone('America/New_York')).hour
    if not (currentHour >= START_TIME and currentHour < END_TIME):
        range = (START_TIME-currentHour) if (currentHour < START_TIME) else ((24 - currentHour) + START_TIME)
        time.sleep((range) * 3600)
    return
  
  
def runScript():
  process = subprocess.run(["npm", "start"], capture_output=True, text=True)stdout.strip("\n")
  print(process)

keep_alive()
runScript()
while True:
  wait()
  hours = random.randint(3, 8)
  runScript()
  time.sleep(3600 * hours)