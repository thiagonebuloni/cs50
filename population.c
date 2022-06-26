#include <cs50.h>
#include <stdio.h>

int main(void)
{
    // TODO: Solicite o valor inicial ao usuário
    int start_size;
    do
    {
        start_size = get_int("Start size: ");
    }
    while (start_size < 9);

    // TODO: Solicite o valor final ao usuário
    int end_size;
    do
    {
        end_size = get_int("End size: ");
    }
    while (end_size < start_size);

    // TODO: Calcule o número de anos até o limite
    int population = start_size;
    int years = 0;
    while (population < end_size)
    {
        population = population + (population / 3) - (population / 4);
        years++;
    }

    // TODO: Imprima o número de anos
    printf("Years: %i\n", years);
}