view: alembic_version {
  sql_table_name: public.alembic_version ;;

  dimension: version_num {
    type: string
    sql: ${TABLE}."version_num" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
