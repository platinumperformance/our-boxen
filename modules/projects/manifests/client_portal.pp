class projects::client_portal {
  boxen::project { 'client_portal':
    nginx         => true,
    ruby          => '2.3.3',
    source        => 'platinumperformance/client_portal',
    server_name   => 'client-portal.dev'
  }
}
