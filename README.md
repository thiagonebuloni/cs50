# cs50

Repository for tracking learning achievement in cs50's Harvard.

## 1 - population

Code to calculate population growth. 
Input the start size and end size of the population, and it will output how manny years to achieve the end size.

Usage:
```
$ ./population
<start size>
<end size>
```
![image](https://user-images.githubusercontent.com/100470956/175814006-81b67739-94ad-4dea-8966-f9b30cfc36d1.png)


## 2 - readability

Analize a text to determine the level of readability 
Input the snippet and it outputs the grade needed.
This readability test is based on the Coleman-Liau index.
It gets the number of sentences, words and letters.

The equation:
  index = 0,0588 * L - 0,296 * S - 15,8
  Where L is the average number of letters per 100 words in the text.
  And S is the average number of sentences per 100 words in the text.

Usage:
```
$ ./readabiility
<snippet>
```
![image](https://user-images.githubusercontent.com/100470956/175815223-6c1d70fd-a1f3-47b0-bfcc-35b1728f1daa.png)


## 3 - substitution

Given a key with a 26 alphabetic characters in any order and a plain text, returns a encrypted
version based on the order of the characters in the key.

Usage:
```
$ ./substitution VCHPRZGJNTLSKFBDQWAXEUYMOI
<plain text>
```
![image](https://user-images.githubusercontent.com/100470956/176780785-2445894e-f691-4bf0-a7eb-5da0b9a440c5.png)


## 4 - caesar

Program that implements the caesar encryption.
It takes an integer argument as a key to how many rotations on the characters of the alphabet will be made to encrypt a plaintext.

Usage:
```
$ ./caesar 3
<plain text>
```
![image](https://user-images.githubusercontent.com/100470956/177042862-b7cbb7fe-c065-496e-ba5c-70180bbafe73.png)


## 5 - credit

Program that validates credit card numbers and indicates which brand.
It takes the full number of the card without spaces or any other characters.
This program considers the following rules for validation:

- minimum size of the number is 13 digits and maximum is 16
- Amex cards starts with 34 or 37
- Visa cards starts with 4
- Mastercard cards starts with 51, 52, 53, 54 or 55


Usage:
```
$ ./credit
Número: <card number>
```
![image](https://user-images.githubusercontent.com/100470956/178366155-5548e70c-15f0-4cf9-b9ca-3ce1a199015d.png)


## 6 - plurality

Program that execute a simple voting process, plural vote.
It takes the names of the candidates as arguments, asks the number of voters and each voters candidate.

- if the candidate's name is entered incorrectly the program ends.

Usage:
```
$ ./plurality Alice Bob Charlie
Number of voters:
Vote:
Vote:
.
.
.
```
![image](https://user-images.githubusercontent.com/100470956/178732640-bc67b3c7-9e73-40fa-82e8-14f8a3046258.png)


## 7 - runoff

Program that execute a plural voting process.
Each voter chooses candidates in order of preference.

- if the candidate's name is entered incorrectly the program ends.
- the program eliminates candidates with fewer votes.
- the program executes until there is a winner or all remaining candidate is tied.

Usage:
```
$ ./runoff Alice Bob Charlie
Number of voters:
Rank 1:
Rank 2:
Rank 3:

Rank 1:
.
.
.
```
![image](https://user-images.githubusercontent.com/100470956/178733653-84009f1d-0bc0-4fe9-aa8a-18a900d1139f.png)
