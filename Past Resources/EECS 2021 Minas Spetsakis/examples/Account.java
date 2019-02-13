public class Account implements Runnable
{
	private int balance;
	private int out;

	public Account()
	{
		this.balance = 0;
		this.out = 0;
	}

	public void setBalance(int a)
	{
		this.balance = a;
	}

	public int getBalance()
	{
		return this.balance;
	}

	public void withdraw(int a)
	{
		int current = this.getBalance();
		if (a > 0 && a <= current)
		{
			current -= a;
			setBalance(current);
			this.out += a;
		}
	}

	public void run()
	{
		for (int i = 0; i < 30; i++)
		{
			int x = (int) (1 + 2 *Math.random());
			this.withdraw(x);
			String me = Thread.currentThread().getName();
			System.out.println(me + " took " + x + " balance = " +
			 this.balance + " out = " + this.out + " Totl=" + 
			 (this.balance + this.out));
		}
	}

	public static void main(String[] args)
	{
		Account ac = new Account();
		ac.setBalance(20000);
		/*
		(new Thread(ac)).start();
                (new Thread(ac)).start();
                (new Thread(ac)).start();
                (new Thread(ac)).start();
                (new Thread(ac)).start();
                (new Thread(ac)).start();
		*/
		for (int i = 0; i < 200; i++)
			(new Thread(ac)).start();

	}
}
