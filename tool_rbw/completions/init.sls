# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_package_install = tplroot ~ '.package.install' %}
{%- from tplroot ~ "/map.jinja" import mapdata as rbw with context %}

include:
  - {{ sls_package_install }}


{#- @TODO! https://github.com/sharkdp/bat/issues/2057
{%- for user in rbw.users | selectattr('completions', 'defined') | selectattr('completions') %}

Completions directory for rbw is available for user '{{ user.name }}':
  file.directory:
    - name: {{ user.home | path_join(user.completions) }}
    - user: {{ user.name }}
    - group: {{ user.group }}
    - mode: '0700'
    - makedirs: true

rbw shell completions are available for user '{{ user.name }}':
  cmd.run:
    - name: rbw --completions {{ user.shell }} > {{ user.home | path_join(user.completions, '_rbw') }}
    - creates: {{ user.home | path_join(user.completions, '_rbw') }}
    - onchanges:
      - rbw is installed
    - runas: {{ user.name }}
    - require:
      - rbw is installed
      - Completions directory for rbw is available for user '{{ user.name }}'
{%- endfor %}
#}
