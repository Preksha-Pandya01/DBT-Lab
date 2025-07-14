{#dictionary in jinja #}

{% set d1={'name':'preksha',
'fruit':'mango',
'animal':'tiger',
'bird':'sparrow'}%}

{{d1}}
{{d1['name']}}

{% for i in d1 %}
{{i}}
{%endfor%}

{% set t=(1,2,3,4,5)%}

{{t[0]}}