#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

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
# Query element info by symbol

# Query element info by name

fi
# If no results, show message
if [[ -z $ELEMENT_INFO ]]
then
  echo "I could not find that element in the database."
else
  echo "$ELEMENT_INFO" | while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  done
fi
# else, display element info