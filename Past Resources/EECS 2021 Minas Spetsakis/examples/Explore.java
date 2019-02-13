public class Explore
{
	public static void main(String[] args)
	{
		int x = 118;
		System.out.println(Integer.toBinaryString(x));
		System.out.println(Integer.toHexString(x));

		int y = 3;
		int z = y << 1;
		System.out.println(z);

		System.out.println(Integer.toHexString(~y));

	}
}
