package WebService::Goodreads::Role::Book;
use Moose::Role;

has review_count_uri =>(
    is  => 'ro',
    isa => 'Str',
    default => '/book/reviw_counts'
); 
sub get_book_review_counts{
    my ($self,$rh_args) = @_;
    my $res = $self->ua->get($self->base_url.$self->review_count_uri.$self->format); 
}

1;
