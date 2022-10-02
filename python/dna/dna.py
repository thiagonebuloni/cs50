import csv
import sys


def main():

    # TODO: Check for command-line usage
    if len(sys.argv) != 3:
        sys.exit("Error: not enough arguments. Usage: python dna.py database/<filename>.csv sequences/<number>.txt")


    # TODO: Read database file into a variable
    database = sys.argv[1]
    count = 0
    keys = []
    data = []

    with open(database, newline="") as file:
        r = csv.reader(file, delimiter=",")
        for row in r:
            count += 1
            if count == 1:
                keys.append(row)
            else:
                data.append(row)


    # TODO: Read DNA sequence file into a variable
    sequence = sys.argv[2]
    seq = ""

    with open(sequence, newline="") as file:
        seq = file.read()

    # TODO: Find longest match of each STR in DNA sequence
    match = [0] * len(keys[0])
    for i in range(1, len(keys[0])):
        try:
            start = seq.index(keys[0][i])
        except:
            break
        subsequence = seq[start:start + len(keys[0][i])]
        match[i] = longest_match(seq, subsequence)


    # TODO: Check database for matching profiles

    for i in range(len(data)):
        name = ""
        c = 0
        for j in range(1, len(match)):
            if int(data[i][j]) == match[j]:
                c += 1
                name = data[i][0]


        if c == len(keys[0]) - 1:
            print(name)
            return 0
    print("No match")
    return


def longest_match(sequence, subsequence):
    """Returns length of longest run of subsequence in sequence."""

    # Initialize variables
    longest_run = 0
    subsequence_length = len(subsequence)
    sequence_length = len(sequence)

    # Check each character in sequence for most consecutive runs of subsequence
    for i in range(sequence_length):

        # Initialize count of consecutive runs
        count = 0

        # Check for a subsequence match in a "substring" (a subset of characters) within sequence
        # If a match, move substring to next potential match in sequence
        # Continue moving substring and checking for matches until out of consecutive matches
        while True:

            # Adjust substring start and end
            start = i + count * subsequence_length
            end = start + subsequence_length

            # If there is a match in the substring
            if sequence[start:end] == subsequence:
                count += 1

            # If there is no match in the substring
            else:
                break

        # Update most consecutive matches found
        longest_run = max(longest_run, count)

    # After checking for runs at each character in sequence, return longest run found
    return longest_run


main()
