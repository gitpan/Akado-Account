use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Akado::Account',
    AUTHOR              => q{Ivan Bessarabov <ivan@bessarabov.ru>},
    VERSION_FROM        => 'lib/Akado/Account.pm',
    ABSTRACT_FROM       => 'lib/Akado/Account.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'LWP' => 0,
        'XML::Simple' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Akado-Account-*' },
);
