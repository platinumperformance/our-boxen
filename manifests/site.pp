require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $boxen_user,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::homebrewdir}/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::boxen_user}"
  ]
}

File {
  group => 'staff',
  owner => $boxen_user
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => File["${boxen::config::bindir}/boxen-git-credential"],
  config   => {
    'credential.helper' => "${boxen::config::bindir}/boxen-git-credential"
  }
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # core modules, needed for most things
  include dnsmasq
  include git
  include hub
  include nginx

  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  # node versions
  nodejs::version { '0.12': }
  nodejs::version { '4.0.0': }
  nodejs::version { '4.4.3': }

  class { 'nodejs::global':
    version => '4.4.3'
  }
  # npm_module { 'cordova for all nodes':
  #   module       => 'cordova',
  #   version      => '~> 5.4.1',
  #   node_version => '*',
  # }
  # npm_module { 'ionic for all nodes':
  #   module       => 'ionic',
  #   version      => '~> 1.7.11',
  #   node_version => '*',
  # }
  # npm_module { 'ios-sim for all nodes':
  #   module       => 'ios-sim',
  #   version      => '~> 5.0.4',
  #   node_version => '*',
  # }
  # npm_module { 'ios-deploy for all nodes':
  #   module       => 'ios-deploy',
  #   version      => '~> 1.8.3',
  #   node_version => '*',
  # }


  # default ruby versions
  ruby::version { '2.2.3': }
  ruby::version { '2.2.4': }

  class { 'ruby::global':
    version => '2.2.4'
  }

  # common, useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar'
    ]:
  }

  file { "${boxen::config::srcdir}/our-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }

  include ohmyzsh
  include iterm2::stable
  include redis
  include elasticsearch
  include postgresql
  include memcached
  # include mongodb
}
