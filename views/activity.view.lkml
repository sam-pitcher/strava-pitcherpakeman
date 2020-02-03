view: activity {
  sql_table_name: public.activity ;;
  drill_fields: [activity_id]

  dimension: activity_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."activity_id" ;;
  }

  dimension: activity_type {
    type: string
    sql: ${TABLE}."activity_type" ;;
  }

  dimension: avg_heartrate {
    type: string
    sql: ${TABLE}."avg_heartrate" ;;
  }

  dimension: avg_power {
    type: string
    sql: ${TABLE}."avg_power" ;;
  }

  dimension: avg_speed {
    type: string
    sql: ${TABLE}."avg_speed" ;;
  }

  dimension: distance {
    type: string
    sql: ${TABLE}."distance" ;;
  }

  dimension: duration {
    type: string
    sql: ${TABLE}."duration" ;;
  }

  dimension: elevation {
    type: string
    sql: ${TABLE}."elevation" ;;
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
    sql: ${TABLE}."max_heartrate" ;;
  }

  dimension: max_power {
    type: string
    sql: ${TABLE}."max_power" ;;
  }

  dimension: max_speed {
    type: string
    sql: ${TABLE}."max_speed" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: name_id {
    type: string
    sql: ${TABLE}."name_id" ;;
  }

  dimension_group: timenow {
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
    sql: ${TABLE}."timenow" ;;
  }

  dimension_group: timestamp {
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
    # hidden: yes
    sql: ${TABLE}."user_id" ;;
  }

  measure: count {
    type: count
    drill_fields: [activity_id, name, user.id, user.username]
  }
}
