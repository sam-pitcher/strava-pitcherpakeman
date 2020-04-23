- dashboard: strava
  title: Strava
  layout: newspaper
  embed_style:
    background_color: "#3bfa40"
    show_title: true
    title_color: "#3a4245"
    show_filters_bar: true
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - title: Activities by Distance and Duration
    name: Activities by Distance and Duration
    model: strava
    explore: activity
    type: looker_scatter
    fields: [activity.total_duration, activity.activity_id, activity.name, activity.type,
      activity.distance_for_scatter]
    pivots: [activity.type]
    sorts: [activity.total_duration desc 0, activity.type]
    limit: 2000
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: activity.total_duration,
            id: AlpineSki - activity.total_duration, name: AlpineSki}, {axisId: activity.total_duration,
            id: Ride - activity.total_duration, name: Ride}, {axisId: activity.total_duration,
            id: Run - activity.total_duration, name: Run}, {axisId: activity.total_duration,
            id: Snowboard - activity.total_duration, name: Snowboard}, {axisId: activity.total_duration,
            id: StandUpPaddling - activity.total_duration, name: StandUpPaddling},
          {axisId: activity.total_duration, id: Swim - activity.total_duration, name: Swim},
          {axisId: activity.total_duration, id: VirtualRide - activity.total_duration,
            name: VirtualRide}, {axisId: activity.total_duration, id: Walk - activity.total_duration,
            name: Walk}, {axisId: activity.total_duration, id: Workout - activity.total_duration,
            name: Workout}], showLabels: true, showValues: true, minValue: 0.01, unpinAxis: false,
        tickDensity: default, type: linear}]
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
    series_types: {}
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    hidden_fields: [activity.activity_id, activity.name]
    listen:
      Type: activity_grouping.type
    row: 6
    col: 0
    width: 12
    height: 8
  - title: Activities by Grouping
    name: Activities by Grouping
    model: strava
    explore: activity
    type: looker_scatter
    fields: [activity.activity_id, activity.distance_for_scatter, activity.total_duration,
      activity_grouping.grouping]
    pivots: [activity_grouping.grouping]
    filters: {}
    sorts: [activity.total_duration desc 0, activity_grouping.grouping]
    limit: 2000
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: activity.total_duration,
            id: Blaster - activity.total_duration, name: Blaster}, {axisId: activity.total_duration,
            id: Monster - activity.total_duration, name: Monster}, {axisId: activity.total_duration,
            id: Plodder - activity.total_duration, name: Plodder}, {axisId: activity.total_duration,
            id: Quick - activity.total_duration, name: Quick}], showLabels: true,
        showValues: true, minValue: 0.01, unpinAxis: false, tickDensity: default,
        type: linear}]
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
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    hidden_fields: [activity.activity_id]
    listen:
      Type: activity_grouping.type
    row: 6
    col: 12
    width: 12
    height: 8
  - title: Total Activities
    name: Total Activities
    model: strava
    explore: activity
    type: single_value
    fields: [activity.count]
    limit: 500
    series_types: {}
    listen:
      Type: activity.type
    row: 0
    col: 0
    width: 5
    height: 3
  - title: Last 5 Activities
    name: Last 5 Activities
    model: strava
    explore: activity
    type: looker_bar
    fields: [activity.activity_date, activity.name, activity.total_distance, activity.total_duration]
    sorts: [activity.activity_date desc]
    limit: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: activity.total_distance,
            id: activity.total_distance, name: Total Distance}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: '', orientation: bottom, series: [{axisId: activity.total_duration,
            id: activity.total_duration, name: Total Duration}], showLabels: true,
        showValues: false, unpinAxis: false, tickDensity: default, type: linear}]
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
    series_types: {}
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
    hidden_fields: [activity.activity_date]
    listen:
      Type: activity.type
    row: 0
    col: 12
    width: 12
    height: 6
  - title: Longest Activity
    name: Longest Activity
    model: strava
    explore: activity
    type: single_value
    fields: [activity.name, activity.total_distance, activity.activity_id]
    sorts: [activity.total_distance desc]
    limit: 1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: [activity.activity_id]
    listen:
      Type: activity.type
    row: 3
    col: 0
    width: 5
    height: 3
  - title: Activity Split
    name: Activity Split
    model: strava
    explore: activity
    type: looker_pie
    fields: [activity.count, activity_grouping.type]
    limit: 500
    series_types: {}
    listen: {}
    row: 0
    col: 5
    width: 7
    height: 6
  - title: test
    name: test
    model: strava
    explore: activity
    type: looker_column
    fields: [activity_grouping.type, activity.count]
    sorts: [activity.count desc]
    limit: 500
    column_limit: 50
    row: 14
    col: 0
    width: 8
    height: 6
  - name: New Tile
    title: New Tile
    merged_queries:
    - model: strava
      explore: activity
      type: looker_column
      fields: [activity_grouping.type, activity.count]
      sorts: [activity.count desc]
      limit: 500
      column_limit: 50
    - model: strava
      explore: activity
      type: table
      fields: [activity_grouping.type, activity.total_distance]
      sorts: [activity.total_distance desc]
      limit: 500
      query_timezone: UTC
      join_fields:
      - field_name: activity_grouping.type
        source_field_name: activity_grouping.type
    type: table
    row: 14
    col: 8
    width: 8
    height: 6
  filters:
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
