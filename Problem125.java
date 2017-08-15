package com.cjbednarzyk;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class Problem125 {

	public static void main(String[] args) {
		BigInteger maxSquareNbr = new BigInteger("100000000");
		BigInteger palindromicSquareTotal = BigInteger.ZERO;
		StringBuffer palindromeTester = new StringBuffer();
		List<String> palindromeList = new ArrayList<String>();
		for(BigInteger baseSquareNbr = BigInteger.ONE;baseSquareNbr.compareTo(sqrt(maxSquareNbr)) <= 0;baseSquareNbr = baseSquareNbr.add(BigInteger.ONE)) {
			BigInteger currSquareNbr = baseSquareNbr;
			BigInteger currTotalOfSquaresBase = baseSquareNbr.multiply(baseSquareNbr);
			BigInteger currTotalOfSquares = currTotalOfSquaresBase;
			while(currTotalOfSquares.compareTo(maxSquareNbr) < 0) {
				palindromeTester.setLength(0);
				palindromeTester.append(currTotalOfSquares);
				if(!palindromeList.contains(String.valueOf(currTotalOfSquares)) && palindromeTester.reverse().toString().equals(String.valueOf(currTotalOfSquares))) {
					if(currTotalOfSquares != currTotalOfSquaresBase) {
						palindromeList.add(String.valueOf(currTotalOfSquares));
						palindromicSquareTotal = palindromicSquareTotal.add(currTotalOfSquares);
						System.out.println(currTotalOfSquares + " - " + palindromeTester.reverse().toString() + " - " + palindromicSquareTotal);
					}
				}
				currSquareNbr = currSquareNbr.add(BigInteger.ONE);
				currTotalOfSquares=currTotalOfSquares.add(currSquareNbr.multiply(currSquareNbr));
			}
		}
		Collections.sort(palindromeList, new Comparator<String>() {
		    public int compare(String o1, String o2) {
		        return extractInt(o1).subtract(extractInt(o2)).compareTo(BigInteger.ZERO);
		    }
		    
		    BigInteger extractInt(String s) {
		        String num = s.replaceAll("\\D", "");
		        // return 0 if no digits found
		        return num.isEmpty() ? BigInteger.ZERO : new BigInteger(num);
		    }
		});
		System.out.println("The total is " + palindromicSquareTotal);
		System.out.println(palindromeList);
	}

	public static BigInteger sqrt(BigInteger x) {
	    BigInteger div = BigInteger.ZERO.setBit(x.bitLength()/2);
	    BigInteger div2 = div;
	    // Loop until we hit the same value twice in a row, or wind
	    // up alternating.
	    for(;;) {
	        BigInteger y = div.add(x.divide(div)).shiftRight(1);
	        if (y.equals(div) || y.equals(div2))
	            return y;
	        div2 = div;
	        div = y;
	    }
	}
	
}
