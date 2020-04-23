- dashboard: strava_lookml_client_b
  title: Strava Lookml Client B
  extends: strava
  elements:
  - title: New Tile
    name: Total Activities 2
    model: strava
    explore: activity
    type: single_value
    fields: [activity.count]
    limit: 500
    series_types: {}
    listen:
      Type: activity.type
    row: 2
    col: 2
    width: 5
    height: 3
