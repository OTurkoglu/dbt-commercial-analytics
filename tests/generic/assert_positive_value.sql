-- Generic test: asserts that a numeric column contains no negative values
-- Usage: add to any schema.yml under column tests as assert_positive_value

{% test assert_positive_value(model, column_name) %}

select
    {{ column_name }} as failing_value
from {{ model }}
where {{ column_name }} < 0

{% endtest %}