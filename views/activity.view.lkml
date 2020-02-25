view: activity {
  sql_table_name: public.activity ;;
  drill_fields: [activity_id]

  dimension: give_feedback {
    sql: 1 ;;
    action: {
      label: "Fill out form"
      url: "https://stravateat.free.beeceptor.com"
      form_param: {
        name: "Title"
        type: string
      }
      form_param: {
        name: "Stuff"
        type: textarea
      }
      user_attribute_param: {
        user_attribute: email
        name: "email"
      }
    }
  }

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
    sql: CAST(${TABLE}."distance" AS FLOAT) / 1000 ;;
  }

  dimension: distance_for_scatter {
    type: number
    sql: ${distance} + (0.000001 * ${id}) ;;
    value_format_name: decimal_2
    html: {{rendered_value}} km ;;
  }

  dimension: duration {
    type: string
    sql: CAST(${TABLE}."duration" AS FLOAT) ;;
  }

  dimension: pace {
    type: number
    sql: (1.0 * (${duration}/60) / NULLIF(${distance},0))/1440 ;;
    value_format: "mm:ss"
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
    type: number
    sql: CAST(${TABLE}."max_power" AS FLOAT) ;;
  }

  dimension: max_speed {
    type: string
    sql: CAST(${TABLE}."max_speed" AS FLOAT) ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
#     html: <a href="https://www.strava.com/activities/{{activity_id._value}}">{{rendered_value}}</a> ;;
    link: {
      label: "See {{value}} on Strava"
      url: "https://www.strava.com/activities/{{activity_id._value}}"
    }
  }

  dimension: name_contains_parkrun {
#     hidden: yes
    type: yesno
    sql: LOWER(${name}) LIKE '%parkrun%' OR LOWER(${name}) LIKE '%park run%' ;;
  }

  dimension: starts_before_10_saturday {
#     hidden: yes
    type: yesno
    sql: EXTRACT('dow' from ${activity_raw}) = 6 AND EXTRACT('hour' from ${activity_raw}) < 10 ;;
  }

  dimension: is_parkrun {
    type: yesno
    sql: ${name_contains_parkrun} AND ${starts_before_10_saturday} ;;
  }

  dimension: day_of_week {
    type: number
    sql: EXTRACT('dow' from ${activity_raw}) ;;
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

  dimension: distance_benchmark {
    type: number
    sql: 3 ;;

  }

  measure: total_distance {
    type: sum
    sql: 1.0 * ${distance} ;;
    value_format_name: decimal_1
#     html: {{rendered_value}} km ;;
    html:
    {% if value < distance_benchmark._value %}
    <font color="darkred">{{ rendered_value }} km</font>
    {% elsif value > distance_benchmark._value %}
    <font color="darkgreen">{{ rendered_value }} km</font>
    {% else %}
    <font color="goldenrod">{{ rendered_value }} km</font>
    {% endif %} ;;
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
    drill_fields: [activity_id, name, count]
  }
}
