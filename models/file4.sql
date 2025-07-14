{# if else in jinja #}


{#
{%set temp=60 %}

{% if temp <30%}
time for coffee
{%else%}
time for tea
{% endif %}

{% set l = ['a','b','c','d','e','f'] %}

{% for i in l %}
{% if i=='d'%}
hello there
{% else %}
hello all
{%endif%}
{%endfor%}

#}

{%set num =35 %}

{% if num%2==0 %}
{{num }} is even 
{%else %}
{{num }} is odd
{%endif%}