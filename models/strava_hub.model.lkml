connection: "tamedog"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
include: "//strava_hub/views/base.view"
include: "/refined_views/base_refined.view"

explore: base {}
