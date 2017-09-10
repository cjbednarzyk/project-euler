package com.cjbednarzyk;

import java.math.BigInteger;
import java.util.regex.Pattern;

public class Problem206 {

	public static void main(String[] args) {
		BigInteger minSquareNbr = new BigInteger("1020304050607080900");
		BigInteger maxSquareNbr = new BigInteger("1929394959697989990");
		BigInteger minNbrToSquare = bigIntSqRootFloor(minSquareNbr);
		BigInteger maxNbrToSquare = bigIntSqRootFloor(maxSquareNbr).add(BigInteger.ONE);
		BigInteger squaredNbr;
		System.out.println("Checking numbers " + minNbrToSquare + " to " + maxNbrToSquare + " for a pattern 1_2_3_4_5_6_7_8_9_0...");
		for(BigInteger nbrToSquare = minNbrToSquare;nbrToSquare.compareTo(maxNbrToSquare) <= 0; nbrToSquare = nbrToSquare.add(BigInteger.TEN)) {
			squaredNbr = nbrToSquare.pow(2);
			if(Pattern.matches("1.2.3.4.5.6.7.8.9.0", squaredNbr.toString())) {
				System.out.println(nbrToSquare + "^2 = " + squaredNbr);
			}
		}
	}
	
	public static BigInteger bigIntSqRootFloor(BigInteger x)
	        throws IllegalArgumentException {
	    if (x.compareTo(BigInteger.ZERO) < 0) {
	        throw new IllegalArgumentException("Negative argument.");
	    }
	    // square roots of 0 and 1 are trivial and
	    // y == 0 will cause a divide-by-zero exception
	    if (x .equals(BigInteger.ZERO) || x.equals(BigInteger.ONE)) {
	        return x;
	    } // end if
	    BigInteger two = BigInteger.valueOf(2L);
	    BigInteger y;
	    // starting with y = x / 2 avoids magnitude issues with x squared
	    for (y = x.divide(two);
	            y.compareTo(x.divide(y)) > 0;
	            y = ((x.divide(y)).add(y)).divide(two));
	    return y;
	}
	
}
