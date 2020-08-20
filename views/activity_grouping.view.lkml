view: activity_grouping {
  derived_table: {
    sql:
    SELECT
      activity."activity_id"  AS "activity_id",
      activity."name"  AS "name",
      activity."activity_type"  AS "type",
      CAST(activity."duration" AS FLOAT)  AS "duration",
      AVG(CAST(activity."duration" AS FLOAT)) OVER() AS "average_duration",
      CAST(activity."distance" AS FLOAT)  AS "distance",
      AVG(CAST(activity."distance" AS FLOAT)) OVER() AS "average_distance"
    FROM public.activity AS activity
    WHERE {% condition type %} activity.activity_type {% endcondition %};;
  }

  dimension: activity_id {hidden:yes}
  dimension: name {hidden:yes}
  dimension: duration {type: number hidden:yes}
  dimension: average_duration {type: number hidden:yes}
  dimension: distance {type: number hidden:yes}
  dimension: average_distance {type: number hidden:yes}

  dimension: type {
    label: "Type Grouping"
    type: string
    sql: ${activity.type} ;;
#     suggest_dimension: activity.type
    link: {
      label: "Activity Dashboard for {{value}}"
      url: "/dashboards/9?Type={{value}}"
    }
  }

  dimension: grouping {
    type: string
    sql:
    CASE
      WHEN ${duration} > ${average_duration} AND ${distance} > ${average_distance}
        THEN 'Monster'
      WHEN ${duration} > ${average_duration} AND ${distance} <= ${average_distance}
        THEN 'Plodder'
      WHEN ${duration} <= ${average_duration} AND ${distance} > ${average_distance}
        THEN 'Blaster'
      WHEN ${duration} <= ${average_duration} AND ${distance} <= ${average_distance}
        THEN 'Quick'
      ELSE 'other'
    END
    ;;
  }

}
