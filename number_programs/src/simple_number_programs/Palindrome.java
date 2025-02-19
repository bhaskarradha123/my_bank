package simple_number_programs;

public class Palindrome {

	public static void main(String[] args) {
		/* reverse of a data must match with input
		 * malayalam  reverse malayalam so it is a palindrome
		 * 121 reverse is 121 so it is a Palindrome number
		*/
		numberPalindrome(456);
		stringPalindrome("malayalam");

	}

	static void stringPalindrome(String data) {

		String result = "";
		for (int i = 0; i < data.length(); i++) {
			result += data.charAt(i);
		}

		System.out.println(data + " - " + result);
	}

	static void numberPalindrome(int i) {
        int temp=i;
		int rev = 0;
		while (i > 0) {
			int digit = i % 10;
			rev = rev*10 + digit;
			i = i / 10;
		}
		System.out.println(rev+" "+temp);
	}
}
