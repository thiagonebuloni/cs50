/* the time and day of the crime
SELECT description
  FROM crime_scene_reports
 WHERE year = 2021
   AND month = 7
   AND day = 28
   AND street = "Humphrey Street";

description
Theft of the CS50 duck took place at 10:15am at the Humphrey Street bakery. Interviews were conducted today with three witnesses who were present at the time – each of their interview transcripts mentions the bakery.
Littering took place at 16:36. No known witnesses.


-- interviews related to the crime
SELECT *
  FROM interviews
 WHERE year = 2021
   AND month = 7
   AND day = 28
   AND transcript like "%bakery%";

id | name | year | month | day | transcript
161 | Ruth | 2021 | 7 | 28 | Sometime within ten minutes of the theft, I saw the thief get into a car in the bakery parking lot and drive away. If you have security footage from the bakery parking lot, you might want to look for cars that left the parking lot in that time frame.
162 | Eugene | 2021 | 7 | 28 | I don't know the thief's name, but it was someone I recognized. Earlier this morning, before I arrived at Emma's bakery, I was walking by the ATM on Leggett Street and saw the thief there withdrawing some money.
163 | Raymond | 2021 | 7 | 28 | As the thief was leaving the bakery, they called someone who talked to them for less than a minute. In the call, I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow. The thief then asked the person on the other end of the phone to purchase the flight ticket.


-- logs from bakery_security
-- license_plate - 94KL13X at 10:16 am
SELECT *
  FROM bakery_security_logs
  JOIN people
    ON people.license_plate = bakery_security_logs.license_plate
 WHERE year = 2021
   AND month = 7
   AND DAY = 28
   AND hour = 10
   AND activity = "exit";

id | year | month | day | hour | minute | activity | license_plate | id | name | phone_number | passport_number | license_plate
260 | 2021 | 7 | 28 | 10 | 16 | exit | 5P2BI95 | 221103 | Vanessa | (725) 555-4692 | 2963008352 | 5P2BI95
261 | 2021 | 7 | 28 | 10 | 18 | exit | 94KL13X | 686048 | Bruce | (367) 555-5533 | 5773159633 | 94KL13X
262 | 2021 | 7 | 28 | 10 | 18 | exit | 6P58WS2 | 243696 | Barry | (301) 555-4174 | 7526138472 | 6P58WS2
263 | 2021 | 7 | 28 | 10 | 19 | exit | 4328GD8 | 467400 | Luca | (389) 555-5198 | 8496433585 | 4328GD8
264 | 2021 | 7 | 28 | 10 | 20 | exit | G412CB7 | 398010 | Sofia | (130) 555-0289 | 1695452385 | G412CB7
265 | 2021 | 7 | 28 | 10 | 21 | exit | L93JTIZ | 396669 | Iman | (829) 555-5269 | 7049073643 | L93JTIZ
266 | 2021 | 7 | 28 | 10 | 23 | exit | 322W7JE | 514354 | Diana | (770) 555-1861 | 3592750733 | 322W7JE
267 | 2021 | 7 | 28 | 10 | 23 | exit | 0NTHK55 | 560886 | Kelsey | (499) 555-9472 | 8294398571 | 0NTHK55
268 | 2021 | 7 | 28 | 10 | 35 | exit | 1106N58 | 449774 | Taylor | (286) 555-6063 | 1988161715 | 1106N58


-- ATM transactions
SELECT *
  FROM atm_transactions
  JOIN bank_accounts
    ON atm_transactions.account_number = bank_accounts.account_number
 WHERE year = 2021
   AND month = 7
   AND day = 28
   AND atm_location = "Leggett Street");


id | account_number | year | month | day | atm_location | transaction_type | amount | account_number | person_id | creation_year
246 | 28500762 | 2021 | 7 | 28 | Leggett Street | withdraw | 48 | 28500762 | 467400 | 2014
264 | 28296815 | 2021 | 7 | 28 | Leggett Street | withdraw | 20 | 28296815 | 395717 | 2014
266 | 76054385 | 2021 | 7 | 28 | Leggett Street | withdraw | 60 | 76054385 | 449774 | 2015
267 | 49610011 | 2021 | 7 | 28 | Leggett Street | withdraw | 50 | 49610011 | 686048 | 2010
269 | 16153065 | 2021 | 7 | 28 | Leggett Street | withdraw | 80 | 16153065 | 458378 | 2012
275 | 86363979 | 2021 | 7 | 28 | Leggett Street | deposit | 10 | 86363979 | 948985 | 2010
288 | 25506511 | 2021 | 7 | 28 | Leggett Street | withdraw | 20 | 25506511 | 396669 | 2014
313 | 81061156 | 2021 | 7 | 28 | Leggett Street | withdraw | 30 | 81061156 | 438727 | 2018
336 | 26013199 | 2021 | 7 | 28 | Leggett Street | withdraw | 35 | 26013199 | 514354 | 2012


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


id | name | license_plate | account_number
686048 | Bruce | 94KL13X | 49610011
948985 | Kaelyn | I449449 | 86363979
514354 | Diana | 322W7JE | 26013199
458378 | Brooke | QX4YZN3 | 16153065
395717 | Kenny | 30G67EN | 28296815
396669 | Iman | L93JTIZ | 25506511
467400 | Luca | 4328GD8 | 28500762
449774 | Taylor | 1106N58 | 76054385
438727 | Benista | 8X428L0 | 81061156


-- people that used the ATM on Leggett Street and have license_plate equal to found in the bakery parking lot on the day of the theft
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



-- suspects

id | name | license_plate | account_number | passport_number | phone_number
686048 | Bruce | 94KL13X | 49610011 | 5773159633 | (367) 555-5533
514354 | Diana | 322W7JE | 26013199 | 3592750733 | (770) 555-1861
396669 | Iman | L93JTIZ | 25506511 | 7049073643 | (829) 555-5269
467400 | Luca | 4328GD8 | 28500762 | 8496433585 | (389) 555-5198
449774 | Taylor | 1106N58 | 76054385 | 1988161715 | (286) 555-6063


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


caller | receiver | name
(367) 555-5533 | (375) 555-8161 | Bruce
(286) 555-6063 | (676) 555-6554 | Taylor
(770) 555-1861 | (725) 555-3243 | Diana


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

caller | receiver | name
(367) 555-5533 | (375) 555-8161 | Robin
(286) 555-6063 | (676) 555-6554 | James
(770) 555-1861 | (725) 555-3243 | Philip


-- airport from Fiftyville
SELECT *
  FROM airports
 WHERE city = "Fiftyville";

8 | CSF | Fiftyville Regional Airport | Fiftyville


-- flights on the next day
SELECT *
  FROM flights
 WHERE year = 2021
   AND month = 7
   AND day = 29;

id | origin_airport_id | destination_airport_id | year | month | day | hour | minute
18 | 8 | 6 | 2021 | 7 | 29 | 16 | 0
23 | 8 | 11 | 2021 | 7 | 29 | 12 | 15
36 | 8 | 4 | 2021 | 7 | 29 | 8 | 20
43 | 8 | 1 | 2021 | 7 | 29 | 9 | 30
53 | 8 | 9 | 2021 | 7 | 29 | 15 | 20


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

destination_airport_id | full_name | city | full_name | day | hour | minute
4 | LaGuardia Airport | New York City | LaGuardia Airport | 29 | 8 | 20
1 | O'Hare International Airport | Chicago | O'Hare International Airport | 29 | 9 | 30


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

flight_id | passport_number | seat | id | name | phone_number | passport_number | license_plate
36 | 5773159633 | 4A | 686048 | Bruce | (367) 555-5533 | 5773159633 | 94KL13X
36 | 1988161715 | 6D | 449774 | Taylor | (286) 555-6063 | 1988161715 | 1106N58
36 | 8496433585 | 7B | 467400 | Luca | (389) 555-5198 | 8496433585 | 4328GD8
*/



