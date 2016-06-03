class projects::surveys {
  # include icu4c
  # include phantomjs

  boxen::project { 'surveys':
    nginx         => true,
    ruby          => '2.2.4',
    source        => 'platinumperformance/surveys',
    server_name   => 'surveys.dev'
  }
}
