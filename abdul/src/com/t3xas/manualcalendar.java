package com.t3xas;

import java.util.Scanner;

public class manualcalendar {

	public static int January = 31;
	public static int Febraury = 28;
	public static int March = 31;
	public static int April = 30;
	public static int May = 31;
	public static int June = 30;
	public static int July = 31;
	public static int August = 31;
	public static int September = 30;
	public static int October = 31;
	public static int November = 30;
	public static int December = 31;

	static int[] months = { January, Febraury, March, April, May, June, July, August, September, October, November,
			December };

	private static int isleapyear(int year) {
		// TODO Auto-generated method stub
		int days = 0;

		if ((year % 4 == 0) && year % 100 != 0) {
			days = 366;
			Febraury = 29;
		} else if ((year % 4 == 0) && (year % 100 == 0) && (year % 400 == 0)) {
			days = 366;
			Febraury = 29;
		} else {
			days = 365;
		}
		return days;
	}

	public static int daysfrommonth(int date, int month, int days) {
		// TODO Auto-generated method stub
		int calcdays = 0;

		for (int i = 1; i < month; i++) {

			calcdays += months[i];

		}

		calcdays += date;

		return calcdays;
	}

	private static int findpreviousdate(int finddays, int calcdays, int currentyear) {
		// TODO Auto-generated method stub
		int totaldays = 0;
		int newyear = 0;
		int newdate = 0;
		int newmonth = 0;

		totaldays = calcdays - finddays;
		if (totaldays > 0) {

			newyear = currentyear;
			int founddays = calcdays - finddays;
			for (int i = 0; i < months.length; i++) {

				newdate += months[i];

				if (founddays < newdate) {
					newdate -= months[i];

					newdate = founddays - newdate;
					newmonth = i + 1;

					break;

				}

			}
			System.out.println("-------------------------------------");
			System.out.println("-------------------------------------");
			System.out.printf("%-15s%02d/%02d/%02d%n", "Previous Date", newdate, newmonth, newyear);

		}

		while (totaldays < 0) {
			newyear = --currentyear;
			if (isleapyear(newyear) == 366) {
				totaldays += 1;
			}

			for (int i = months.length - 1; i >= 0; i--) {

				totaldays += months[i];

				if (totaldays > 0) {
					newdate = totaldays;
					newmonth = i + 1;

					System.out.println("-------------------------------------");
					System.out.println("-------------------------------------");
					System.out.printf("%-15s%02d/%02d/%02d%n", "Previous Date", newdate, newmonth, newyear);
					break;

				}

			}

		}

		return totaldays;
	}

	private static int findfuturedate(int finddays, int calcdays, int currentyear) {
		// TODO Auto-generated method stub
		int newdate = 0;
		int newmonth = 0;
		int newyear = 0;
		boolean breaker = true;
		int remainingdaysincurrentyear = (isleapyear(currentyear) - calcdays);

		int remainingdays = finddays - remainingdaysincurrentyear;

		if (remainingdays < 0) {
			newyear = currentyear;

			int totaldays = calcdays + finddays;
			if (isleapyear(currentyear) == 366) {

				newdate += 1;
			}
			for (int i = 0; i < months.length; i++) {
				newdate += months[i];
				if (newdate > totaldays) {
					newdate -= months[i];
					newdate = totaldays - newdate;
					newmonth = i + 1;
					System.out.printf("%-15s%02d/%02d/%02d%n", "Future Date", newdate, newmonth, newyear);
					System.out.println("-------------------------------------");
					System.out.println("-------------------------------------");
					break;

				}

			}

		}

		else if (remainingdays <= 366) {

			newyear = ++currentyear;

			if (isleapyear(newyear) == 366) {
				newdate += 1;
			}

			for (int i = 0; i < months.length; i++) {
				newdate += months[i];
				if (newdate > remainingdays) {
					newdate -= months[i];
					newdate = remainingdays - newdate;
					newmonth = i + 1;
					System.out.printf("%-15s%02d/%02d/%02d%n", "Future Date", newdate, newmonth, newyear);
					System.out.println("-------------------------------------");
					System.out.println("-------------------------------------");
					break;

				}

			}
		} else {

			while (remainingdays >= 365) {
				newyear = ++currentyear;
				if (isleapyear(newyear) == 366) {

					newdate += 1;
				}
				for (int i = 0; i < months.length; i++) {

					newdate += months[i];
					if (newdate > remainingdays) {
						newdate -= months[i];
						newdate = remainingdays - newdate;
						newmonth = i + 1;
						System.out.printf("%-15s%02d/%02d/%02d%n", "Future Date", newdate, newmonth, newyear);
						System.out.println("-------------------------------------");
						System.out.println("-------------------------------------");
						breaker = false;
						break;

					}

				}

				if (breaker == false)
					break;
			}

		}

		return newdate;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter current date");
		int currentdate = sc.nextInt();
		System.out.println("Enter current month");
		int currentmonth = sc.nextInt();
		System.out.println("Enter current year");
		int currentyear = sc.nextInt();
		System.out.println("Enter Number of Days");
		int finddays = sc.nextInt();
		int daysincurrentyear = isleapyear(currentyear);

		int calcdays = daysfrommonth(currentdate, currentmonth, daysincurrentyear);
		
		findpreviousdate(finddays, calcdays, currentyear);
		
		findfuturedate(finddays, calcdays, currentyear);
		
	}

}
