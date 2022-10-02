#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>


typedef uint8_t BYTE;

bool validator(unsigned char *buffer);

int main(int argc, char *argv[])
{
    if (argc > 2 || argc < 2)
    {
        printf("Usage: ./recover filename.\n");
        return 1;
    }

    char * file = argv[1];
    BYTE buffer[512];
    FILE *f = fopen(file, "r");
    FILE *img;
    char filename[8];
    int nJPEG = -1;
    //int end = fread(buffer, sizeof(buffer), 1, f;)

    while (fread(buffer, sizeof(buffer), 1, f))
    {
        if (validator(buffer))
        {
            nJPEG++;
            sprintf(filename, "%03i.jpg", nJPEG);
            img = fopen(filename, "w");
            fwrite(buffer, sizeof(buffer), 1, img);

        }
        else if (img)
        {
            fwrite(buffer, sizeof(buffer), 1, img);
        }
    }
    if (nJPEG == -1)
    {
        printf("No files to be recovered.");
        return 1;
    }

    fclose(f);
    return 0;
}

bool validator(unsigned char *buffer)
{
    // validates the file header for jpeg
    bool ret = false;

    if ((buffer[0] == 0xff && buffer[1] == 0xd8 && buffer[2] == 0xff) && ((buffer[3] & 0xf0) == 0xe0))
    {
        ret = true;
    }

    return ret;
}