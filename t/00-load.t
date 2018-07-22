#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Mail::Signature' ) || print "Bail out!\n";
}

diag( "Testing Mail::Signature $Mail::Signature::VERSION, Perl $], $^X" );
