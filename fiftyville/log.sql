-- the time and day of the crime
SELECT description
  FROM crime_scene_reports
 WHERE year = 2021
   AND month = 7
   AND day = 28
   AND street = "Humphrey Street";


-- interviews related to the crime
SELECT *
  FROM interviews
 WHERE year = 2021
   AND month = 7
   AND day = 28
   AND transcript like "%bakery%";


-- logs from bakery_security
-- license_plate - 5P2BI95 at 10:16 am
SELECT *
  FROM bakery_security_logs
  JOIN people
    ON people.license_plate = bakery_security_logs.license_plate
 WHERE year = 2021
   AND month = 7
   AND DAY = 28
   AND hour = 10
   AND activity = "exit";


-- atm transactions
SELECT *
  FROM atm_transactions
 WHERE year = 2021
   AND month = 7
   AND day = 28
   AND atm_location = "Leggett Street";


-- id, name, account_number selected from previous query, people that used the ATM on Leggett Street on the day of the theft
SELECT people.id, people.name, people.license_plate, bank_accounts.account_number
  FROM bank_accounts
    JOIN people
      ON bank_accounts.person_id = people.id
        WHERE account_number IN
            (SELECT account_number
               FROM atm_transactions
              WHERE year = 2021
                AND month = 7
                AND day = 28
                AND atm_location = "Leggett Street");


-- people that used the ATM on Leggett Street and have license_plate equal to found in the bakery parking lot on the day of the theft
SELECT people.id, people.name, people.license_plate, bank_accounts.account_number, people.passport_number
  FROM bank_accounts
    JOIN people
      ON bank_accounts.person_id = people.id
        WHERE account_number IN
            (SELECT account_number
               FROM atm_transactions
              WHERE year = 2021
                AND month = 7
                AND day = 28
                AND atm_location = "Leggett Street")
        AND people.license_plate IN
            (SELECT license_plate
               FROM bakery_security_logs
              WHERE year = 2021
                AND month = 7
                AND DAY = 28
                AND hour = 10
                AND activity = "exit");


-- people from suspects list that left the bakery on the time of the theft
SELECT * FROM suspects WHERE license_plate IN (SELECT license_plate FROM bakery_security_logs WHERE year = 2021 AND month = 7 and DAY = 28 AND hour = 16);

SELECT people.id, people.name, people.license_plate, bank_accounts.account_number, people.passport_number, people.phone_number
  FROM bank_accounts
    JOIN people
      ON bank_accounts.person_id = people.id
        WHERE account_number IN
            (SELECT account_number
               FROM atm_transactions
              WHERE year = 2021
                AND month = 7
                AND day = 28
                AND atm_location = "Leggett Street")
        AND people.license_plate IN
            (SELECT license_plate
               FROM bakery_security_logs
              WHERE year = 2021
                AND month = 7
                AND DAY = 28
                AND hour = 10
                AND activity = "exit");


-- calls duration < 60 secs on the day from list of suspects
SELECT phone_calls.caller, phone_calls.receiver, people.name
  FROM phone_calls
  JOIN people
        ON phone_calls.caller = people.phone_number
     WHERE year = 2021
       AND month = 7
       AND day = 28
       AND duration < 60
       AND caller IN
        (SELECT people.phone_number
          FROM bank_accounts
            JOIN people
              ON bank_accounts.person_id = people.id
                WHERE account_number IN
                    (SELECT account_number
                       FROM atm_transactions
                      WHERE year = 2021
                        AND month = 7
                        AND day = 28
                        AND atm_location = "Leggett Street")
                AND people.license_plate IN
                    (SELECT license_plate
                       FROM bakery_security_logs
                      WHERE year = 2021
                        AND month = 7
                        AND DAY = 28
                        AND hour = 10
                        AND activity = "exit"));


-- airport from Fiftyville
SELECT *
  FROM airports
 WHERE city = "Fiftyville";

-- flights on the next day
SELECT *
  FROM flights
 WHERE year = 2021
   AND month = 7
   AND day = 29;


-- earliest flights on the 29th day leaving from Fifyville airport
SELECT flights.destination_airport_id, airports.full_name, airports.city, airports.full_name, flights.day, flights.hour, flights.minute
  FROM airports
  JOIN flights
    ON airports.id = flights.destination_airport_id
 WHERE flights.origin_airport_id = 8
   AND flights.year = 2021
   AND flights.month = 7
   AND flights.day = 29
   AND flights.hour < 10;


