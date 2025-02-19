package simple_number_programs;

public class LargestNumberInArray {

	public static void main(String[] args) {
		int[] arr = { 2, 3, 56, 34, 567, 345, 87991, 999 };

		int largest = arr[0];
		for (int i = 1; i < arr.length; i++) {
			if (arr[i] > largest)
				largest = arr[i];
		}
		System.out.println(largest);
	}
}
