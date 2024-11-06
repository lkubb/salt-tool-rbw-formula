# vim: ft=yaml
---
tool_global:
  users:
    user:
      completions: .completions
      configsync: true
      persistenv: .bash_profile
      rchook: .bashrc
      xdg: true
      rbw:
        config:
          base_url: https://api.bitwarden.com/
          email: elliotalderson@protonmail.ch
          identity_url: null
          lock_timeout: 3600
          pinentry: pinentry
tool_rbw:
  lookup:
    master: template-master
    # Just for testing purposes
    winner: lookup
    added_in_lookup: lookup_value

    pkg:
      name: rbw
      install_mode: cargo
    paths:
      confdir: '.config/rbw'
      conffile: 'config.json'
      xdg_dirname: 'rbw'
      xdg_conffile: 'config.json'
    rootgroup: root

  tofs:
    # The files_switch key serves as a selector for alternative
    # directories under the formula files directory. See TOFS pattern
    # doc for more info.
    # Note: Any value not evaluated by `config.get` will be used literally.
    # This can be used to set custom paths, as many levels deep as required.
    files_switch:
      - any/path/can/be/used/here
      - id
      - roles
      - osfinger
      - os
      - os_family
    # All aspects of path/file resolution are customisable using the options below.
    # This is unnecessary in most cases; there are sensible defaults.
    # path_prefix: template_alt
    # dirs:
    #   files: files_alt
    #   default: default_alt
    # The entries under `source_files` are prepended to the default source files
    # given for the state
    # source_files:
    #   tool-rbw-config-file-file-managed:
    #     - 'example_alt.tmpl'
    #     - 'example_alt.tmpl.jinja'

    # For testing purposes
    source_files:
      rbw config file is managed for user 'user':
        - 'config.json'
        - 'config.json.jinja'

  # Just for testing purposes
  winner: pillar
  added_in_pillar: pillar_value
