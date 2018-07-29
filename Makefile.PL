use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME          => 'Mail::Signature',
    AUTHOR        => q{Martin H. Sluka <fany@cpan.org>},
    VERSION_FROM  => 'lib/Mail/Signature.pm',
    ABSTRACT_FROM => 'lib/Mail/Signature.pm',
    EXE_FILES     => [
        qw{
          bin/append-signature
          bin/dump_mail_struct
          bin/ezmlm-append-trailer
          bin/ignore_errors
          }
    ],
    LICENSE            => 'artistic_2',
    PL_FILES           => {},
    MIN_PERL_VERSION   => '5.014',
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => '0',
    },
    BUILD_REQUIRES => {
        'Test::More' => '0',
    },
    PREREQ_PM => {
        'HTML::Entities' => 0,
        'HTML::Parser'   => 0,
        'MIME::Parser'   => 0,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES    => 'Mail-Signature-*' },
);
