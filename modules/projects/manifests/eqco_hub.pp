class projects::eqco_hub {
  # include icu4c
  # include phantomjs

  boxen::project { 'eqco_hub':
    elasticsearch => true,
    postgresql    => true,
    nginx         => true,
    redis         => true,
    ruby          => '2.2.3',
    source        => 'platinumperformance/eqco_hub'
  }
}
