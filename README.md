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

<plain text>
