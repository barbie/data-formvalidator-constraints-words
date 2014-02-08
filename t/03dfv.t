#!/usr/bin/perl -w
use strict;

use Test::More;

eval "use Data::FormValidator";
if($@) {
    plan skip_all => "Data::FormValidator required for testing intergration with DFV";
} else {
    plan tests => 21;
}

use Data::FormValidator::Constraints::Words;

my %rules = (
		validator_packages => [qw(  Data::FormValidator::Constraints::Words )],
		msgs => {prefix=> 'err_'},		# set a custom error prefix
		missing_optional_valid => 1,
		constraint_methods => {
			realname    => realname(),
			basicwords  => basicwords(),
			simplewords => simplewords(),
			printsafe   => printsafe(),
			paragraph   => paragraph(),
			username    => username(),
			password    => password()
		},
		constraints => {
			realname    => { constraint_method => realname      },
			basicwords  => { constraint_method => basicwords    },
			simplewords => { constraint_method => simplewords   },
			printsafe   => { constraint_method => printsafe     },
			paragraph   => { constraint_method => paragraph     },
			username    => { constraint_method => username      },
			password    => { constraint_method => password      }
		},
        optional => [qw(realname simplewords basicwords printsafe paragraph username password)]
	);


my %examples = (
	realname    => [{value => 'safe', result => 'safe'},{value => 'Pr;n+.5afe', result => undef},       {value => 'Pr1nt 5afe', result => 'Pr1nt 5afe'}],
	basicwords  => [{value => 'safe', result => 'safe'},{value => 'Pr;n+.5afe', result => undef},       {value => 'Pr1nt 5afe', result => 'Pr1nt 5afe'}],
	simplewords => [{value => 'safe', result => 'safe'},{value => 'Pr;n+.5afe', result => 'Pr;n+.5afe'},{value => 'Pr1nt 5afe', result => 'Pr1nt 5afe'}],
	printsafe   => [{value => 'safe', result => 'safe'},{value => 'Pr;n+.5afe', result => 'Pr;n+.5afe'},{value => 'Pr1nt 5afe', result => 'Pr1nt 5afe'}],
	paragraph   => [{value => 'safe', result => 'safe'},{value => 'Pr;n+.5afe', result => 'Pr;n+.5afe'},{value => 'Pr1nt 5afe', result => 'Pr1nt 5afe'}],
	username    => [{value => 'safe', result => 'safe'},{value => 'Pr;n+.5afe', result => undef},       {value => 'Pr1nt 5afe', result => undef}],
	password    => [{value => 'safe', result => 'safe'},{value => 'Pr;n+.5afe', result => 'Pr;n+.5afe'},{value => 'Pr1nt 5afe', result => undef}],
);

for my $method (keys %examples) {
    for my $set (@{$examples{$method}}) {
        my $results = Data::FormValidator->check({ $method => $set->{value} }, \%rules);
        my $values = $results->valid;
        is($values->{$method}, $set->{result}, "'$method' value '$set->{value}' matches result");
    }
}
