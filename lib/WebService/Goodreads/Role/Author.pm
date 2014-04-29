package WebService::Goodreads::Role::Author;
use Moose::Role;
use Modern::Perl;
use namespace::autoclean;
use URI::Encode qw(uri_encode);
use Carp;
use Data::Dumper;
has author_uri =>(
    is  =>  'ro',
    isa =>  'Str',
    default => 'author/show'
);
sub get_author_by_id{
    my ($self,$rh_args) = @_;
    croak "author id is required" unless($rh_args->{id});
    return  $self->ua->get(uri_encode($self->base_url.$self->author_uri.'.'.$self->format.'?id='.$rh_args->{'id'}.'&key='.$self->key));
}

1;
