
def main():
    height = 0

    try:
        while height < 1 or height > 8:
            height = int(input("Height: "))
    except:
        height = 0 # without this after a few wrong inputs, height kept the first wrong int value inputed
        main()


    for i in range(height):
        print(" " * (height - i - 1), end="")
        for j in range(i + 1):
            print("#", end="")
        print()

main()