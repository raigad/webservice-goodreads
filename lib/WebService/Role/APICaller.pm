use strict;
use warnings;
package WebService::Role::APICaller;
use Moose::Role;
use Carp;
use HTTP::Tiny;
has ua => (
    is      => 'ro',
    default => sub { HTTP::Tiny->new(agent => 'WebService::GR::APICaller');}
);

1;
