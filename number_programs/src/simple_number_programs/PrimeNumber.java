package simple_number_programs;

public class PrimeNumber {

	public static void main(String[] args) {
		
		int a=9;
		int b=0;
		for(int i=2;i<a;i++) {
			if(a%i==0)b++;
		}
		if(b==0)
			System.out.println("prime");
		else
			System.out.println("not a prime");
	}
}
