{%- set foods = ['carrot','hotdog','cucumber','bell pepper'] -%}
{%- for food in foods -%}
    {%- if food == 'hotdog' -%}
        {%- set food_type = 'snack' -%}
    {%- else -%}
        {%- set food_type = 'vegetable' -%}       
    {%- endif -%}
My faviourite {{food}} is {{food_type}}    
{% endfor %}


{# {% set tempature = 100 %}
{% if tempature<65 %}
    Its time for coffee
{% else %}
    Its time for cool drink
{% endif %}   
#}
{#
{% set my_animals = ['lemur','wolf','panther','tardigrade'] %}
{% for animal in my_animals %}
{{animal}}
{% endfor %}
#}
{#
{% set my_string = 'hello! Rakesh' %}
{% set message = 'I love you'%}
{% set message1 = 'forever'%}
{{ my_string }} {{message}} {{message1}}
#}

/*
{% for i in range(10) %}
select {{i}} as number {% if not loop.last %} union all {% endif %}
{% endfor %}
 */