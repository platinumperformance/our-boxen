class projects::tutum-stacks {
  # include icu4c
  # include phantomjs

  boxen::project { 'tutum-stacks':
    source        => 'platinumperformance/tutum-stacks'
  }
}
