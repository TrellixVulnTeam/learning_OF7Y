package com.helloworld;

import java.sql.SQLOutput;
import java.text.NumberFormat;
import java.util.Scanner;

public class HelloWorld {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Age: ");
        byte age = scanner.nextByte();
        System.out.println("You are " + age);
    }
}
