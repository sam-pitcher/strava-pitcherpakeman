# view: activity_max {
#   sql_table_name:
#   (SELECT
#     activity_id,
#     maxs::json->'max_power_1' as max_power_1,
#     maxs::json->'max_power_5' as max_power_5,
#     maxs::json->'max_power_10' as max_power_10,
#     maxs::json->'max_power_20' as max_power_20,
#     maxs::json->'max_power_30' as max_power_30,
#     maxs::json->'max_power_45' as max_power_45,
#     maxs::json->'max_power_60' as max_power_60,
#     maxs::json->'max_power_120' as max_power_120,
#     maxs::json->'max_power_300' as max_power_300,
#     maxs::json->'max_power_600' as max_power_600,
#     maxs::json->'max_power_1200' as max_power_1200,
#     maxs::json->'max_hr_1' as max_hr_1,
#     maxs::json->'max_hr_5' as max_hr_5,
#     maxs::json->'max_hr_10' as max_hr_10,
#     maxs::json->'max_hr_20' as max_hr_20,
#     maxs::json->'max_hr_30' as max_hr_30,
#     maxs::json->'max_hr_45' as max_hr_45,
#     maxs::json->'max_hr_60' as max_hr_60,
#     maxs::json->'max_hr_120' as max_hr_120,
#     maxs::json->'max_hr_300' as max_hr_300,
#     maxs::json->'max_hr_600' as max_hr_600,
#     maxs::json->'max_hr_1200' as max_hr_1200,
#     maxs::json->'max_speed_1' as max_speed_1,
#     maxs::json->'max_speed_5' as max_speed_5,
#     maxs::json->'max_speed_10' as max_speed_10,
#     maxs::json->'max_speed_20' as max_speed_20,
#     maxs::json->'max_speed_30' as max_speed_30,
#     maxs::json->'max_speed_45' as max_speed_45,
#     maxs::json->'max_speed_60' as max_speed_60,
#     maxs::json->'max_speed_120' as max_speed_120,
#     maxs::json->'max_speed_300' as max_speed_300,
#     maxs::json->'max_speed_600' as max_speed_600,
#     maxs::json->'max_speed_1200' as max_speed_1200
#     FROM public.activity)
#   ;;
#
#   dimension: activity_id {
#     type: string
#     sql: ${TABLE}.activity_id ;;
#   }
#
#   dimension: max_power_1 {
#     type: number
#     sql: ${TABLE}.max_power_1::text ;;
#     value_format_name: decimal_2
#     html: {{rendered_value}} watts ;;
#   }
#
#   dimension: max_power_5 {
#     type: number
#     sql: ${TABLE}.max_power_5::text ;;
#     value_format_name: decimal_2
#     html: {{rendered_value}} watts ;;
#   }
#
#   dimension: max_power_10 {
#     type: number
#     sql: ${TABLE}.max_power_10::text ;;
#     value_format_name: decimal_2
#     html: {{rendered_value}} watts ;;
#   }
#
#   dimension: max_power_20 {
#     type: number
#     sql: ${TABLE}.max_power_20::text ;;
#     value_format_name: decimal_2
#     html: {{rendered_value}} watts ;;
#   }
#
#   dimension: max_power_30 {
#     type: number
#     sql: ${TABLE}.max_power_30::text ;;
#     value_format_name: decimal_2
#     html: {{rendered_value}} watts ;;
#   }
#
#   dimension: max_power_45 {
#     type: number
#     sql: ${TABLE}.max_power_45::text ;;
#     value_format_name: decimal_2
#     html: {{rendered_value}} watts ;;
#   }
#
#   dimension: max_power_60 {
#     type: number
#     sql: ${TABLE}.max_power_60::text ;;
#     value_format_name: decimal_2
#     html: {{rendered_value}} watts ;;
#   }
#
#   dimension: max_power_120 {
#     type: number
#     sql: ${TABLE}.max_power_120::text ;;
#     value_format_name: decimal_2
#     html: {{rendered_value}} watts ;;
#   }
#
#   dimension: max_power_300 {
#     type: number
#     sql: ${TABLE}.max_power_300::text ;;
#     value_format_name: decimal_2
#     html: {{rendered_value}} watts ;;
#   }
#
#   dimension: max_power_600 {
#     type: number
#     sql: ${TABLE}.max_power_600::text ;;
#     value_format_name: decimal_2
#     html: {{rendered_value}} watts ;;
#   }
#
#   dimension: max_power_1200 {
#     type: number
#     sql: ${TABLE}.max_power_1200::text ;;
#     value_format_name: decimal_2
#     html: {{rendered_value}} watts ;;
#   }
#
#   dimension: max_hr_1 {
#     type: number
#     sql: ${TABLE}.max_hr_1::text ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   dimension: max_hr_5 {
#     type: number
#     sql: ${TABLE}.max_hr_5::text ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   dimension: max_hr_10 {
#     type: number
#     sql: ${TABLE}.max_hr_10::text ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   dimension: max_hr_20 {
#     type: number
#     sql: ${TABLE}.max_hr_20::text ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   dimension: max_hr_30 {
#     type: number
#     sql: ${TABLE}.max_hr_30::text ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   dimension: max_hr_45 {
#     type: number
#     sql: ${TABLE}.max_hr_45::text ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   dimension: max_hr_60 {
#     type: number
#     sql: ${TABLE}.max_hr_60::text ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   dimension: max_hr_120 {
#     type: number
#     sql: ${TABLE}.max_hr_120::text ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   dimension: max_hr_300 {
#     type: number
#     sql: ${TABLE}.max_hr_300::text ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   dimension: max_hr_600 {
#     type: number
#     sql: ${TABLE}.max_hr_600::text ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   dimension: max_hr_1200 {
#     type: number
#     sql: ${TABLE}.max_hr_1200::text ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   dimension: max_speed_1 {
#     type: number
#     sql: ${TABLE}.max_speed_1::text ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   dimension: max_speed_5 {
#     type: number
#     sql: ${TABLE}.max_speed_5::text ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   dimension: max_speed_10 {
#     type: number
#     sql: ${TABLE}.max_speed_10::text ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   dimension: max_speed_20 {
#     type: number
#     sql: ${TABLE}.max_speed_20::text ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   dimension: max_speed_30 {
#     type: number
#     sql: ${TABLE}.max_speed_30::text ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   dimension: max_speed_45 {
#     type: number
#     sql: ${TABLE}.max_speed_45::text ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   dimension: max_speed_60 {
#     type: number
#     sql: ${TABLE}.max_speed_60::text ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   dimension: max_speed_120 {
#     type: number
#     sql: ${TABLE}.max_speed_120::text ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   dimension: max_speed_300 {
#     type: number
#     sql: ${TABLE}.max_speed_300::text ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   dimension: max_speed_600 {
#     type: number
#     sql: ${TABLE}.max_speed_600::text ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   dimension: max_speed_1200 {
#     type: number
#     sql: ${TABLE}.max_speed_1200::text ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: hr_1 {
#     type: max
#     sql: ${max_hr_1} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: hr_5 {
#     type: max
#     sql: ${max_hr_5} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: hr_10 {
#     type: max
#     sql: ${max_hr_10} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: hr_20 {
#     type: max
#     sql: ${max_hr_20} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: hr_30 {
#     type: max
#     sql: ${max_hr_30} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: hr_45 {
#     type: max
#     sql: ${max_hr_45} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: hr_60 {
#     type: max
#     sql: ${max_hr_60} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: hr_120 {
#     type: max
#     sql: ${max_hr_120} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: hr_300 {
#     type: max
#     sql: ${max_hr_300} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: hr_600 {
#     type: max
#     sql: ${max_hr_600} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: hr_1200 {
#     type: max
#     sql: ${max_hr_1200} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: power_1 {
#     type: max
#     sql: ${max_power_1} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: power_5 {
#     type: max
#     sql: ${max_power_5} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: power_10 {
#     type: max
#     sql: ${max_power_10} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: power_20 {
#     type: max
#     sql: ${max_power_20} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: power_30 {
#     type: max
#     sql: ${max_power_30} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: power_45 {
#     type: max
#     sql: ${max_power_45} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: power_60 {
#     type: max
#     sql: ${max_power_60} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: power_120 {
#     type: max
#     sql: ${max_power_120} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: power_300 {
#     type: max
#     sql: ${max_power_300} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: power_600 {
#     type: max
#     sql: ${max_power_600} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: power_1200 {
#     type: max
#     sql: ${max_power_1200} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: speed_1 {
#     type: max
#     sql: ${max_speed_1} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: speed_5 {
#     type: max
#     sql: ${max_speed_5} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: speed_10 {
#     type: max
#     sql: ${max_speed_10} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: speed_20 {
#     type: max
#     sql: ${max_speed_20} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: hr_30 {
#     type: max
#     sql: ${max_hr_30} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: hr_45 {
#     type: max
#     sql: ${max_hr_45} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: hr_60 {
#     type: max
#     sql: ${max_hr_60} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: hr_120 {
#     type: max
#     sql: ${max_hr_120} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: hr_300 {
#     type: max
#     sql: ${max_hr_300} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: hr_600 {
#     type: max
#     sql: ${max_hr_600} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
#   measure: hr_1200 {
#     type: max
#     sql: ${max_hr_1200} ;;
#     value_format_name: decimal_0
#     html: {{rendered_value}} bpm ;;
#   }
#
# }
