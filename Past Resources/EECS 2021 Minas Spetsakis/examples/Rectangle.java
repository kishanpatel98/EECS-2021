public class Rectangle
{
	private int width;
	private int height;

	public Rectangle(int w, int h)
	{
		this.width = w;
		this.height = h;
	}

	public int getArea()
	{
		int tmp = this.width * this.height;
		return tmp;
	}

	public int getCircumference()
        {
                int tmp = 2 * (this.width + this.height);
                return tmp;
        }
}
