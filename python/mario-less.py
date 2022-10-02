
def main():
    height = 0

    try:
        while height < 1 or height > 8:
            height = int(input("Height: "))
    except:
        height = 0
        main()


    for i in range(height):
        print(" " * (height - i - 1), end="")
        for j in range(i + 1):
            print("#", end="")
        print()

main()