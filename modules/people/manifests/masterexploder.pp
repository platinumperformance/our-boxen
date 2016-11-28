class people::masterexploder {
  # include projects::all

  # include sublime_text

  package { 'elixir':
    ensure => present
  }

  package { 'go':
    ensure => present
  }

  $env = {
    directories => {
      home     => '/Users/ian',
      dotfiles => '/Users/ian/dotfiles'
    },
    dotfiles => [
      'zshrc'
      # 'gemrc' MANAGED BY BOXENS
    ]
  }

  repository { 'dotfiles':
    source => 'masterexploder/dotfiles',
    path   => "${env['directories']['dotfiles']}"
  }

  -> people::masterexploder::dotfile::link { $env['dotfiles']:
    source_dir => "${env['directories']['dotfiles']}",
    dest_dir   => $env['directories']['home'],
  }


  define dotfile::link($source_dir, $dest_dir) {
    file { "${dest_dir}/.${name}":
      ensure => symlink,
      target => "${source_dir}/${name}",
    }
  }

  boxen::osx_defaults { 'Disable reopen windows when logging back in':
    key    => 'TALLogoutSavesState',
    domain => 'com.apple.loginwindow',
    value  => 'false',
  }
  boxen::osx_defaults { 'Secure Empty Trash':
    key    => 'EmptyTrashSecurely',
    domain => 'com.apple.finder',
    value  => 'true',
  }
  boxen::osx_defaults { 'Always use current directory in default search':
    key    => 'FXDefaultSearchScope',
    domain => 'com.apple.finder',
    value  => 'SCcf',
  }
  boxen::osx_defaults { 'Do not create .DS_Store':
    key    => 'DSDontWriteNetworkStores',
    domain => 'com.apple.dashboard',
    value  => 'true',
  }
  boxen::osx_defaults { "Disable 'natural scrolling'":
    key    => 'com.apple.swipescrolldirection',
    domain => 'GlobalPreferences',
    value  => 'flase',
  }
  boxen::osx_defaults { 'fucking sane key repeat':
    key    => 'KeyRepeat',
    domain => 'NSGlobalDomain',
    value  => '0',
  }
  boxen::osx_defaults { 'Expand save panel by default':
      key    => 'NSNavPanelExpandedStateForSaveMode',
      domain => 'NSGlobalDomain',
      value  => 'true',
  }
  boxen::osx_defaults { 'Expand print panel by default':
      key    => 'PMPrintingExpandedStateForPrint',
      domain => 'NSGlobalDomain',
      value  => 'true',
  }
}
