{% macro template_example() %}

{%set query %}

select '1' as number

{%endset%}
{% if execute %}

{%set result=run_query(query).columns[0].values()[0]%}

select {{result}} as is_real from a real_table

{%endif%}
{%endmacro%}