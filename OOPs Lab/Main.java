import java.util.*;

public class Main{
    public static void main(String argc[])
    {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter the Sentence");

        String str = sc.nextLine();
        int n = str.length();
        
        String final_str = "";
        for(int i = 0; i < n; i++)
        {
            if(str.charAt(i) == 'A' || str.charAt(i) == 'a') continue;
            final_str += str.charAt(i);
        }

        System.out.print("The resultant String is:");
        System.out.println(final_str);
    }
}