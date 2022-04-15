# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as rbw with context %}


{%- for user in rbw.users | selectattr('completions', 'defined') | selectattr('completions') %}

rbw shell completions are unavailable for user '{{ user.name }}':
  file.absent:
    - name: {{ user.home | path_join(user.completions, '_rbw') }}
{%- endfor %}
