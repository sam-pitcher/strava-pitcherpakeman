include: "//the_look/views_common/period_over_period_postgresql.view"

view: activity {
  sql_table_name: public.activity ;;
  extends: [period_over_period_postgresql]
  drill_fields: [activity_id]

  parameter: type_parameter {
    suggest_dimension: type
  }

  dimension: pop_no_tz {
    sql: ${activity_date} ;;
  }

#   dimension: test_url {
#     sql: 1 ;;
#     html: {{ path }} ;;
#   }

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

  dimension: segment_track {
    type: string
    tags: ["user_id"]
    sql: 'segment' ;;
  }

  dimension: type {
    # Declared in Activity Grouping
    hidden: yes
    type: string
    sql: ${TABLE}."activity_type" ;;
  }

  dimension: icon_url {
    type: string
    sql: ${TABLE}.icon_url ;;
  }

  dimension: activity_image {
    type: string
    sql: ${icon_url} ;;
    html: <img src={{value}} width="100px" height="100px"> ;;
  }

  dimension: type_category {
    # Declared in Activity Grouping
#     hidden: yes
    type: string
    sql: CASE WHEN ${type} IN ('Run', 'Swim') THEN ${type} ELSE 'Other' END ;;
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

  dimension: weighted_distance {
    type: number
    sql:
    CASE
      WHEN ${type} = 'Run' THEN ${distance} * 3
      WHEN ${type} = 'Swim' THEN ${distance} * 8
    ELSE
      1
    END
    ;;
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
    sql:
    CASE
    WHEN ${type} = 'Run' THEN (1.0 * (${duration}/60) / NULLIF(${distance},0))/1440
    WHEN ${type} = 'Swim' THEN (1.0 * (${duration}/60) / NULLIF(${distance}*10,0))/1440
    ELSE null
    END;;
    value_format: "mm:ss"
    html:
    {% if type._value == 'Run' %}{{rendered_value}} min/km
    {% elsif type._value == 'Swim' %}{{rendered_value}} min/100m
    {% else %}{{rendered_value}}
    {% endif %}
    ;;
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

  dimension: start_lat {
    type: number
    sql: CAST(${TABLE}."start_lat" AS FLOAT) ;;
  }

  dimension: start_lng {
    type: number
    sql: CAST(${TABLE}."start_lng" AS FLOAT) ;;
  }

  dimension: end_lat {
    type: number
    sql: CAST(${TABLE}."end_lat" AS FLOAT) ;;
  }

  dimension: end_lng {
    type: number
    sql: CAST(${TABLE}."end_lng" AS FLOAT) ;;
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

  dimension: is_commute {
    type: yesno
    sql: ${TABLE}.is_commute ;;
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
      month_name,
      month_num,
      quarter,
      year
    ]
    sql: ${TABLE}."timestamp"::timestamp ;;
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

  dimension: hash_date {
    sql: MD5(CAST(current_date AS string)) ;;
  }

  measure: total_duration_seconds {
    type: sum
    sql: ${duration} ;;
    action: {
      label: "My Action"
      url: "https://stravalooker.free.beeceptor.com"
      param: {
        name: "LOOKER_KEY"
        value: "UIWH84W7GHW4O8HGWO48HGW489GH4W8HG"
      }
      param: {
        name: "Activity ID"
        value: "{{activity_id._value}}"
      }
      form_param: {
        name: "Change to:"
        type: string
      }
    }
  }

  measure: total_duration {
    type: number
    sql: ${total_duration_seconds} / 86400 ;;
    value_format: "hh:mm:ss"
  }

  measure: count {
    type: count
    drill_fields: [activity_id, name, count]
    tags: ["segment_anonymous_id"]
  }

  measure: total_count {
    hidden: yes
    type: number
    sql: SUM(${count}) OVER() ;;
  }

  measure: other_count {
    hidden: yes
    type: sum
    sql: 1 ;;
    filters: {
      field: type_category
      value: "Other"
    }
  }

  # measure: weighted_count_temp {
  #   hidden: yes
  #   type: sum
  #   sql:
  #   CASE
  #     WHEN ${type} = 'Run' THEN 1.3
  #     WHEN ${type} = 'Swim' THEN 1.8
  #   ELSE
  #     0
  #   END
  #   ;;
  # }

  # measure: weighted_count {
  #   type: sum
  #   sql:
  #   CASE
  #     WHEN ${type} = 'Run' THEN 1.3
  #     WHEN ${type} = 'Swim' THEN 1.8
  #   ELSE
  #     ${weightings.other_weighting}
  #   END
  #   ;;
  # }

}

view: weightings {
  derived_table: {
    explore_source: activity {
      column: weighted_count_temp {}
      column: other_count {}
      column: total_count {}
      bind_all_filters: yes
    }
  }

  dimension: weighted_count_temp {
    primary_key: yes
    hidden: yes
    type: number
  }

  dimension: other_count {
    hidden: yes
    type: number
  }

  dimension: total_count {
    hidden: yes
    type: number
  }

  dimension: other_weighting {
    hidden: yes
    type: number
    sql: 1.0*(${total_count}-${weighted_count_temp})/NULLIF(${other_count},0) ;;
  }

}
