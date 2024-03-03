#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

# Your script should randomly generate a number that users have to guess
SECRET_NUMBER=$((RANDOM % 1000 + 1))


# When you run your script, you should prompt the user for a username with Enter your username:, and take a username as input. Your database should allow usernames that are 22 characters
echo "Enter your username:$SECRET_NUMBER"
read USERNAME
USERNAME_AVAIL=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")
GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM users INNER JOIN games USING(username) WHERE username='$USERNAME'")
BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM users INNER JOIN games USING(username) WHERE username='$USERNAME'")

# If that username has been used before, it should print Welcome back, <username>! You have played <games_played> games, and your best game took <best_game> guesses., with <username> being a users name from the database, <games_played> being the total number of games that user has played, and <best_game> being the fewest number of guesses it took that user to win the game
if [[ -z $USERNAME_AVAIL ]]; then
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# insert game into games table
INSERT_GAME=$($PSQL "INSERT INTO games(username, guesses) VALUES('$USERNAME', 0)")

# If the username has not been used before, you should print Welcome, <username>! It looks like this is your first time here.
# The next line printed should be Guess the secret number between 1 and 1000: and input from the user should be read
echo "Guess the secret number between 1 and 1000:"
read GUESS

# Until they guess the secret number, it should print It's lower than that, guess again: if the previous input was higher than the secret number, and It's higher than that, guess again: if the previous input was lower than the secret number. Asking for input each time until they input the secret number.
NUMBER_GUESSES=1
while [[ $GUESS != $SECRET_NUMBER ]]; do
  if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    read GUESS
    continue
  fi

  if [[ $GUESS > $SECRET_NUMBER ]]; then
    echo "It's lower than that, guess again:"
    read GUESS
    ((NUMBER_GUESSES++))
    continue
  elif [[ $GUESS < $SECRET_NUMBER ]]; then
    echo "It's higher than that, guess again:"
    read GUESS
    ((NUMBER_GUESSES++))
    continue
  fi
done
# If anything other than an integer is input as a guess, it should print That is not an integer, guess again:
# When the secret number is guessed, your script should print You guessed it in <number_of_guesses> tries. The secret number was <secret_number>. Nice job! and finish running
echo "You guessed it in $NUMBER_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

# update last game
UPDATE_GAME=$($PSQL "UPDATE games SET guesses=$NUMBER_GUESSES WHERE username='$USERNAME'")
