# vim: ft=sls

{#-
    Manages the rbw package configuration by

    * recursively syncing from a dotfiles repo
    * managing/serializing the config file afterwards

    Has a dependency on `tool_rbw.package`_.
#}

include:
  - .sync
  - .file
