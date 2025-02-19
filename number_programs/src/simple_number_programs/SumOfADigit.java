package simple_number_programs;

public class SumOfADigit {

	public static void main(String[] args) {
		int digit=345, temp=digit;
		
		int sum=0;
		while(digit>0) {
			int rem=digit%10;
			
			sum+=rem;
			digit/=10;
		}
		System.out.println("Sum of all digits in "+temp+" is "+ sum);
	}
}
