class projects::anidex {
  boxen::project { 'anidex':
    nginx         => true,
    ruby          => '2.3.0',
    source        => 'platinumperformance/anidex',
    server_name   => 'anidex.dev'
  }
}
