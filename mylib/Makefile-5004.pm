#!/usr/bin/perl
# $Id$

use ExtUtils::MakeMaker;

# Add a new target.

sub MY::test {
  package MY;
  "\ntest ::\n\t\$(FULLPERL) ./lib/deptest.perl\n" . shift->SUPER::test(@_);
}

# See lib/ExtUtils/MakeMaker.pm for details of how to influence the
# contents of the Makefile that is written.

WriteMakefile
  ( NAME           => 'POE',

    ( ($^O eq 'MacOS')
      ? ()
      : ( AUTHOR   => 'Rocco Caputo <rcaputo@cpan.org>',
          ABSTRACT => 'A networking/multitasking framework for Perl.',
        )
    ),

    VERSION_FROM   => 'POE.pm',
    dist           => { 'COMPRESS' => 'gzip -9f',
                        'SUFFIX'   => 'gz',
                      },
    PREREQ_PM      => { Carp               => 0,
                        Exporter           => 0,
                        IO                 => 0,
                        POSIX              => 0,
                        Socket             => 0,
                        Filter::Util::Call => 1.04,
                      },

    # Remove 'lib', which should have been named 'privlib'.  The 'lib'
    # directory in this distribution is for private stuff needed to
    # build and test POE.  Those things should not be installed!  At
    # some point SourceForge will open up shell access to my CVS tree
    # there, and I will be able to rename the directories within the
    # repository without losing revision histories.  When that
    # happens, I'll rename the 'lib' driectory to 'privlib'.

    PMLIBDIRS      => [ 'POE' ],
  );

1;