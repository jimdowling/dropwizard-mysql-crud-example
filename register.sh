#!/bin/bash

rand=$(openssl rand 4 | od -DAn)

# remove leading whitespace
rand="$(echo -e "${rand}" | tr -d '[:space:]')"

echo "Please enter your email address to continue:"
read email

if [[ $email =~ .*@.* ]]
then
  echo "Registering hopsworks instance...."
  echo "{\"id\": \"$rand\", \"name\":\"$email\"}" > .details
else
  echo "Exiting. Invalid email"
  exit 1
fi

curl -H "Content-type:application/json" --data @.details http://snurran.sics.se:9000/keyword
