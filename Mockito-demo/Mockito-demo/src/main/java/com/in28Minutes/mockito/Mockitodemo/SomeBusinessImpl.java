package com.in28Minutes.mockito.Mockitodemo;

public class SomeBusinessImpl {

	private DataService service;

	public SomeBusinessImpl(DataService service) {
		super();
		this.service = service;
	}

	int findGreatestFromAllData() {
		int[] data = service.retrieveAllData();
		int greatest = Integer.MIN_VALUE;
		for (int value : data) {

			if (value > greatest)
				greatest = value;

		}
		return greatest;
	}

}
