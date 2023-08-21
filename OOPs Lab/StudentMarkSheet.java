import java.util.Scanner;

class RangeException extends Exception {
    public RangeException(String message) {
        super(message);
    }
}

public class StudentMarkSheet {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        try {
            System.out.print("Enter student name: ");
            String studentName = scanner.nextLine();
            int totalMarks = 0;

            for (int subject = 1; subject <= 6; subject++) {
                while (true) {
                    try {
                        System.out.print("Enter marks for subject " + subject + ": ");
                        int marks = Integer.parseInt(scanner.nextLine());

                        if (marks < 0 || marks > 50) {
                            throw new RangeException("Marks should be between 0 and 50");
                        }

                        totalMarks += marks;
                        break;
                    } catch (NumberFormatException e) {
                        System.out.println("Invalid input. Please enter a valid integer.");
                    } catch (RangeException e) {
                        System.out.println(e.getMessage());
                    }
                }
            }

            double percentage = calculatePercentage(totalMarks);

            System.out.println("\nStudent Name: " + studentName);
            System.out.println("Total Marks: " + totalMarks);
            System.out.println("Percentage: " + percentage + "%");

        } catch (Exception e) {
            System.out.println("\nAn error occurred: " + e.getMessage());
        }
    }

    public static double calculatePercentage(int totalMarks) {
        int maxMarks = 50 * 6; // Maximum marks for 6 subjects with 50 as maximum score
        return ((double) totalMarks / maxMarks) * 100;
    }
}
