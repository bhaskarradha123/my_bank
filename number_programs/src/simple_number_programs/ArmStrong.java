package simple_number_programs;

public class ArmStrong {

	public static void main(String[] args) {
		/*
		 * sum of nth power of the digit eg: 1.153 1*1 + 5*5*5 +
		 * 3*3*3--->1+125+27---->153
		 */

		int digit = 152, temp = digit, temp2=temp;
		int count = 0;
		while (digit > 0) {
			int a = digit % 10;
			count++;
			digit /= 10;
		}

		int result = 0;
		while (temp > 0) {
			int a = temp % 10;
			int output = 1;

			for (int i = 1; i <= count; i++) {

				output = output * a;
			}
			result += output;
			temp /= 10;
		}

		if(result==temp2)
			System.out.println(temp2+ " is ArmStrong Number");
		else
			System.out.println(temp2+" is not a ArmStrong number");
	}
}
