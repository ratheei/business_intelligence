# Extra Instructions

Rules the LLM follows when it writes SQL for `listings`.

- `price` is the nightly price in U.S. dollars. When the user asks what something costs, use `price` and round money to whole dollars in the answer.
- `host_is_superhost` and `instant_bookable` are text values `'t'` and `'f'`, not booleans. Use `'t'` for yes and `'f'` for no.
- When matching a city, use the `city` column and match the user's city name case-insensitively. The available cities are `Chicago`, `Columbus`, and `Twin Cities`.
- When searching listing names, use case-insensitive matching with `LOWER(name) LIKE LOWER(...)` so the search works regardless of capitalization.
- When calculating average `review_scores_rating`, ignore rows where the rating is `NULL`.

<!-- Add more rules below (Assignment 05 asks for at least three). Good candidates:
     `host_is_superhost` and `instant_bookable` are the text values 't' and 'f',
     not booleans; how to match a city name the user types; how to search `name`
     case-insensitively; and whether to ignore rows whose `review_scores_rating`
     is NULL when averaging ratings. -->
