connection: "strava"

include: "/views/**/*.view"
include: "../strava_lookml.dashboard"
include: "../strava_lookml_client_a.dashboard"

explore: activity {
  extends: [activity]
}
