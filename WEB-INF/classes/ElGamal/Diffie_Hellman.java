package ElGamal;

import java.math.*;
import java.util.*;
import java.security.*;
import java.io.*;



public class Diffie_Hellman
{
	public static void main(String arg[])
        {
			Diffie_Hellman a=new Diffie_Hellman();
        	System.out.println("Welcome to Diffie Hellman");
        }


    //Elgamal Encryption
    public static String key_exchange(String c11,String xx, String pp)
        {

        	BigInteger c1 = new BigInteger(c11);

	        BigInteger p = new BigInteger(pp);

	        BigInteger x = new BigInteger(xx);

	        BigInteger k2 = c1.modPow(x, p);


	        System.out.println("****************");
	        System.out.println("\n");
	        System.out.println("Diffie-Hellman key exchange");
	        System.out.println("K2= "+k2);

	        System.out.println("\n");
	        System.out.println("****************");

	        return k2.toString();

    	}




}