-- passengers on the flight from the suspects list
SELECT *
  FROM passengers
  JOIN people
    ON people.passport_number = passengers.passport_number
 WHERE flight_id =
    (SELECT id
       FROM flights
      WHERE origin_airport_id = 8
        AND destination_airport_id = 4
        AND year = 2021
        AND month = 7
        AND day = 29
        AND hour = 8)
  AND people.passport_number IN
      (SELECT people.passport_number
      FROM bank_accounts
        JOIN people
          ON bank_accounts.person_id = people.id
            WHERE account_number IN
                (SELECT account_number
                   FROM atm_transactions
                  WHERE year = 2021
                    AND month = 7
                    AND day = 28
                    AND atm_location = "Leggett Street")
            AND people.license_plate IN
                (SELECT license_plate
                   FROM bakery_security_logs
                  WHERE year = 2021
                    AND month = 7
                    AND DAY = 28
                    AND hour = 10
                    AND activity = "exit"));


-- calls duration < 60 secs on the day from list of suspects, caller name
SELECT phone_calls.caller, phone_calls.receiver, people.name
  FROM phone_calls
  JOIN people
        ON phone_calls.caller = people.phone_number
     WHERE year = 2021
       AND month = 7
       AND day = 28
       AND duration < 60
       AND caller IN
        (SELECT people.phone_number
          FROM bank_accounts
            JOIN people
              ON bank_accounts.person_id = people.id
                WHERE account_number IN
                    (SELECT account_number
                       FROM atm_transactions
                      WHERE year = 2021
                        AND month = 7
                        AND day = 28
                        AND atm_location = "Leggett Street")
                AND people.license_plate IN
                    (SELECT license_plate
                       FROM bakery_security_logs
                      WHERE year = 2021
                        AND month = 7
                        AND DAY = 28
                        AND hour = 10
                        AND activity = "exit"));


-- calls duration < 60 secs on the day from list of suspects, receiver name
SELECT *
  FROM phone_calls
  JOIN people
        ON phone_calls.receiver = people.phone_number
     WHERE year = 2021
       AND month = 7
       AND day = 28
       AND duration < 60
       AND caller IN
        (SELECT people.phone_number
          FROM bank_accounts
            JOIN people
              ON bank_accounts.person_id = people.id
                WHERE account_number IN
                    (SELECT account_number
                       FROM atm_transactions
                      WHERE year = 2021
                        AND month = 7
                        AND day = 28
                        AND atm_location = "Leggett Street")
                AND people.license_plate IN
                    (SELECT license_plate
                       FROM bakery_security_logs
                      WHERE year = 2021
                        AND month = 7
                        AND DAY = 28
                        AND hour = 10
                        AND activity = "exit"));


-- airport from Fiftyville
SELECT *
  FROM airports
 WHERE city = "Fiftyville";

-- flights on the next day
SELECT *
  FROM flights
 WHERE year = 2021
   AND month = 7
   AND day = 29;


-- earliest flights on the 29th day leaving from Fifyville airport
SELECT flights.destination_airport_id, airports.full_name, airports.city, airports.full_name, flights.day, flights.hour, flights.minute
  FROM airports
  JOIN flights
    ON airports.id = flights.destination_airport_id
 WHERE flights.origin_airport_id = 8
   AND flights.year = 2021
   AND flights.month = 7
   AND flights.day = 29
   AND flights.hour < 10;


-- passengers on the flight from the suspects list
SELECT *
  FROM passengers
  JOIN people
    ON people.passport_number = passengers.passport_number
 WHERE flight_id =
    (SELECT id
       FROM flights
      WHERE origin_airport_id = 8
        AND destination_airport_id = 4
        AND year = 2021
        AND month = 7
        AND day = 29
        AND hour = 8)
  AND people.passport_number IN
      (SELECT people.passport_number
      FROM bank_accounts
        JOIN people
          ON bank_accounts.person_id = people.id
            WHERE account_number IN
                (SELECT account_number
                   FROM atm_transactions
                  WHERE year = 2021
                    AND month = 7
                    AND day = 28
                    AND atm_location = "Leggett Street")
            AND people.license_plate IN
                (SELECT license_plate
                   FROM bakery_security_logs
                  WHERE year = 2021
                    AND month = 7
                    AND DAY = 28
                    AND hour = 10
                    AND activity = "exit"));

