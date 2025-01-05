{% macro percentage_val(first_val, second_val) %}
    case 
        when {{ second_val }} = 0 then 0
        when {{ first_val }} = 0 then 0
        else (CAST({{ first_val }} AS FLOAT64) / CAST({{ second_val }} AS FLOAT64)) * 100
    end    
{% endmacro %}