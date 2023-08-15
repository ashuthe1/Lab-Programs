#include<stdio.h>

int main() {
    int n, i;
    int bt[20], wt[20], tt[20];
    float avgwt = 0.0;
    clrscr();   

    printf("Enter no. of processes: ");
    scanf("%d", &n);
    for(i = 0;  i < n; i++) {
        printf("Enter burst time for process %d: ", i+1);
        scanf("%d", &bt[i]);
    }
    wt[0] = 0; tt[0] = bt[0];
    for(i = 1; i < n; i++) {
        wt[i] = tt[i-1];
        tt[i] = wt[i] + bt[i];
        avgwt += (float)wt[i];
    }
    avgwt /= n;
    printf("Average waiting time: %f\n", avgwt);
    
    for(i = 0;  i < n; i++) 
	    printf("Process %d\tWaiting time: %d \tTurnaround time: %d\n", i+1, wt[i], tt[i]);

    getch();
    return 0;
}