connection: "tamedog"

# include all the views
include: "/views/**/*.view"
include: "/dashboards/**/*.dashboard"

include: "//the_look/views/products.view"

explore: products {}

datagroup: strava_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: strava_default_datagroup

test: there_are_activities {
  explore_source: activity {
    column: count {}
  }
  assert: expected_count {
    expression: ${activity.count} > 0 ;;
  }
}

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

  join: activity_streams {
    type: left_outer
    sql_on: ${activity.activity_id} = ${activity_streams.activity_id} ;;
    relationship: one_to_many
  }

}

explore: activity_streams {}

explore: user {}
