class projects::platinum_hub {
  boxen::project { 'platinum_hub':
    nginx         => true,
    ruby          => '2.3.0',
    source        => 'platinumperformance/platinum_hub',
    server_name   => 'platinum-hub.dev'
  }
}
