#!/usr/bin/perl 

use JSON;
use POSIX;

my $lat = 1.23;
my $lon = 4.56;

$json_text = `curl -s 'http://api.open-notify.org/iss-pass.json?lat=$lat&lon=$lon&n=1'`;

$data = decode_json($json_text);

$risetime = $data->{'response'}[0]->{'risetime'};
$duration = $data->{'response'}[0]->{'duration'};

$dt = strftime("%b %d %H:%M:%S", localtime($risetime));
print "🛰 \n";
print "---\n";
print "ISS overhead at $dt for ${duration} seconds\n";
