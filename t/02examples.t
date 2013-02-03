#!/usr/bin/perl -w
use strict;

use Test::More tests => 50;
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

my @examples = (
    [ undef,        0, undef,      '', undef,   '', undef,        undef, undef,        '', undef        ],
    [ '',           0, '',         '', undef,   '', undef,        0,     undef,        '', undef        ],
    [ 'hello',      1, 'hello',    1,  'hello', 1,  'hello',      1,     'hello',      1,  'hello'      ],
    [ 'Pr;n+.5afe', 0, 'Prn.5afe', '', undef,   1,  'Pr;n+.5afe', 1,     'Pr;n+.5afe', 1,  'Pr;n+.5afe' ],
    [ '$@pare',     0, 'pare',     '', undef,   '', undef,        1,     '$@pare',     1,  '$@pare'     ],
);

for my $ex (@examples) {
    is(valid_realname(   undef,$ex->[0]), $ex->[1],  "'$ex' validates as expected for realname"     );
    is(match_realname(   undef,$ex->[0]), $ex->[2],  "'$ex' matches as expected for realname"       );
    is(valid_basicwords( undef,$ex->[0]), $ex->[3],  "'$ex' validates as expected for basicwords"   );
    is(match_basicwords( undef,$ex->[0]), $ex->[4],  "'$ex' matches as expected for basicwords"     );
    is(valid_simplewords(undef,$ex->[0]), $ex->[5],  "'$ex' validates as expected for simplewords"  );
    is(match_simplewords(undef,$ex->[0]), $ex->[6],  "'$ex' matches as expected for simplewords"    );
    is(valid_printsafe(  undef,$ex->[0]), $ex->[7],  "'$ex' validates as expected for printsafe"    );
    is(match_printsafe(  undef,$ex->[0]), $ex->[8],  "'$ex' matches as expected for printsafe"      );
    is(valid_paragraph(  undef,$ex->[0]), $ex->[9],  "'$ex' validates as expected for paragraph"    );
    is(match_paragraph(  undef,$ex->[0]), $ex->[10], "'$ex' matches as expected for paragraph"      );
}
