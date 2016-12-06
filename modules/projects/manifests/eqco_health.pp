class projects::eqco_health {
  boxen::project { 'eqco_health':
    nginx         => true,
    ruby          => '2.3.3',
    source        => 'platinumperformance/eqco_health',
    server_name   => 'eqco-health.dev'
  }
}
