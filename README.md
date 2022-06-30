# cs50

Repository for tracking learning achievement in cs50's Harvard.

=== 1 - population ===

Code to calculate population growth. 
Input the start size and end size of the population, and it will output how manny years to achieve the end size.

Usage:

$ ./population
<start size>
<end size>

![image](https://user-images.githubusercontent.com/100470956/175814006-81b67739-94ad-4dea-8966-f9b30cfc36d1.png)


=== 2 - readability ===

Analize a text to determine the level of readability 
Input the snippet and it outputs the grade needed.
This readability test is based on the Coleman-Liau index.
It gets the number of sentences, words and letters.

The equation:
  index = 0,0588 * L - 0,296 * S - 15,8
  Where L is the average number of letters per 100 words in the text.
  And S is the average number of sentences per 100 words in the text.

Usage:

$ ./readabiility
<snippet>

![image](https://user-images.githubusercontent.com/100470956/175815223-6c1d70fd-a1f3-47b0-bfcc-35b1728f1daa.png)

=== 3 - substitution ===

Given a key with a 26 alphabetic characters in any order and a plain text, returns a encrypted
version based on the order of the characters in the key.

Usage:

$ ./substitution VCHPRZGJNTLSKFBDQWAXEUYMOI
<plain text>

![image](https://user-images.githubusercontent.com/100470956/176780785-2445894e-f691-4bf0-a7eb-5da0b9a440c5.png)
