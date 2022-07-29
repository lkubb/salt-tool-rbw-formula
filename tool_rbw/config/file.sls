# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_package_install = tplroot ~ '.package.install' %}
{%- from tplroot ~ "/map.jinja" import mapdata as rbw with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

include:
  - {{ sls_package_install }}


{%- for user in rbw.users | selectattr('rbw') %}

rbw config file is managed for user '{{ user.name }}':
  file.serialize:
    - name: {{ user['_rbw'].conffile }}
    - serializer: json
    - dataset:
        email: {{ user.rbw.email }}
        base_url: {{ user.rbw.get('base_url', 'https://api.bitwarden.com/') }}
        identity_url: {{ user.rbw.get('identity_url', 'https://identity.bitwarden.com/') }}
        lock_timeout: {{ user.rbw.get('lock_timeout', 3600) }}
        pinentry: {{ user.rbw.get('pinentry', 'pinentry') }}
    - mode: '0600'
    - user: {{ user.name }}
    - group: {{ user.group }}
    - makedirs: true
    - dir_mode: '0700'
    - require:
      - sls: {{ sls_package_install }}
{%- endfor %}
