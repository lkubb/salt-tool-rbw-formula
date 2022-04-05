# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_config_clean = tplroot ~ '.config.clean' %}
{%- from tplroot ~ "/map.jinja" import mapdata as rbw with context %}

include:
  - {{ sls_config_clean }}

rbw is removed:
  pkg.removed:
    - name: {{ rbw.lookup.pkg.name }}
    - require:
      - sls: {{ sls_config_clean }}
