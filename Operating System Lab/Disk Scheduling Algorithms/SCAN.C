#include <stdio.h>
#include <stdlib.h>

int size = 8;
int disk_size = 200;

void sortArray(int arr[], int n) {
    for (int i = 0; i < n - 1; i++) {
        for (int j = i + 1; j < n; j++) {
            if (arr[i] > arr[j]) {
                int temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
            }
        }
    }
}

void SCAN(int arr[], int n, int head, char direction) {
    int distance, idx = 0, cur_track, left[n+1], right[n+1], left_count = 0, right_count = 0, seek_count = 0, seek_sequence[n];
    if (direction == 'l') {
        left[left_count++] = 0;
    } else if (direction == 'r') {
        right[right_count++] = disk_size - 1;
    }

    for (int i = 0; i < n; i++) {
        if (arr[i] < head) {
            left[left_count++] = arr[i];
        }
        if (arr[i] > head) {
            right[right_count++] = arr[i];
        }
    }

    sortArray(left, left_count);
    sortArray(right, right_count);

    for (int run = 0; run < 2; run++) {
        if (direction == 'l') {
            for (int i = left_count - 1; i >= 0; i--) {
                cur_track = left[i];
                seek_sequence[idx++] = cur_track;
                distance = abs(cur_track - head);
                seek_count += distance;
                head = cur_track;
            }
            direction = 'r';
        } else if (direction == 'r') {
            for (int i = 0; i < right_count; i++) {
                cur_track = right[i];
                seek_sequence[idx++] = cur_track;
                distance = abs(cur_track - head);
                seek_count += distance;
                head = cur_track;
            }
            direction = 'l';
        }
    }

    printf("Total number of seek operations = %d\n", seek_count);
    printf("Seek Sequence is: ");
    for (int i = 0; i < idx; i++) {
        printf("%d ", seek_sequence[i]);
    }
}

int main() {
    int arr[size] = { 176, 79, 34, 60, 92, 11, 41, 114 };
    int head = 50;
    char direction = 'l';
    int n = sizeof(arr) / sizeof(arr[0]);
    SCAN(arr, n, head, direction);

    return 0;
}
