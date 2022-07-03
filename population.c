#include <cs50.h>
#include <stdio.h>

int main(void)
{
    // gets the start size of the population
    int start_size;
    do
    {
        start_size = get_int("Start size: ");
    }
    while (start_size < 9);

    // gets the desired final size of the population
    int end_size;
    do
    {
        end_size = get_int("End size: ");
    }
    while (end_size < start_size);

    // calculation
    int population = start_size;
    int years = 0;
    while (population < end_size)
    {
        population = population + (population / 3) - (population / 4);
        years++;
    }

    // outputs the number of years to achieve the end size
    printf("Years: %i\n", years);
}
