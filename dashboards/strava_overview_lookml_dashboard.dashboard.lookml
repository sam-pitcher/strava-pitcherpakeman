- dashboard: strava_overview_lookml_dashboard
  title: Strava Overview
  layout: newspaper
  embed_style:
    background_color: "#f6f8fa"
    show_title: false
    title_color: "#3a4245"
    show_filters_bar: false
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - title: Total Activities
    name: Total Activities
    model: strava
    explore: activity
    type: single_value
    fields: [activity.count]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen:
      Date: activity.activity_date
      Type: activity.type
    row: 0
    col: 0
    width: 8
    height: 3
  - title: Tri Count Split
    name: Tri Count Split
    model: strava
    explore: activity
    type: looker_bar
    fields: [activity.type, activity.count]
    pivots: [activity.type]
    filters:
      activity.type: Swim,Ride,Run
    sorts: [activity.count desc 0, activity.type]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hide_legend: true
    series_types: {}
    series_colors:
      Swim - activity.count: "#7CC8FA"
      Run - activity.count: "#10C871"
      Ride - activity.count: "#F29ED2"
    defaults_version: 1
    listen:
      Date: activity.activity_date
      Measure Type: activity.measure_parameter
    row: 15
    col: 0
    width: 12
    height: 4
  - title: Activity Split
    name: Activity Split
    model: strava
    explore: activity
    type: looker_column
    fields: [activity.type, activity.count]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_colors:
      activity.count: "#FD9577"
    defaults_version: 1
    listen:
      Date: activity.activity_date
      Measure Type: activity.measure_parameter
    row: 3
    col: 0
    width: 12
    height: 6
  - title: Total Duration
    name: Total Duration
    model: strava
    explore: activity
    type: single_value
    fields: [activity.total_duration]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen:
      Date: activity.activity_date
      Type: activity.type
    row: 0
    col: 8
    width: 8
    height: 3
  - title: Total Distance
    name: Total Distance
    model: strava
    explore: activity
    type: single_value
    fields: [activity.total_distance]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen:
      Date: activity.activity_date
      Type: activity.type
    row: 0
    col: 16
    width: 8
    height: 3
  - title: Activity Count by Month
    name: Activity Count by Month
    model: strava
    explore: activity
    type: looker_area
    fields: [activity.count, activity.activity_month]
    fill_fields: [activity.activity_month]
    sorts: [activity.activity_month desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    series_colors:
      activity.count: "#FD9577"
    ordering: none
    show_null_labels: false
    defaults_version: 1
    listen:
      Date: activity.activity_date
      Measure Type: activity.measure_parameter
    row: 3
    col: 12
    width: 12
    height: 6
  - title: Tri Count Split by Month
    name: Tri Count Split by Month
    model: strava
    explore: activity
    type: looker_bar
    fields: [activity.type, activity.count, activity.activity_month]
    pivots: [activity.type]
    fill_fields: [activity.activity_month]
    filters:
      activity.type: Swim,Ride,Run
    sorts: [activity.type 0, activity.activity_month desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: true
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hide_legend: true
    series_types: {}
    series_colors:
      Swim - activity.count: "#7CC8FA"
      Run - activity.count: "#10C871"
      Ride - activity.count: "#F29ED2"
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    listen:
      Date: activity.activity_date
      Measure Type: activity.measure_parameter
    row: 19
    col: 0
    width: 12
    height: 5
  - title: Tri Activity Count by Month
    name: Tri Activity Count by Month
    model: strava
    explore: activity
    type: looker_line
    fields: [activity.count, activity.activity_month, activity.type]
    pivots: [activity.type]
    fill_fields: [activity.activity_month]
    filters:
      activity.type: Swim,Ride,Run
    sorts: [activity.activity_month desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    series_colors:
      activity.count: "#FD9577"
      Ride - activity.count: "#F29ED2"
      Swim - activity.count: "#7CC8FA"
      Run - activity.count: "#10C871"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Date: activity.activity_date
      Measure Type: activity.measure_parameter
    row: 15
    col: 12
    width: 12
    height: 9
  - title: Last 10 Activities
    name: Last 10 Activities
    model: strava
    explore: activity
    type: table
    fields: [activity.activity_date, activity.name, activity.type, activity.total_distance,
      activity.total_duration]
    sorts: [activity.activity_date desc]
    limit: 10
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 9
    col: 0
    width: 24
    height: 6
  filters:
  - name: Date
    title: Date
    type: field_filter
    default_value: 18 months
    allow_multiple_values: true
    required: false
    model: strava
    explore: activity
    listens_to_filters: []
    field: activity.activity_date
  - name: Type
    title: Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: strava
    explore: activity
    listens_to_filters: []
    field: activity.type
  - name: Measure Type
    title: Measure Type
    type: field_filter
    default_value: count
    allow_multiple_values: true
    required: false
    model: strava
    explore: activity
    listens_to_filters: []
    field: activity.measure_parameter
