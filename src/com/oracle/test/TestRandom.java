package com.oracle.test;

import java.util.Random;

public class TestRandom {
	public static void main(String[] args) {
		Random r = new Random();

		String rstr = "";
		for (int i = 1; i <= 4; i++) {
			rstr += r.nextInt(10);
		}

		System.out.println(rstr);

	}
}
