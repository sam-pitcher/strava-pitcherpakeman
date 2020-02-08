view: activity {
  sql_table_name: public.activity ;;
  drill_fields: [activity_id]

  dimension: activity_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."activity_id" ;;
  }

  dimension: type {
    # Declared in Activity Grouping
    hidden: yes
    type: string
    sql: ${TABLE}."activity_type" ;;
  }

  dimension: avg_heartrate {
    type: string
    sql: CAST(${TABLE}."avg_heartrate" AS FLOAT) ;;
  }

  dimension: avg_power {
    type: string
    sql: CAST(${TABLE}."avg_power" AS FLOAT) ;;
  }

  dimension: avg_speed {
    type: string
    sql: CAST(${TABLE}."avg_speed" AS FLOAT) ;;
  }

  dimension: distance {
    type: number
    sql: CAST(${TABLE}."distance" AS FLOAT) ;;
  }

  dimension: distance_for_scatter {
    type: number
    sql: ${distance} + (0.000001 * ${id}) ;;
    value_format_name: decimal_2
    html: {{rendered_value}}m ;;
  }

  dimension: duration {
    type: string
    sql: CAST(${TABLE}."duration" AS FLOAT) ;;
  }

  dimension: elevation {
    type: string
    sql: CAST(${TABLE}."elevation" AS FLOAT) ;;
  }

  dimension: epoch {
    type: number
    sql: ${TABLE}."epoch" ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: max_heartrate {
    type: string
    sql: CAST(${TABLE}."max_heartrate" AS FLOAT) ;;
  }

  dimension: max_power {
    type: string
    sql: CAST(${TABLE}."max_power" AS FLOAT) ;;
  }

  dimension: max_speed {
    type: string
    sql: CAST(${TABLE}."max_speed" AS FLOAT) ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
    html: <a href="https://www.strava.com/activities/{{id._value}}">{{rendered_value}}</a> ;;
  }

  dimension: name_id {
    type: string
    sql: ${TABLE}."name_id" ;;
  }

  dimension_group: activity {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."timestamp" ;;
  }

  dimension: user_id {
    type: number
    hidden: yes
    sql: ${TABLE}."user_id" ;;
  }

  measure: total_distance {
    type: sum
    sql: ${distance} ;;
  }

  measure: total_duration_seconds {
    type: sum
    sql: ${duration} ;;
  }

  measure: total_duration {
    type: number
    sql: ${total_duration_seconds} / 86400 ;;
    value_format: "hh:mm:ss"
  }

  measure: count {
    type: count
    drill_fields: [activity_id, name, user.id, user.username]
  }
}
