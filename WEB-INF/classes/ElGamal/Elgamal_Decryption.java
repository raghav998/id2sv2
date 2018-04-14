package ElGamal;

import java.math.*;
import java.util.*;
import java.security.*;
import java.io.*;



public class Elgamal_Decryption
{
	public static void main(String arg[])
        {
			Elgamal_Decryption a=new Elgamal_Decryption();
        	System.out.println("Welcome to Elgamal Decryption");
        }

    	
    //Elgamal Encryption 
    public static String decrypt(String ckey,String c22, String pp)
        {
        	
        	BigInteger c2 = new BigInteger(c22);
        	
	        BigInteger p = new BigInteger(pp);
	        
	        BigInteger k = new BigInteger(ckey);
	        
	        BigInteger kinv = k.modInverse(p);
			
			BigInteger m = (kinv.multiply(c2)).mod(p);	        
	                        
	        System.out.println("****************");
	        System.out.println("\n");
			System.out.println("Elgamal Decryption");
			System.out.println("****************");
	        System.out.println("K inverse="+kinv);
	        System.out.println("\n");
			System.out.println("Recovered Key="+m);
			System.out.println("\n");
	        System.out.println("****************");
	        
	        return m.toString();
		 	
    	}

  


}
