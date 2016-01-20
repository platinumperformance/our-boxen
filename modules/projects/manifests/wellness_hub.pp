class projects::wellness_hub {
  # include icu4c
  # include phantomjs

  boxen::project { 'wellness_hub':
    elasticsearch => true,
    postgresql    => true,
    memcached     => true,
    nginx         => true,
    redis         => true,
    ruby          => '2.2.4',
    source        => 'platinumperformance/wellness_hub',
    server_name   => 'wellness-hub.dev'
  }
}
