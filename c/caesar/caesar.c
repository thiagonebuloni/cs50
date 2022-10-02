#include <cs50.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char crypto(string, int);

int main(int argc, string argv[]) {

    // checks if there's a second argument and if it's numeric character
    if (argc != 2 || (char) argv[1][0] < 48 || (char) argv[1][0] > 57) {
        printf("Usage ./caesar key\n");
        return 1;
    }

    // converts string to int through atoi function
    int k = atoi(argv[1]);

    // checks if the argument is not numeric
    for (int i = 0; i < strlen(argv[1]); i++) {
        if (isdigit(argv[1][i]) == false) {
            printf("Usage ./caesar key\n");
            return 2;
        }

    }

    string plain;

    // gets plain text from user while validating for null entry
    do {
        plain = get_string("Plaintext: ");
    }
    while (plain == NULL);


    if (k > 26) {
        k %= 26;
    }

    //calls cypher function
    crypto(plain, (int) k);
    printf("\n");
    return 0;
}

char crypto(string plain, int k) {
    char cypher[strlen(plain)];

    //validation of caracters -  OK
    for (int i = 0; i < strlen(plain); i++) {
        // checks if index i char is upper case alphabetic
        if (plain[i] >= 'A' && plain[i] <= 'Z') {
            if (plain[i] + k > 90) {
                cypher[i] = plain[i] + k - 26;
            } else {
                cypher[i] =  plain[i] + k;
            }
        // checks if index i char is lower case alphabetic
        } else if (plain[i] >= 'a' && plain[i] <= 'z') {
            if (plain[i] + k > 122) {
                cypher[i] = plain[i] + k - 26;
            } else {
                cypher[i] = plain[i] + k;
            }
        } else {
            cypher[i] = plain[i];
        }
    }

    //prints crypto text
    printf("ciphertext: %s\n", cypher);

    return 0;
}