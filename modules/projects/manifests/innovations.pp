class projects::innovations {
  boxen::project { 'innovations':
    nginx         => true,
    ruby          => '2.3.0',
    source        => 'platinumperformance/innovations',
    server_name   => 'innovations.dev'
  }
}
