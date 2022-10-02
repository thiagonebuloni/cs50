#include <cs50.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>

int substitution(char*);

int main(int argc, string argv[]) {
    if (argc != 2) {
        printf("Usage ./substitution key\n ");
        return 1;
    } else if (strlen(argv[1]) != 26) {
        printf("Use a 26 unique character key\nUsage ./substitution key\n");
        return 2;
    }

    // Converting argv string to char*
    char key[26];
    sprintf(key, "%s", argv[1]);

    // Verifies if there's numbers or special characters in the key
    for (int i = 0, c = 1; i <= strlen(key) - 1; i++, c++) {
        if (isdigit((int) key[i]) || (int) key[i] < 65 || ((char) key[i] > 'Z' && (char) key[i] < 'a') || (char) key[i] > 'z') {
            printf("%c\n", key[i]);
            printf("%d - %d - %d - %d\n", (int) key[i] < 65, (char) key[i] > 'Z', (char) key[i] < 'a', (char) key[i] > 'z');
            printf("Only key with 26 alphabetic characteres are acceptable.\n");
            return 3;
        }

        // Verifies if there's only unique characters, case sensitive
        for (int k = c; k <= strlen(key); k++) {
            if (key[i] == key[k] || key[i] == (char) key[k] - 32 || (char) key[i] == key[k] + 32) {
                printf("%c - %c\n", key[i], key[k]); // OK
                printf("Only keys with 26 unique characteres are acceptable\n");
                return 4;
            }
        }
    }
    substitution(key);
}


int substitution(char * key) {
    string plain = get_string("Plain text: ");
    char * upper_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    char * lower_chars = "abcdefghijklmnopqrstuvwxyz";
    char * plain_array = plain;
    char * cipher_array = plain;

    sprintf(plain_array, "%s", plain);

    for (int i = 0; i < strlen(plain_array); i++) {
        if (isupper(plain_array[i])) {
            // is upper
            for (int j = 0; j < strlen(key); j++) {
                if (plain_array[i] == upper_chars[j]) {
                    cipher_array[i] = toupper(key[j]);
                    break;
                }
            }
        } else if (islower(plain_array[i])) {
            // is lower
            for (int k = 0; k < strlen(key); k++) {
                if (plain_array[i] == lower_chars[k]) {
                    cipher_array[i] = tolower(key[k]);
                    break;
                }
            }
        } else {
            cipher_array[i] = plain_array[i];
        }
    }

    printf("ciphertext: %s\n", cipher_array);
    return 0;
}