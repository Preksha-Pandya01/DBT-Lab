{# list in jinja #}

{% set l = ['a','b','c','d','e','f'] %}

{{l[0]}}
{{l[1]}}
{{l[0]}}+{{l[1]}}

{% for alphabet in l %}

{{alphabet}} is an alphabet

{%endfor%}