# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_config_clean = tplroot ~ '.config.clean' %}
{%- from tplroot ~ "/map.jinja" import mapdata as rbw with context %}

include:
  - {{ sls_config_clean }}

{%- for user in rbw.users %}

rbw is removed for user '{{ user.name }}':
  cargo.absent:
    - name: {{ rbw.lookup.pkg.name }}
    - version: {{ rbw.get('version') or 'latest' }}
    {#- do not specify alternative return value to be able to unset default version #}
    - user: {{ user.name }}
    - require:
      - sls: {{ sls_config_clean }}
{%- endfor %}
