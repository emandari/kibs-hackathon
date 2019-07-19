#!/usr/bin/perl

chomp ( $palindrome = 'ACCTAGGT' );

@palindrome = split( //, $palindrome );

@backwards = reverse( @palindrome );

$sizeOfPalindrome = @palindrome;

for( $i = 0; $i < $sizeOfPalindrome; $i++ ){
	if( @palindrome[$i] ne @backwards[$i] ){
		$pali = "";
		last;
	}
	else{
		$pali = "true";
	}
		
} 

if( $pali ){
	print "\n\"$palindrome\" is a palindrome\n";
}

else{
	print "\n\"$palindrome\" is NOT a palindrome\n";
}

