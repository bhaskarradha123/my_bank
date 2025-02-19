package simple_number_programs;

public class FactorOfANumber {

	public static void main(String[] args) {
		
		int a=12;
		
		for (int i = 1; i <= 12; i++) {
			if(a%i==0)
				System.out.println(i);
		}
	}
}
