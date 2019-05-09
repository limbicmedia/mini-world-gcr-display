import RPi.GPIO as GPIO

class Config():
    DMX_DEVICE = "/dev/ttyUSB0"
    
    # pause installation at startup with toggle switch
    AUTOREPEAT_TOGGLE = {
        'gpio_pin': 40
    }

    DEFAULT_VALUE = [0, 255]
    DEFAULT_TRANSITION_TIME = 0
    CHANNELS = list(range(1,11))  # order of DMX channels

    LIGHTING_SEQUENCE = [
        {
            'dmx_levels': [255, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            'dmx_transition': 10,
            'end_time': 30
        },
        {
            'dmx_levels': [255, 255, 0, 0, 0, 0, 0, 0, 0, 0],
            'dmx_transition': 10,
            'end_time': 60
        },
        {
            'dmx_levels': [255, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            'dmx_transition': 10,
            'end_time': 90
        },
        {
            'dmx_levels': [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            'dmx_transition': 10,
            'end_time': 120
        }
    ]
