class projects::eqco_hub {
  boxen::project { 'eqco_hub':
    nginx         => true,
    ruby          => '2.3.0',
    source        => 'platinumperformance/eqco_hub',
    server_name   => 'eqco-hub.dev'
  }
}
