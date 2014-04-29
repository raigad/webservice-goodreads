package WebService::Goodreads;
use Moose;
with 'WebService::Goodreads::Role::APICaller','WebService::Goodreads::Role::Book',
        'WebService::Goodreads::Role::Author';

has 'key' => (
    is  => 'ro',
    isa => 'Str',
    default => 'developer_key'
);
has 'format' => (
    is  => 'rw',
    isa => 'Str',
    default => 'xml'
);
has 'base_url' => (
    is      => 'ro',
    isa     => 'Str',
    default => 'https://www.goodreads.com/'
);
1;
