# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as rbw with context %}

{#- Running cargo install as root is not recommended,
    neither is cargo using as distribution method.
    For Debian and Arch, there are official packages. @TODO
#}

{%- for user in rbw.users %}

rbw is installed for user '{{ user.name }}':
  cargo.installed:
    - name: {{ rbw.lookup.pkg.name }}
    - version: {{ rbw.get('version') or 'latest' }}
    {#- do not specify alternative return value to be able to unset default version #}
    - user: {{ user.name }}
{%- endfor %}
