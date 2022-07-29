# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as rbw with context %}

rbw is installed:
  pkg.installed:
    - name: {{ rbw.lookup.pkg.name }}
    - version: {{ rbw.get('version') or 'latest' }}
    {#- do not specify alternative return value to be able to unset default version #}
