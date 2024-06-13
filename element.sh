#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table -t --no-align -c"

ELEMENT=$1
if [[ -z $ELEMENT ]]
then
  echo "Please provide an element as an argument."
fi

# Determine if argument is atomic number, symbol, or name
if [[ $ELEMENT -gt 0 ]]
then
# Query element info by atomic number
  ELEMENT_INFO=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements AS e JOIN properties ON properties.atomic_number = e.atomic_number JOIN types ON types.type_id = properties.type_id WHERE e.atomic_number = $ELEMENT")
else
  ELEMENT_INFO="NaN"
fi
echo $ELEMENT_INFO
# Query element info by symbol

# Query element info by name

# If no results, show message

# else, display element info