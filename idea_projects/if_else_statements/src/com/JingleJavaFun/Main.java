package com.JingleJavaFun;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Age: ");
        byte age = scanner.nextByte();
        if (age > 20) {
            System.out.println("You are old enough to enter!");
        }
        else {
            System.out.println("You are not old enough to enter, sorry.");
        }
    }
}
