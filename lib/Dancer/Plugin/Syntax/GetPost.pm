use 5.008001;
use strict;
use warnings;

package Dancer::Plugin::Syntax::GetPost;
# ABSTRACT: Syntactic sugar for GET+POST handlers
# VERSION

use Dancer::Plugin;
use Dancer ':syntax';

register get_post => sub {
  my ( $self, @args ) = plugin_args(@_);
  any [qw/get post/] => @args;
};

register_plugin for_versions => [ 1, 2 ];

1;

=for Pod::Coverage method_names_here

=head1 SYNOPSIS

  use Dancer::Plugin::Syntax::GetPost;

  get_post '/myform' => sub { ... };

=head1 DESCRIPTION

This module provides very simple syntactic sugar to define a handler for GET and
POST requests.  Instead of writing this:

  any [qw/get post/] => '/form' => sub { ... };

You can write just this:

  get_post '/form' => sub { ... };

=head1 SEE ALSO

=for :list
* L<Dancer>

=cut

# vim: ts=2 sts=2 sw=2 et:
