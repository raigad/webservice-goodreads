package WebService::Goodreads::Role::APICaller;
use Moose::Role;
use Modern::Perl;
use namespace::autoclean;
use Carp;
use HTTP::Tiny;
has ua => (
    is      => 'ro',
    default => sub { HTTP::Tiny->new(agent => 'WebService::GR::APICaller');}
);

1;
