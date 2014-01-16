#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Wordpress::Fetch' ) || print "Bail out!\n";
}

diag( "Testing Wordpress::Fetch $Wordpress::Fetch::VERSION, Perl $], $^X" );
