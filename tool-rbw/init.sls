{%- from 'tool-rbw/map.jinja' import rbw %}

include:
  - .package
{%- if rbw.users | selectattr('rbw.config', 'defined') %}
  - .configsync
{%- endif %}
