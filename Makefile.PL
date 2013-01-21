
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "efficiently retrieve and search trees with DBIx::Class",
  "AUTHOR" => "Arthur Axel \"fREW\" Schmidt <frioux+cpan\@gmail.com>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "DBIx-Class-MaterializedPath",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "DBIx::Class::MaterializedPath",
  "PREREQ_PM" => {
    "Class::C3::Componentised" => "1.001000",
    "DBIx::Class" => "0.08196",
    "DBIx::Class::Helpers" => "2.007004",
    "SQL::Translator" => "0.11011",
    "Sub::Current" => "0.02",
    "Test::Deep" => "0.110",
    "Test::More" => "0.98"
  },
  "VERSION" => "0.002000",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



