{%- from 'tool-rbw/map.jinja' import rbw %}

{%- for user in rbw.users | selectattr('rbw.config', 'defined') %}
rbw is setup for user '{{ user.name }}':
  file.serialize:
    - name: {{ user._rbw.confdir }}/config.json
    - serializer: json
    - dataset:
        email: {{ user.rbw.config.email }}
        base_url: {{ user.rbw.config.get('base_url', 'https://api.bitwarden.com/') }}
        identity_url: {{ user.rbw.config.get('identity_url', 'https://identity.bitwarden.com/') }}
        lock_timeout: {{ user.rbw.config.get('lock_timeout', 3600) }}
        pinentry: {{ user.rbw.config.get('pinentry', 'pinentry') }}
    - user: {{ user.name }}
    - group: {{ user.group }}
    - mode: '0600'
    - makedirs: True
{%- endfor %}
