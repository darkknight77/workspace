package com.data;

public class PowerOfNumber {

	public static long power(int num, int power) {
		long output = 1;
		while (power > 1) {
			output*= num * num;
			power -= 2;
		}

		return output;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println(power(356, 4));

	}

}
