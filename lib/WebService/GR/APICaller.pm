use strict;
use warnings;
package WebService::GR::APICaller;

use Moo::Role;
use Carp;
use HTTP::Tiny;

has ua => (
    is      => 'ro',
    default => sub { HTTP::Tiny->new(agent => 'WebService::GR::APICaller');}
);

1;
