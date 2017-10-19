use strict;
use warnings;

use Alien::Base::ModuleBuild;

my $builder = Alien::Base::ModuleBuild->new(
  module_name   => 'Alien::Hush',
  dist_abstract => 'Easy installation of the Hush cryptocoin full node daemon',
  license       => 'perl',
  configure_requires => {
    'Alien::Base::ModuleBuild' => 0,
    'Module::Build'            => '0.38',
  },
  requires => {
    'perl'        => '5.8.1',
    'parent'      => 0,
    'Alien::Base' => 0,
  },
  dist_author => 'Duke Leto <duke@leto.net>',
  alien_name => 'hush',
  alien_repository => [
    {
      protocol => 'http',
      #protocol => 'https',
      host     => 'leto.net',
      location => '/tmp/hush.html',
      pattern  => qr/hush-1.0.12.tar.gz/,
    },
  ],
  alien_build_commands => [
    './zcutil/build.sh',
  ],

  meta_merge => {
    resources => {
      repository => 'https://github.com/leto/Alien-Hush',
      bugtracker => 'https://github.com/leto/Alien-Hush/issues',
    },
  },
);
$builder->create_build_script;

