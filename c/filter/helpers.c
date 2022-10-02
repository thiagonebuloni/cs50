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
    return;
}

// Detect edges
void edges(int height, int width, RGBTRIPLE image[height][width])
{
    RGBTRIPLE copy[height][width];

    int gX[3][3] = {{-1, 0, 1}, {-2, 0, 2}, {-1, 0, 1}};
    int gY[3][3] = {{-1, -2, -1}, {0, 0, 0,}, {1, 2, 1}};

    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            float n = 0.0;
            int indexY = 0;
            float pixelR = 0.0;
            float pixelG = 0.0;
            float pixelB = 0.0;

            float sqrRX = 0.0;
            float sqrRY = 0.0;
            float sqrGX = 0.0;
            float sqrGY = 0.0;
            float sqrBX = 0.0;
            float sqrBY = 0.0;

            for (int k = i - 1; k < i + 2; k++)
            {
                int indexX = 0;

                for (int l = j - 1; l < j + 2; l++)
                {
                    if ((k >= 0 && k < height) && (l >= 0 && l < width))
                    {
                        sqrRX += image[k][l].rgbtRed * gX[indexY][indexX];
                        sqrRY += image[k][l].rgbtRed * gY[indexY][indexX];

                        sqrGX += image[k][l].rgbtGreen * gX[indexY][indexX];
                        sqrGY += image[k][l].rgbtGreen * gY[indexY][indexX];

                        sqrBX += image[k][l].rgbtBlue * gX[indexY][indexX];
                        sqrBY += image[k][l].rgbtBlue * gY[indexY][indexX];

                        //n++;
                    }
                    indexX++;
                }
                indexY++;
            }

            pixelR = sqrt((sqrRX * sqrRX) + (sqrRY * sqrRY));
            pixelG = sqrt((sqrGX * sqrGX) + (sqrGY * sqrGY));
            pixelB = sqrt((sqrBX * sqrBX) + (sqrBY * sqrBY));

            if (pixelR < 0.0)
            {
                pixelR = 0.0;
            }
            else if (pixelR > 255)
            {
                pixelR = 255.0;
            }

            copy[i][j].rgbtRed = round(pixelR);

            if (pixelG < 0.0)
            {
                pixelG = 0.0;
            }
            else if (pixelG > 255)
            {
                pixelG = 255.0;
            }

            copy[i][j].rgbtGreen = round(pixelG);

            if (pixelB < 0.0)
            {
                pixelB = 0.0;
            }
            else if (pixelB > 255)
            {
                pixelB = 255.0;
            }

            copy[i][j].rgbtBlue = round(pixelB);
        }
    }

    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            image[i][j] = copy[i][j];
        }
    }
    return;
}
