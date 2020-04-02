view: activity_streams {
  sql_table_name:
    (SELECT
      activity_id,
      nullif(json_array_elements(streams::json#>'{time}')::TEXT,'null')::FLOAT AS time,
      nullif(json_array_elements(streams::json#>'{latlng}')::TEXT,'null') AS latlng,
      json_array_elements(streams::json#>'{latlng}')::json->>0 AS lat,
      json_array_elements(streams::json#>'{latlng}')::json->>1 AS lng,
      nullif(json_array_elements(streams::json#>'{distance}')::TEXT,'null')::FLOAT AS distance,
      nullif(json_array_elements(streams::json#>'{altitude}')::TEXT,'null')::FLOAT AS altitude,
      nullif(json_array_elements(streams::json#>'{velocity_smooth}')::TEXT,'null')::FLOAT AS velocity_smooth,
      nullif(json_array_elements(streams::json#>'{heartrate}')::TEXT,'null')::FLOAT AS heartrate,
      nullif(json_array_elements(streams::json#>'{cadence}')::TEXT,'null')::FLOAT AS cadence,
      nullif(json_array_elements(streams::json#>'{watts}')::TEXT,'null')::FLOAT AS watts,
      nullif(json_array_elements(streams::json#>'{temp}')::TEXT,'null')::FLOAT AS temp,
      nullif(json_array_elements(streams::json#>'{moving}')::TEXT,'null')::BOOLEAN AS moving,
      nullif(json_array_elements(streams::json#>'{grade_smooth}')::TEXT,'null')::FLOAT AS grade_smooth
  FROM public.activity) ;;

  dimension: pk {
    primary_key: yes
    type: string
    sql: CONCAT(${activity_id}, ${time}) ;;
  }

  dimension: activity_id {
    type: string
    sql: ${TABLE}.activity_id ;;
  }

  dimension: time {
    type: number
    sql: ${TABLE}.time ;;
  }

  dimension: latlng {
    type: string
    sql: ${TABLE}.latlng ;;
  }

  dimension: lat {
    type: string
    sql: ${TABLE}.lat ;;
  }

  dimension: lng {
    type: string
    sql: ${TABLE}.lng ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${lat} ;;
    sql_longitude: ${lng} ;;
  }

  dimension: distance {
    type: number
    sql: ${TABLE}.distance::FLOAT ;;
  }

  dimension: altitude {
    type: string
    sql: ${TABLE}.altitude ;;
  }

  dimension: velocity_smooth {
    type: string
    sql: ${TABLE}.velocity_smooth ;;
  }

  dimension: heartrate {
    type: string
    sql: ${TABLE}.heartrate ;;
  }

  dimension: cadence {
    type: number
    sql: ${TABLE}.cadence ;;
  }

  dimension: watts {
    type: string
    sql: ${TABLE}.watts ;;
  }

  dimension: temp {
    type: string
    sql: ${TABLE}.temp ;;
  }

  dimension: is_moving {
    type: yesno
    sql: ${TABLE}.moving ;;
  }

  dimension: grade_smooth {
    type: string
    sql: ${TABLE}.grade_smooth ;;
  }

}
