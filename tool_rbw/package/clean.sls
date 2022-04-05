# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as rbw with context %}
{%- set sls_method_install = tplroot ~ '.package.' ~ rbw.lookup.pkg.install_mode %}

include:
  - {{ sls_method_install }}
