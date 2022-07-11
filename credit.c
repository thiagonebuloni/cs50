#include <stdio.h>
#include <cs50.h>
#include <string.h>

int main(void)
{
    long card = 0;
    char ccl[16];
    int cont = 0, sum = 0;

    //get number from user
    do
    {
        card = get_long("Número: ");
    }
    while (card == 0);

    // converts long number to char array
    sprintf(ccl, "%li", card);

    int size = strlen(ccl);
    int cc[size];                                       // creates a int array just the right size

    if (size < 13 || size > 16) {
        printf("INVALID\n");
        return 0;

    }
    // transforms the char array values in an int array, converting the value

    for (int i = 0; i < size; i++) {
        cc[i] = ((int) ccl[i] - 48);
    }



    //calculation

    cont = size - 1;
    while (cont >= 0)
    {
        sum += cc[cont];

        cont--;

        if ((cc[cont] * 2) > 9) {
            sum += (cc[cont] * 2) - 9;
        } else {
            sum += cc[cont] * 2;
        }
        cont--;

    }

    char validator[2];
    sprintf(validator, "%i", sum);


    if (validator[1] != '0') {
        printf("INVALID\n");
    } else {
        if (ccl[0] == '3' && (ccl[1] == '4' || ccl[1] == '7')) {
            printf("AMEX\n");
        } else if (ccl[0] == '4') {
            printf("VISA\n");
        } else {
            if ( ccl[0] == '5' && ccl[1] > '0' && ccl[1] < '6'){
            printf("MASTERCARD\n");
            } else {
                printf("INVALID\n");
            }
        }
    }




}
