# vim: ft=sls

{#-
    Removes the rbw package.
    Has a dependency on `tool_rbw.config.clean`_.
#}

{%- set tplroot = tpldir.split("/")[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as rbw with context %}
{%- set sls_method_install = tplroot ~ ".package." ~ rbw.lookup.pkg.install_mode %}

include:
  - {{ sls_method_install }}
