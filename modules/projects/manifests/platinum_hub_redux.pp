class projects::platinum_hub_redux {
  boxen::project { 'platinum_hub':
    nginx         => true,
    ruby          => '2.3.4',
    source        => 'platinumperformance/platinum_hub_redux',
    server_name   => 'platinum-hub.localhost'
  }
}
