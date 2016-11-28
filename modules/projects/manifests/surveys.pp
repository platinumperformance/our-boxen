class projects::surveys {
  boxen::project { 'surveys':
    nginx         => true,
    ruby          => '2.3.0',
    source        => 'platinumperformance/surveys',
    server_name   => 'surveys.dev'
  }
}
