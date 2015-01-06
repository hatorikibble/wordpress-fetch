use 5.006;
use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME               => 'Wordpress::Fetch',
    AUTHOR             => q{Peter Mayr <at.peter.mayr@gmail.com>},
    VERSION_FROM       => 'lib/Wordpress/Fetch.pm',
    ABSTRACT_FROM      => 'lib/Wordpress/Fetch.pm',
    LICENSE            => 'Artistic_2_0',
    EXE_FILES          => ['bin/wordpress_fetch.pl'],
    PL_FILES           => {},
    MIN_PERL_VERSION   => 5.006,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Config::Any::JSON' => '0',
        'MooseX::App'       => '1.22',
        'HTML::Restrict'    => '2.1.9',
        'Test::More'        => 0,
        'Try::Tiny'         => '0.18',
        'WordPress::XMLRPC' => '1.23',
    },
    PREREQ_PM => {

        #'ABC'              => 1.6,
        #'Foo::Bar::Module' => 5.0401,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES    => 'Wordpress-Fetch-*' },
);
