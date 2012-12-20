use strict;
use warnings;
use Test::More 0.96 import => ['!pass'];

use Dancer;
use Dancer::Test;
use Dancer::Plugin::Syntax::GetPost;

get_post '/form' => sub { return "method = " . request->method };

route_exists [ GET => '/form' ];
route_exists [ POST => '/form' ];
route_doesnt_exist [ PUT => '/form' ];
response_content_like [ GET => '/form' ], qr/method = GET/;
response_content_like [ POST => '/form' ], qr/method = POST/;

done_testing;
# COPYRIGHT
