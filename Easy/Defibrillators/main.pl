use strict;
use warnings;
#use diagnostics;
use 5.20.1;
use Math::Trig;

select(STDOUT); $| = 1; # DO NOT REMOVE

sub number {
    $_[0] =~ s/,/\./;
    return deg2rad($_[0]);
}

sub distance {
    my $lonA = shift;
    my $latA = shift;
    my $lonB = shift;
    my $latB = shift;
    my $x = ($lonB - $lonA) * cos(($latA + $latB) / 2);
    my $y = $latB - $latA;
    return sqrt($x*$x + $y*$y) * 6371;
}

chomp(my $lonA = <STDIN>);
chomp(my $latA = <STDIN>);
chomp(my $n = <STDIN>);
my @defibs = <STDIN>;
map {chomp} @defibs;

$lonA = number($lonA);
$latA = number($latA);

my $minDist = 0;
my $answer = "";
for my $line (@defibs) {
    my @tokens = split(/;/, $line);
    my $lonB = number($tokens[4]);
    my $latB = number($tokens[5]);
    my $dist = distance($lonA, $latA, $lonB, $latB);
    if (!$answer || $dist < $minDist) {
        $minDist = $dist;
        $answer = $tokens[1];
    }
}

print "$answer\n";

# To debug: print STDERR "Debug messages...\n";

# Cool solution by someone else
#
# use strict;
# use warnings;
# #use diagnostics;
# use 5.20.1;
#
# select(STDOUT); $| = 1; # DO NOT REMOVE
#
#
# chomp(my $lon = <STDIN>);
# chomp(my $lat = <STDIN>);
# chomp(my $n = <STDIN>);
#
# $lon =~ s/\,/\./;
# $lat =~ s/\,/\./;
#
# my $closest_dist = undef;
# my $closest_name = "";
# for my $i (0..$n-1) {
#     chomp(my $defib = <STDIN>);
#
#     my ($num, $name, $addr, $phone, $d_lon, $d_lat) = split /;/, $defib;
#
#     $d_lon =~ s/\,/\./;
#     $d_lat =~ s/\,/\./;
#
#     my $x = (0.0 + $d_lon - $lon) * cos(0.5 * (0.0 + $d_lon + $lon));
#     my $y = (0.0 + $d_lat - $lat);
#     my $d = sqrt($x**2 + $y**2) * 6371.0;
#
#     if (!defined($closest_dist) or $d < $closest_dist)
#     {
#         $closest_dist = $d;
#         $closest_name = $name;
#     }
# }
#
# print "$closest_name\n";
