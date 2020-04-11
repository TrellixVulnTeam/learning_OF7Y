import java.util.Scanner;
public class PickASong{

	public static void main(String[] args){
		// create the scanner so that a choice is made
		Scanner scanner = new Scanner(System.in);
		System.out.println("Pick an artist (Outkast or Shaggy): ");
		String artist = scanner.next();
		System.out.println("Let's see how much you know about " + artist);
		// write an if statement so that it prints out the first line of lyrics for the chosen artist
		if(artist == "Outkast"){
			System.out.println("All the guys would say she's mighty fine!");
		}
		else {
			System.out.println("Honey came in and she caught red handed");
		}
	}
}
