#!/bin/bash

# Check if the --level argument is provided
if [ -z "$1" ] || [ "$1" != "--level" ] || [ -z "$2" ]; then
  echo "Usage: $0 --level <level>"
  exit 1
fi

LEVEL=$2
FILENAME="level${LEVEL}.txt"

# Run the Python scripts
python tinypy_generator.py --level $LEVEL --filename $FILENAME
python code_refactor_generator.py --level $LEVEL --filename $FILENAME
python validate_dataset.py --filename $FILENAME