#!/usr/bin/env perl

use lib "../lib";
use Wordpress::Fetch;

Wordpress::Fetch->new_with_options->run;
