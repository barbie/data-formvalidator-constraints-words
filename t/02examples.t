#!/usr/bin/perl -w
use strict;

use Test::More tests => 40;
use Data::FormValidator::Constraints::Words;

# list items:
# 0 - valid_realname
# 1 - match_realname
# 2 - valid_basicwords
# 3 - match_basicwords
# 4 - valid_simplewords
# 5 - match_simplewords
# 6 - valid_printsafe
# 7 - match_printsafe
# 8 - valid_paragraph
# 9 - match_paragraph

my %examples = (
    ''              => [ 0, '', '', undef, '', undef, 0, undef, '', undef ],
    'hello'         => [ 1, 'hello', 1, 'hello', 1, 'hello', 1, 'hello', 1, 'hello' ],
    'Pr;n+.5afe'    => [ 0, 'Prn.5afe', '', undef, 1, 'Pr;n+.5afe', 1, 'Pr;n+.5afe', 1, 'Pr;n+.5afe' ],
    '$@pare'        => [ 0, '@pare', '', undef, '', undef, 1, '$@pare', 1, '$@pare' ],
);

for my $ex (keys %examples) {
    is(valid_realname(undef,$ex),     $examples{$ex}->[0],"'$ex' validates as expected for realname");
    is(match_realname(undef,$ex),     $examples{$ex}->[1],"'$ex' matches as expected for realname");
    is(valid_basicwords(undef,$ex),   $examples{$ex}->[2],"'$ex' validates as expected for basicwords");
    is(match_basicwords(undef,$ex),   $examples{$ex}->[3],"'$ex' matches as expected for basicwords");
    is(valid_simplewords(undef,$ex),  $examples{$ex}->[4],"'$ex' validates as expected for simplewords");
    is(match_simplewords(undef,$ex),  $examples{$ex}->[5],"'$ex' matches as expected for simplewords");
    is(valid_printsafe(undef,$ex),    $examples{$ex}->[6],"'$ex' validates as expected for printsafe");
    is(match_printsafe(undef,$ex),    $examples{$ex}->[7],"'$ex' matches as expected for printsafe");
    is(valid_paragraph(undef,$ex),    $examples{$ex}->[8],"'$ex' validates as expected for paragraph");
    is(match_paragraph(undef,$ex),    $examples{$ex}->[9],"'$ex' matches as expected for paragraph");
}