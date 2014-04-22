package WebService::Goodreads;
use Moose;
with 'WebService::Role::APICaller','WebService::Role::Books';

has 'key' => (
    is  => 'ro',
    isa => 'Str'
);
has 'format' => (
    is  => 'rw',
    isa => 'Str',
    default => 'json'
);
has 'base_url' => (
    is      => 'ro',
    isa     => 'Str',
    default => 'https://www.goodreads.com/'
);

1;
