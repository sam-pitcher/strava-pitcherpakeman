connection: "strava"

include: "/views/**/*.view"
include: "../strava_lookml.dashboard"
include: "../strava_lookml_client_b.dashboard"

explore: activity {
  extends: [activity]
}
