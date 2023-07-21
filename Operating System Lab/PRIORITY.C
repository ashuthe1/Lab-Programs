#include <stdio.h>
#include <stdlib.h>

int main(){
	int i, j;
	int np;
	int bt[100];
	int pr[100];
	int wt = 0, tt = 0;
	float avg_wt, avg_tt;
	int prev = 0, temp;
	clrscr();
	printf("Enter the number of processes - \n");
	scanf("%d", &np);
	for(i = 0; i < np; i++){
		printf("Enter burst time for process %d\n", i+1);
		scanf("%d", &bt[i]);
		printf("Enter priority for process %d\n", i+1);
		scanf("%d", &pr[i]);
	}
	for(i = 0; i < np; i++){
		for(j = i; j < np; j++){
			if(pr[i] > pr[j]){
				temp = pr[i];
				pr[i] = pr[j];
				pr[j] = temp;

				temp = bt[i];
				bt[i] = bt[j];
				bt[j] = temp;
			}
		}
	}

	for(i = 0; i < np; i++){
		if(i != np - 1){
			wt += bt[i] + prev;
		}
		tt += bt[i] + prev;
		prev += bt[i];
	}

	avg_wt = wt /(float) np;
	avg_tt = tt /(float) np;
	printf("Average waiting Time - %f\n", avg_wt);
	printf("Average Turnaround Time - %f\n", avg_tt);
	getch();
	return 0;
}