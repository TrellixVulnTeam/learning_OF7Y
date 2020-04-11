package com.JingleJavaFun;

import java.text.NumberFormat;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        // Create your principal variable using scanner
        Scanner scanner = new Scanner(System.in);
        System.out.println("Principal: ");
        float principal = scanner.nextFloat();
        // make your interest rate variable
        Scanner scanner1 = new Scanner(System.in);
        System.out.println("Annual interest rate(percent): ");
        float annualInterestRate = scanner1.nextFloat();
        // make your period variable
        Scanner scanner2 = new Scanner(System.in);
        System.out.println("Period(years): ");
        byte period = scanner2.nextByte();

        // create your calculator using the formula and new variables
        float monthlyInterestRate = (annualInterestRate/100)/12;
        float months = period*12;
        float parenthesis = 1 + monthlyInterestRate;
        double numerator = monthlyInterestRate * Math.pow(parenthesis, months);
        double denominator = Math.pow(parenthesis, months) - 1;
        double mortgage = principal * (numerator/denominator);
        // convert the final input to currency
        NumberFormat currency = NumberFormat.getCurrencyInstance();
        String result = currency.format(mortgage);
        System.out.println("Mortgage: " + result);


    }
}
