#include<stdio.h>

int findLRU(int time[], int n)
{
    int mi = time[0], pos = 0;
    for(int i = 1; i < n; i++)
    {
        if(time[i] < mi)
        {
            mi = time[i];
            pos = i;
        }
    }
    return pos;
}

int main()
{
    int numOfFrames, numOfPages, frames[10], pages[30], counter = 0, time[10],
    i, j, flag1 = 0, flag2 = 0, pos, faults = 0;
    printf("Enter number of frames: ");
    scanf("%d", &numOfFrames);
    printf("Enter number of pages: ");
    scanf("%d", &numOfPages);

    printf("Enter page reference string: ");
    for(i = 0; i < numOfPages; i++)
        scanf("%d", &pages[i]);

    for(i = 0; i < numOfFrames; i++)
        frames[i] = -1;

    for(i = 0; i < numOfPages; i++)
    {
        flag1 = flag2 = 0;
        for(j = 0; j < numOfFrames; j++)
        {
            if(frames[j] == pages[i])
            {
                counter++;
                time[j] = counter;
                flag1 = flag2 = 1;
                break;
            }
        }
        if(flag1 == 0)
        {
            for(j = 0; j < numOfFrames; j++)
            {
                if(frames[j] == -1)
                {
                    counter++;
                    faults++;
                    frames[j] = pages[i];
                    time[j] = counter;
                    flag2 = 1;
                    break;
                }
            }
        }
        if(flag2 == 0)
        {
            pos = findLRU(time, numOfFrames);
            counter++;
            faults++;
            frames[pos] = pages[i];
            time[pos] = counter;
        }
        printf("\n");
        for(j = 0; j < numOfFrames; j++)
            printf("%d\t", frames[j]);
    }
    printf("\n\nTotal Page Faults = %d", faults);
    return 0;
}