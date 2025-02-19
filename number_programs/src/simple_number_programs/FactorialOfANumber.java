package simple_number_programs;

public class FactorialOfANumber {

	public static void main(String[] args) {
 /*
  * product of its own factors ---5!-->5*4*3*2*1=120
  */
		System.out.println(iterative(5));
		System.out.println(recursive(5));
	}

	static int iterative(int a) {

		int out = 1;
		for (int i = 1; i <= a; i++) {

			out *= i;
		}
		return out;
	}

	static int recursive(int n) {

		if (n == 0 || n == 1)
			return 1;

		return n * recursive(n - 1);
	}

}
