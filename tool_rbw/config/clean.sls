# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as rbw with context %}


{%- for user in rbw.users | selectattr('rbw.config', 'defined') | selectattr('rbw.config') %}

rbw config file is cleaned for user '{{ user.name }}':
  file.absent:
    - name: {{ user['_rbw'].conffile }}

rbw config dir is absent for user '{{ user.name }}':
  file.absent:
    - name: {{ user['_rbw'].confdir }}
{%- endfor %}
