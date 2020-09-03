include: "//strava_hub/views/base.view"

view: +base {
  dimension: one {
    sql: 2 ;;
    type: number
  }
}

view: +base {
  final: yes
  dimension: one {
    sql: 3 ;;
    type: number
  }
}
