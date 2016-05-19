package services;

import beans.DataBean;

public class DataProcessor {

	// Calculate mean
	public double mean(double[] data) {
		double sum = 0.0d;
		for (int i = 0; i < data.length; i++)
			sum = sum + data[i];
		double meanVal = (double) (sum / data.length);
		return meanVal;
	}

	// Calculate Standard deviation
	public double standardDev(double[] data) {
		double mean = mean(data);
		double summation = 0.0d;
		double sd = 0.0d;

		for (int i = 0; i < data.length; i++)
			summation = summation + Math.pow((data[i] - mean), 2);

		sd = Math.sqrt(summation / (double) data.length);
		return sd;
	}
	// Set the values into DataBean
	public DataBean calculate(double[] data) {
		DataBean db = new DataBean();
		db.setMean(mean(data));
		db.setSd(standardDev(data));
		return db;
	}

}
