with report as (

    select *
    from {{ var('linkedin_posts_report') }}

), fields as (

    select        
        organization_id as page_id,
        organization_name as page_name,
        ugc_post_id as post_id,
        created_timestamp,
        post_url,
        coalesce(title_text, specific_content_share_commentary_text) as post_message,
        coalesce(sum(click_count),0) as clicks,
        coalesce(sum(comment_count),0) as comments,
        coalesce(sum(impression_count),0) as impressions,
        coalesce(sum(like_count),0) as likes,
        coalesce(sum(share_count),0) as shares
    from report
    {{ dbt_utils.group_by(6) }}

)

select *
from fields