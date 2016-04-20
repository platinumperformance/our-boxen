class projects::innovations {
  # include icu4c
  # include phantomjs

  boxen::project { 'innovations':
    postgresql    => true,
    memcached     => true,
    nginx         => true,
    redis         => true,
    ruby          => '2.2.4',
    source        => 'platinumperformance/innovations',
    server_name   => 'innovations.dev'
  }
}
