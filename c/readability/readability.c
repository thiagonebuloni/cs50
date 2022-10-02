#include <cs50.h>
#include <stdio.h>
#include <string.h>
#include <math.h>

int count_sentences(string);
int count_words(string);
int count_letters(string);
float grade_equation(int, int, int);

//main call functions for calculating sentences, words and letters. Verifies the result and print the grade
int main(void)
{
    string text = get_string("Text: ");
    int sentences = count_sentences(text);
    //printf("Sentences: %d\n", sentences);
    int words = count_words(text);
    //printf("Words: %d\n", words);
    int letters = count_letters(text);
    //printf("Letters: %d\n", letters);
    float result = grade_equation(sentences, words, letters);
    //printf("Grade %f\n", (float) result);
    result = roundf(result);
    if (result < 1.0)
    {
        printf("Before Grade 1\n");
    }
    else if (result > 16.0)
    {
        printf("Grade 16+\n");
    }
    else
    {
        printf("Grade %d\n", (int) result);
    }

}

// count number of sentences and returns - OK
int count_sentences(string text)
{
    int sentences = 0;
    int text_len = strlen(text);
    for (int i = 0; i < text_len; i++)
    {
        if (text[i] == '.' || text[i] == '!' || text[i] == '?')
        {
            sentences++;
        }
    }

    return sentences;
}

// count number of words - OK
int count_words(string text)
{
    int words = 0;
    int text_len = strlen(text);
    for (int i = 0; i < text_len; i++)
    {
        if (text[i] == ' ')
        {
            words++;
        }
    }
    words++;
    return words;
}

// count number of letter, verifing 'a' to 'z'
int count_letters(string text)
{
    int letters = 0;
    int text_len = strlen(text);

    for (int i = 0; i < text_len; i++)
    {

        if (((int) text[i] > 64 && (int) text[i] < 90) || ((int) text[i] > 96 && (int) text[i] < 123))
        {
            if (!(text[i] == ' '))
            {
                letters++;
            }
        }
    }
    return letters;
}

// the proper equation
float grade_equation(int sentences, int words, int letters)
{
    float s = (float) sentences / (float) words * 100;
    //printf("S: %f\n", s);
    float l = (float) letters / (float) words * 100;
    //printf("L: %f\n", l);
    float index = 0.0588 * l - 0.296 * s - 15.8;
    //printf("Index: %f\n", index);

    return index;
}