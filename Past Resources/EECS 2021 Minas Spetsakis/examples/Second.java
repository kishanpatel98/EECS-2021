import java.util.*;

public class Second
{
   public static void main(String[] args)
   {

	int x = (new Scanner(System.in)).nextInt();
	int count = 0;
	for (int i = 0; i < 32 && x != 0; i++)
	{
		count = count + (x & 1);
		x = x >>> 1;
	}
	System.out.println(count);	
   }
}

