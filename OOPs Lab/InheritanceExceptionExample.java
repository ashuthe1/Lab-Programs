import java.util.Scanner;

// Define the Capabilities interface
interface Capabilities {
    void showCapabilities();
}

// Define the custom exception class WrongAgeException
class WrongAgeException extends Exception {
    public WrongAgeException(String message) {
        super(message);
    }
}

// Define the Father class
class Father implements Capabilities {
    private int age;

    public Father(int age) throws WrongAgeException {
        if (age < 0) {
            throw new WrongAgeException("Wrong age: Age cannot be negative.");
        }
        this.age = age;
    }

    @Override
    public void showCapabilities() {
        System.out.println("Father's capabilities: Working, providing for the family.");
    }
}

// Define the Son class extending Father
class Son extends Father {
    private int sonAge;

    public Son(int fatherAge, int sonAge) throws WrongAgeException {
        super(fatherAge);

        if (sonAge > fatherAge) {
            throw new WrongAgeException("Wrong age: Son's age cannot be greater than father's age.");
        }
        this.sonAge = sonAge;
    }

    @Override
    public void showCapabilities() {
        System.out.println("Son's capabilities: Studying, learning, playing.");
    }
}

public class InheritanceExceptionExample {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        try {
            System.out.print("Enter father's age: ");
            int fatherAge = Integer.parseInt(scanner.nextLine());

            System.out.print("Enter son's age: ");
            int sonAge = Integer.parseInt(scanner.nextLine());

            Father father = new Father(fatherAge);
            Son son = new Son(fatherAge, sonAge);

            father.showCapabilities();
            son.showCapabilities();
        } catch (NumberFormatException e) {
            System.out.println("Invalid input format. Please enter valid integer ages.");
        } catch (WrongAgeException e) {
            System.out.println("Exception: " + e.getMessage());
        }
    }
}
