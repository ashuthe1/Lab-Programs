public class JavaHungr {
    public static void main(String args[])
    {
        try
        {
            System.out.print("A");
            int num = 99/0;
            System.out.print("B");
        }
        System.out.print("C");
        catch(ArithmeticException ex)
        {
        System.out.print("D");
        }
    }
}