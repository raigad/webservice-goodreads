package WebService::Goodreads::Role::Book;
use Moose::Role;
use Modern::Perl;
use namespace::autoclean;
use URI::Encode qw(uri_encode uri_decode);
use Carp;
use Data::Dumper;
use Text::Capitalize;
has review_count_uri =>(
    is  => 'ro',
    isa => 'Str',
    default => 'book/review_counts'
); 
has title_uri =>(
    is  => 'ro',
    isa => 'Str',
    default => 'book/title'
); 
has book_review_uri =>(
    is  => 'ro',
    isa => 'Str',
    default => 'book/show'
); 
sub get_book_review_counts{
    my ($self,$rh_args) = @_;
    croak "isbns are required" unless($rh_args->{'isbns'});
    return  $self->ua->get(uri_encode($self->base_url.$self->review_count_uri.'.'.$self->format.'?isbns='.$rh_args->{'isbns'}.'&key='.$self->key));
}

sub get_book_by_title{
    my ($self,$rh_args) = @_;
    croak "either author or title is required" unless($rh_args->{'title'} || $rh_args->{author});
    return  $self->ua->get(uri_encode($self->base_url.$self->title_uri.'.'.$self->format.'?author='.capitalize_title($rh_args->{'author'} || '').'&title='.($rh_args->{title} || '').'&key='.$self->key));
}
sub get_book_review_by_id{
    my ($self,$rh_args) = @_;
    croak "book_id is required" unless($rh_args->{'book_id'});
    return  $self->ua->get(uri_encode($self->base_url.$self->book_review_uri.'/'.$rh_args->{book_id}.'?format='.$self->format.'&key='.$self->key));
    }
1;
