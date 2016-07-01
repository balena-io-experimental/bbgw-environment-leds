# Beaglebone Green Wireless Environmental Monitoring

Deploy an app on [Beaglebone Green Wireless](http://www.seeedstudio.com/wiki/Beaglebone_green_wireless)
with [resin.io](https://resin.io) to monitor changes in the ambient temperature
or pressure, and communicate changes via LEDs.

* If sensor reading is approximately steady, both LEDs blink short
* If sensor reading is increasing or decreasing, the appropriate LED will blink to signal direction of change
* If sensor reading is changing above a certain threshold, signal that with long blink of the appropriate LED to signal both change and magnitude of change.

### Hardware

* 1x Beaglebone Green Wireless
* 1x Grove base cape
* 1x BMP180 Grove barometric sensor
* 2x Grove LED (two different colours, e.g. red and blue)

### Env variables

The used (software) environmental variables to control the behaviour of the
application are the following:

* `TEST_PRESSURE`, default is `0`, if equal to `1` then pressure value is tested, otherwise temperature
* `PERIOD`, default is `1`, the time between sensor readings in seconds, integer
* `SENSOR_THRESHOLD`, default is `1.0`, the change/1min in sensor value which triggers long blink of the LEDs