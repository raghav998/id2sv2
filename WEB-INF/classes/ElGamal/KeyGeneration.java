package ElGamal;

import java.math.*;
import java.util.*;
import java.security.*;
import java.io.*;



public class KeyGeneration
{
	public static void main(String arg[])
        {
			KeyGeneration a=new KeyGeneration();
        	System.out.println("Welcome to Key Generation");
        }
	//Prime key 
	public static String generate_Primekey()
        {
        	final String bint;
        	
		 	BigInteger p, b, c, secretKey;
	        Random sc = new SecureRandom();
	        
	        //
	        // Prime & generator key calculation
	        //
	        
	        p = BigInteger.probablePrime(64, sc);
	        b = new BigInteger("3");
	        
	        System.out.println("****************");
	        System.out.println("\n");
	        //System.out.println("sc = " + sc);
	        System.out.println("prime = " + p);
	        System.out.println("generator = " + b);
	        System.out.println("\n");
	        System.out.println("****************");
	        //
	        
	        bint=p.toString()+","+b.toString()+","+sc.toString();
	        
	        return bint;
    	}
    	
    //Public Key
    public static String generate_Publickey(String pp,String bb, String skey)
        {
        	        	
		 	BigInteger p, b, c, secretKey;
		 	
		 	p = new BigInteger(pp);
		 	b = new BigInteger(bb);
		 	secretKey = new BigInteger(skey);
	        
	        
	        //
	        // public key calculation
	        //
	        
	        	c = b.modPow(secretKey, p);
	        	System.out.println("****************");
		        System.out.println("\n");
		        System.out.println("Key Generation");
		        System.out.println("\n");
		        System.out.println("****************");
		        System.out.println("****************");
		        System.out.println("\n");
		        System.out.println("public key="+c);
		        System.out.println("\n");
		        System.out.println("****************");
	        //
	        
	        	        
	       		
	        
	        
	        return c.toString();
	        
    	}

  


}
