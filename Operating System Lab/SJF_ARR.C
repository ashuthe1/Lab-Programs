#include <stdio.h>
typedef struct fcfs
{
    int process, burst, arrival;
    int tat, wt;
} fcfs;
void sort(fcfs[], int);
int main()
{
    int n, i, temp = 0, avgtt = 0, avgwt = 0;
    fcfs arr[20];
    int tct[20];
    clrscr();
    printf("Enter the number of processes: ");
    scanf("%d", &n);
    for (i = 0; i < n; i++)
    {
	arr[i].process = i+1;
	printf("Enter the process %d data\n", arr[i].process);
	printf("Enter CPU Burst: ");
	scanf("%d", &(arr[i].burst));
	printf("Enter the arrival time: ");
	scanf("%d", &(arr[i].arrival));
    }
    sort(arr, n);
    for (i = 0; i < n; i++)
    {
	tct[i] = temp + arr[i].burst;
	temp = tct[i];
	arr[i].tat = tct[i] - arr[i].arrival;
	arr[i].wt = arr[i].tat - arr[i].burst;
	avgtt += arr[i].tat;
	avgwt += arr[i].wt;
	printf("Process %d  Burst time %d  Arrival time %d  Waiting time %d  Turnaround time %d\n", arr[i].process, arr[i].burst, arr[i].arrival, arr[i].tat, arr[i].wt);
    }
    printf("Average Turn Around Time: %f\nAverage Waiting Time: %f\n", avgtt / (float)n, avgwt / (float)n);
    //printf("Average Turn Around Time: %f\nAverage Waiting Time: %f\n", avgtt, avgwt);
    getch();
    return 0;
}
void sort(fcfs arr[], int n)
{
    int i, j;
    fcfs k;
    for (i = 0; i < n - 1; i++)
    {
	for (j = i + 1; j < n; j++)
	{
	    if (arr[i].arrival > arr[j].arrival)
	    {
		k = arr[i];
		arr[i] = arr[j];
		arr[j] = k;
	    }
	}
    }
}
