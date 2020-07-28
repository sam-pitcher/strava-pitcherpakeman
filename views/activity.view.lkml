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
#     hidden: yes
    full_suggestions: yes
    type: string
    sql: ${TABLE}."activity_type" ;;
    link: {
      label: "DRILL IT"
      url: "/explore/strava/activity?fields=activity.total_distance,activity.total_duration,activity.activity_month&fill_fields=activity.activity_month&f[activity.activity_month]=12+months&sorts=activity.activity_month&limit=500&column_limit=50&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22activity.total_distance%22%2C%22id%22%3A%22activity.total_distance%22%2C%22name%22%3A%22Total+Distance%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22linear%22%7D%2C%7B%22label%22%3Anull%2C%22orientation%22%3A%22right%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22activity.total_duration%22%2C%22id%22%3A%22activity.total_duration%22%2C%22name%22%3A%22Total+Duration%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22linear%22%7D%5D%2C%22series_types%22%3A%7B%22activity.total_duration%22%3A%22line%22%7D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%2C%22show_null_points%22%3Atrue%7D&filter_config=%7B%22activity.activity_month%22%3A%5B%7B%22type%22%3A%22past%22%2C%22values%22%3A%5B%7B%22constant%22%3A%2212%22%2C%22unit%22%3A%22mo%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded"
    }
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
    type: number
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
    link: {
      label: "Activity Overview"
      url: "/dashboards/24?Activity%20ID={{activity_id._value}}"
    }
    link: {
      label: "PBL Activity Overview"
      url: "http://127.0.0.1:5000/activity_overview/{{activity_id._value}}"
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

  measure: count_list {
    type: list
    list_field: type
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
