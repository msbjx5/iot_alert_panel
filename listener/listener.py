import paho.mqtt.client as mqtt
from influxdb import InfluxDBClient
import datetime

def on_connect(client, userdata, flags, rc):
    print("Connected with result code "+str(rc))
    client.subscribe("metrics/#")

def on_message(client, userdata, msg):
    current_time = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    json_body = [ 
    {
        "measurement": "metrics",
        "tags": {
            "host": "metrics",
        },
        "fields": {
            "value": str(msg.payload)
        }
    }
    ]
    influx_client.write_points(json_body)
    print(msg.topic+" "+str(msg.payload))

influx_client = InfluxDBClient('influx', 8086, database='metrics')
client = mqtt.Client()
client.on_connect = on_connect
client.on_message = on_message

client.connect("mosquitto", 1883, 60)

client.loop_forever()