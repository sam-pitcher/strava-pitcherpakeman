view: email_list {
  sql_table_name: (SELECT
    'samjpitcher@gmail.com' AS "email",
    'Run' AS "activity_type"
UNION ALL
SELECT
    'sampitcher@google.com' AS "email",
    'Ride' AS "activity_type") ;;

  dimension: email {}
  dimension: activity_type {}

}
