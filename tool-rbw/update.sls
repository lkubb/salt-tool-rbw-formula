{%- from 'tool-rbw/map.jinja' import rbw %}

{%- if rbw.users | selectattr('rbw.config', 'defined') %}
include:
  - .configsync
{%- endif %}

rbw is updated to latest version:
{%- if grains['kernel'] == 'Darwin' %}
  pkg.installed: # assumes homebrew as package manager. homebrew always installs the latest version, mac_brew_pkg does not support upgrading a single package
{%- else %}
  pkg.latest:
{%- endif %}
    - name: rbw
