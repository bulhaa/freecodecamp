#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

# If you run ./element.sh, it should output only Please provide an element as an argument. and finish running.
if [[ -z $1 ]]; then
    echo "Please provide an element as an argument."
else
    # If you run ./element.sh 1, ./element.sh H, or ./element.sh Hydrogen, it should output only The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.
    # find element in database
    if [[ $1 =~ ^[0-9]+$ ]]; then
        ELEMENT=$($PSQL "SELECT atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius
        FROM properties JOIN elements USING(atomic_number) JOIN types USING(type_id)
        WHERE atomic_number = '$1' ")
    else
        ELEMENT=$($PSQL "SELECT atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius 
        FROM properties JOIN elements USING(atomic_number) JOIN types USING(type_id) 
        WHERE symbol = '$1' OR name = '$1' ")
    fi

    if [[ -z $ELEMENT ]]; then
        echo "I could not find that element in the database."
        exit
    else
        echo $ELEMENT | while IFS=" |" read ATOMIC_NUMBER SYMBOL NAME TYPE ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS
        do
            echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
        done
    fi
fi
