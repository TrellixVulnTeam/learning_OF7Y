package com.;

import java.util.Scanner;

public class InputOutput {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("You are ");
        byte age = scanner.nextByte();
        System.out.println("You are " + age);
    }
}
