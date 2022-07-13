#include <cs50.h>
#include <stdio.h>
#include <string.h>

// Max number of candidates
#define MAX 9

// Candidates have name and vote count
typedef struct
{
    string name;
    int votes;
}
candidate;

// Array of candidates
candidate candidates[MAX];

// Number of candidates
int candidate_count;

// Function prototypes
bool vote(string name);
void print_winner(void);

int main(int argc, string argv[])
{
    // Check for invalid usage
    if (argc < 2)
    {
        printf("Usage: plurality [candidate ...]\n");
        return 1;
    }

    // Populate array of candidates
    candidate_count = argc - 1;
    if (candidate_count > MAX)
    {
        printf("Maximum number of candidates is %i\n", MAX);
        return 2;
    }
    for (int i = 0; i < candidate_count; i++)
    {
        candidates[i].name = argv[i + 1];
        candidates[i].votes = 0;
    }

    int voter_count = get_int("Number of voters: ");

    // Loop over all voters
    for (int i = 0; i < voter_count; i++)
    {
        string name = get_string("Vote: ");

        // Check for invalid vote
        if (!vote(name))
        {
            printf("Invalid vote.\n");
        }
    }

    // Display winner of election
    print_winner();
}

// Update vote totals given a new vote
bool vote(string name)
{
    // validation of candidate name
    for (int i = 0; i < candidate_count; i++) {
        if (strcmp(name, candidates[i].name) == 0) {
            candidates[i].votes += 1;
            return true;
        }
    }
    return false;
}

// Print the winner (or winners) of the election
void print_winner(void)
{
    //int greater = 0;
    int sorted[candidate_count];

    /* populate array for sort
    for (int i = 0; i < candidate_count; i++) {
        sorted[i] == candidates[i].votes;
    }*/

    // sort candidates by votes
    string tmp_name;
    int tmp_votes;
    for (int i = 0; i < candidate_count - 1; i++) {
        for (int j = 1; j < candidate_count; j++) {
            if (candidates[i].votes > candidates[j].votes) {
                //greater = i;
            } else {
                //greater = i + 1;
                tmp_name = candidates[j].name;
                tmp_votes = candidates[j].votes;
                candidates[j].name = candidates[i].name;
                candidates[j].votes = candidates[i].votes;
                candidates[i].name = tmp_name;
                candidates[i].votes = tmp_votes;
            }
        }
    }

    // compare if there's 2 or more cadidates with same number of votes
    //int winners_count = 0;
    for (int i = 0; i < candidate_count; i++) {
        if (candidates[i].votes == candidates[i + 1].votes && candidates[i].votes != 0) {
            printf("%s\n", candidates[i].name);
            //printf("%s\n", candidates[i + 1].name);
        } else if (candidates[i].votes != 0) {
            printf("%s\n", candidates[i].name);
            break;
        } else {
            printf("No winners\n");
            break;
        }
    }

    /*int winners[winners_count];
    winners[0] == canditates[greater]*/

    return;
}

