# Logger
## Usage:
    source ./logger
     ...
    logger.info [message]
    logger.error [message]
    logger.warn [message]
    logger.debug [message]
    
## Logger Level
    ./setLoggerLevel [none|silent] [info|error] [warn] [debug]
    ./getLoggerLevel
**Logger levels are heirarchical:**
1. none: 0
2. info/error: 1
3. warn: 2
4. debug: 3

If the level is higher than the logger, the logger will apear.

