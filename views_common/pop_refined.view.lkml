include: "//the_look/views_common/period_over_period_postgresql.view.lkml"

view: +period_over_period_postgresql {

  filter: current_date_range {
    label: "Select Current Date Range"
  }

}
