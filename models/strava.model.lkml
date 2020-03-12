connection: "strava"

# include all the views
include: "/views/**/*.view"

datagroup: strava_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: strava_default_datagroup

explore: activity {

  access_filter: {
    field: user.username
    user_attribute: strava_heroku_username
  }

  join: activity_grouping {
    view_label: "Activity"
    type: left_outer
    sql_on: ${activity.activity_id} = ${activity_grouping.activity_id} ;;
    relationship: one_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${activity.user_id} = ${user.id} ;;
    relationship: many_to_one
  }

  join: weightings {
    type: left_outer
    sql_on: true ;;
    relationship: many_to_one
  }

  sql_always_where: {% condition activity_grouping.type %} ${type} {% endcondition %} ;;
}

explore: user {}
