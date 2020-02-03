connection: "strava"

# include all the views
include: "/views/**/*.view"

datagroup: strava_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: strava_default_datagroup

explore: activity {
  join: user {
    type: left_outer
    sql_on: ${activity.user_id} = ${user.id} ;;
    relationship: many_to_one
  }
}

explore: alembic_version {}

explore: user {}
