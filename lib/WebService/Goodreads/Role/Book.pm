package WebService::Goodreads::Role::Book;
use Moose::Role;
use Modern::Perl;
use namespace::autoclean;
use URI::Encode qw(uri_encode uri_decode);
use Carp;
use Data::Dumper;

has review_count_uri =>(
    is  => 'ro',
    isa => 'Str',
    default => 'book/review_counts'
); 
sub get_book_review_counts{
    my ($self,$rh_args) = @_;
    croak "isbns are required" unless($rh_args->{'isbns'});
    return  $self->ua->get(uri_encode($self->base_url.$self->review_count_uri.'.'.$self->format.'?isbns='.$rh_args->{'isbns'}.'&key='.$self->key));
}
1;
