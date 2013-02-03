use ExtUtils::MakeMaker;
WriteMakefile(
    'NAME'			=> 'Data::FormValidator::Constraints::Words',
    'VERSION_FROM'	=> 'lib/Data/FormValidator/Constraints/Words.pm',
    'PREREQ_PM'		=> {
		Test::More	=> 0.70,	# for testing
	},
	NO_META			=> 1,

    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (ABSTRACT	=> 'A contraints module of word patterns for Data::FormValidator',
       AUTHOR	=> 'Barbie <barbie@cpan.org>') : ()),
);
