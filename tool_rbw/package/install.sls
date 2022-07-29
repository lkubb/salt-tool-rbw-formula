# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as rbw with context %}
{%- set sls_method_install = tplroot ~ '.package.' ~ rbw.lookup.pkg.install_mode %}

include:
  - {{ sls_method_install }}


rbw setup is completed:
  test.nop:
    - name: Hooray, rbw setup has finished.
    - require:
      - sls: {{ sls_method_install }}
