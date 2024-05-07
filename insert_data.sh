#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS=',' read -r year round winner opponent winner_goals opponent_goals;
do
  if [[ $winner != winner ]]
  then
    # Get team_id for winner
    winner_id=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")

    # Check if winner exists in teams table
    if [[ -z $winner_id ]]
    then
      # Insert winner into teams table if it doesn't exist
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$winner')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted $winner into teams table"
      fi
      # Retrieve the newly inserted winner_id
      winner_id=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
    fi
  fi

  if [[ $opponent != opponent ]]
  then
    # Get team_id for opponent
    opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")

    # Check if opponent exists in teams table
    if [[ -z $opponent_id ]]
    then
      # Insert opponent into teams table if it doesn't exist
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES ('$opponent')")
      if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted $opponent into teams table"
      fi
      # Retrieve the newly inserted opponent_id
      opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")
    fi
  fi

  # Check if winner and opponent exist in teams table
  if [[ -n $winner_id && -n $opponent_id ]]
  then
    # Check if the game already exists in the games table
    GAME_EXISTS=$($PSQL "SELECT EXISTS(SELECT 1 FROM games WHERE year='$year' AND round='$round' AND winner_id='$winner_id' AND opponent_id='$opponent_id')")

    if [[ $GAME_EXISTS == "t" ]]
    then
      echo "Game already exists: Year=$year, Round=$round, Winner ID=$winner_id, Opponent ID=$opponent_id"
    else
      # Insert the row into the games table
      INSERT_RESULT=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ('$year', '$round', '$winner_id', '$opponent_id', '$winner_goals', '$opponent_goals')")
      if [[ $INSERT_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into games table: Year=$year, Round=$round, Winner ID=$winner_id, Opponent ID=$opponent_id"
      fi
    fi
  else
    echo "Failed to insert row: Winner or opponent not found in teams table"
  fi

done
