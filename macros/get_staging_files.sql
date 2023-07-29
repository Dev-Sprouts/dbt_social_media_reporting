{% macro get_staging_files() %}

    {% set staging_file = [] %}

    {% if var('collback__twitter_enabled') %} 
    {% set _ = staging_file.append(ref('collback__twitter_posts_reporting')) %}
    {% endif %}

    {% if var('collback__facebook_enabled') %} 
    {% set _ = staging_file.append(ref('collback__facebook_posts_reporting')) %}
    {% endif %}

    {% if var('collback__linkedin_enabled') %} 
    {% set _ = staging_file.append(ref('collback__linkedin_posts_reporting')) %}
    {% endif %}

    {% if var('collback__instagram_enabled') %} 
    {% set _ = staging_file.append(ref('collback__instagram_posts_reporting')) %}
    {% endif %}


    {{ return(staging_file) }}

{% endmacro %}