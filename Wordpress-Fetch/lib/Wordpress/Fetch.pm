package Wordpress::Fetch;

use strict;
use warnings;

=head1 NAME

Wordpress::Fetch - The great new Wordpress::FetchPosts!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

use MooseX::App::Simple qw (Config);
use Try::Tiny;
use WordPress::XMLRPC;

option 'textonly' => (
    is            => 'rw',
    isa           => 'Bool',
    default       => 0,
    documentation => q[strip HTML tags and Wordpress codes, default is false],
);

option 'blog_url' => (
    is            => 'rw',
    isa           => 'Str',
    required      => 1,
    documentation => q[blog url, e.g. 'http://xyz.wordpress.com'],
);

option 'username' => (
    is            => 'rw',
    isa           => 'Str',
    required      => 1,
    documentation => q[Wordpress username],
);

option 'password' => (
    is            => 'rw',
    isa           => 'Str',
    required      => 1,
    documentation => q[Wordpress password],
);

option 'max_posts' => (
    is      => 'rw',
    isa     => 'Int',
    default => 250,
    documentation =>
q[number of posts the script should fetch ideally bigger than your post count, to fetch all your posts in one go],
);

sub run {
    my ($self) = @_;
    my $options = undef;

    $self->{Wordpress} = WordPress::XMLRPC->new(
        {
            username => $self->{username},
            password => $self->{password},
            proxy    => $self->{blog_url} . '/xmlrpc.php',
        }
    );

    try { $options = $self->{Wordpress}->getOptions('blog_title'); }
    catch {
        printf( "Problem connecting with '%s' at '%s': %s!",
            $self->{username}, $self->{blog_url}, $_ );
        return;
    };

    unless ( defined( $options->{blog_title} ) ) {
        die
"Got no valid blog title back, maybe your supplied password is wrong?";
    }

    printf( "Connected successfully to Blog '%s'!\n",
        $options->{blog_title}->{value} );
    my $p_ref = $self->{Wordpress}->getRecentPosts( $self->max_posts );
    printf( "Asked for %s posts, got %s...\n",
        $self->max_posts, scalar( @{$p_ref} ) );

    foreach my $post ( @{$p_ref} ) {
        print $post->{title} . "\n";
    }

}

=head1 AUTHOR

Peter Mayr, C<< <at.peter.mayr at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-wordpress-fetchposts at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Wordpress-FetchPosts>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Wordpress::FetchPosts


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Wordpress-FetchPosts>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Wordpress-FetchPosts>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Wordpress-FetchPosts>

=item * Search CPAN

L<http://search.cpan.org/dist/Wordpress-FetchPosts/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2014 Peter Mayr.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1;    # End of Wordpress::FetchPosts
