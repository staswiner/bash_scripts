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




# Completion Generator

completionGenerator generates a file based on rules provided.
the output is a script, with the default name of 'completion.bash'.
to activate the completion:

    source ./completion.bash
#### recommendation
put that line in your ~/.bashrc file

## using completionGenerator
    usage ./completionGenerator: [completion_data_file] [script_name] optional:[target_completion_file]
        target_completion_file      default is 'completion.bash'

#### example:
    ./completionGenerator completion.data myScript.sh completion.out

## FILE DATA:

### _add_multi_option - option with values
#### example:

    _add_multi_option "--option" "value1 value2 value3"

### _add_option - single standing option
#### example:

    _add_option "-h"
