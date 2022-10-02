#include <math.h>

#include "helpers.h"

// Convert image to grayscale
void grayscale(int height, int width, RGBTRIPLE image[height][width])
{
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            float pixel = round((image[i][j].rgbtRed + image[i][j].rgbtGreen + image[i][j].rgbtBlue) / 3.0);
            image[i][j].rgbtRed = image[i][j].rgbtGreen = image[i][j].rgbtBlue = pixel;
        }
    }
    return;
}

// Convert image to sepia
void sepia(int height, int width, RGBTRIPLE image[height][width])
{

    float sepiaRed[3] = {0.393, 0.769, 0.189};
    float sepiaGreen[3] = {0.349, 0.686, 0.168};
    float sepiaBlue[3] = {0.272, 0.534, 0.131};

    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            float pixelR = 0.0;
            float pixelG = 0.0;
            float pixelB = 0.0;

            pixelR = (image[i][j].rgbtRed * sepiaRed[0]) + (image[i][j].rgbtGreen * sepiaRed[1]) + (image[i][j].rgbtBlue * sepiaRed[2]);
            pixelG = (image[i][j].rgbtRed * sepiaGreen[0]) + (image[i][j].rgbtGreen * sepiaGreen[1]) + (image[i][j].rgbtBlue * sepiaGreen[2]);
            pixelB = (image[i][j].rgbtRed * sepiaBlue[0]) + (image[i][j].rgbtGreen * sepiaBlue[1]) + (image[i][j].rgbtBlue * sepiaBlue[2]);

            if (pixelR < 0.0)
            {
                pixelR = 0.0;
            }
            else if (pixelR > 255)
            {
                pixelR = 255.0;
            }

            image[i][j].rgbtRed = round(pixelR);

            if (pixelG < 0.0)
            {
                pixelG = 0.0;
            }
            else if (pixelG > 255.0)
            {
                pixelG = 255.0;
            }

            image[i][j].rgbtGreen = round(pixelG);

            if (pixelB < 0.0)
            {
                pixelB = 0.0;
            }
            else if (pixelB > 255.0)
            {
                pixelB = 255.0;
            }

            image[i][j].rgbtBlue = round(pixelB);
        }
    }
}

// Reflect image horizontally
void reflect(int height, int width, RGBTRIPLE image[height][width])
{
    for (int i = 0; i < height; i++)
    {
        RGBTRIPLE copy;

        int end = width - 1;

        for (int j = 0; j < end; j++)
        {
            copy = image[i][j];
            image[i][j] = image[i][end];
            image[i][end] = copy;
            end--;
        }
    }
}

// Blur image
void blur(int height, int width, RGBTRIPLE image[height][width])
{
    RGBTRIPLE copy[height][width];

    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            float n = 0.0;
            float pixelR = 0.0;
            float pixelG = 0.0;
            float pixelB = 0.0;

            for (int k = i - 1; k < i + 2; k++)
            {
                for (int l = j - 1; l < j + 2; l++)
                {
                    if ((k >= 0 && k < height) && (l >= 0 && l < width))
                    {
                        pixelR += image[k][l].rgbtRed;
                        pixelG += image[k][l].rgbtGreen;
                        pixelB += image[k][l].rgbtBlue;
                        n++;
                    }
                }
                copy[i][j].rgbtRed = round(pixelR / n);
                copy[i][j].rgbtGreen = round(pixelG / n);
                copy[i][j].rgbtBlue = round(pixelB / n);

            }
        }
    }

    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            image[i][j] = copy[i][j];
        }
    }
}
