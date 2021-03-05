from flask import Flask
from flask import request
import RPi.GPIO as GPIO
from time import sleep

app = Flask(__name__)

GPIO.setwarnings(False)
GPIO.setmode(GPIO.BOARD)
GPIO.setup(11, GPIO.OUT, initial=GPIO.LOW)

def switchOn():
    GPIO.output(11, GPIO.HIGH)
    sleep(1)

def switchOff():
    GPIO.output(11, GPIO.LOW)
    sleep(1)

@app.route('/zoom', methods=['POST'])
def zoom():
    if request.form['mic'] == "on":
        switchOn()
        return "on"
    else:
        switchOff()
        return "off"
if __name__ == '__main__':
    app.run(host='0.0.0.0')
