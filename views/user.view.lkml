view: user {
  sql_table_name: public."user" ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: test {}

  dimension: access_token {
    type: string
    sql: ${TABLE}."access_token" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."email" ;;
  }

  dimension: expires_at {
    type: string
    sql: ${TABLE}."expires_at" ;;
  }

  dimension: password_hash {
    type: string
    sql: ${TABLE}."password_hash" ;;
  }

  dimension: refresh_token {
    type: string
    sql: ${TABLE}."refresh_token" ;;
  }

  dimension: strava_code {
    type: string
    sql: ${TABLE}."strava_code" ;;
  }

  dimension: timenow {
    type: string
    sql: ${TABLE}."timenow" ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}."username" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, username, activity.count]
  }
}
