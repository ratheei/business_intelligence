# Midwest Airbnb Chat

**Ask questions about Airbnb listings in Chicago, Columbus, and the Twin Cities**

A querychat app built in ISA 401 at Miami University that lets users ask questions about Airbnb listings in Chicago, Columbus, and the Twin Cities. The app uses a SQLite database and translates natural language questions into SQL queries.

**Live app:** Paste your Render URL here after deployment.

---

## What is this app?

The app connects to a SQLite database (`data/midwest_airbnb.db`) and uses the `listings` table to answer questions about Airbnb listings. Users can ask questions in plain English, and Querychat translates those questions into SQL and returns answers, tables, or charts.

**Example queries:**

* "How many listings are in Chicago?"
* "What is the average price of listings in each city?"
* "Show me the number of listings by room type."

---

## Dataset Information

**Dataset:** `listings` table in `data/midwest_airbnb.db`
**Listings:** 14,887
**Source:** Inside Airbnb
**Locations:** Chicago, Columbus, and the Twin Cities
**Data dictionary:** `data/data_desc.md`
**Query rules for the LLM:** `data/extra_instructions.md`

The database contains Airbnb listing information including prices, room types, neighborhoods, reviews, hosts, availability, and property information.

### Snapshot Dates

* **Chicago:** July 20, 2026
* **Columbus:** July 23, 2026
* **Twin Cities:** July 21, 2026

---

## Required Secret

The app uses the OpenAI API through ellmer, so it requires the environment variable:

`OPENAI_API_KEY`

For local development, store the key in your `.Renviron` file. For Render deployment, add it under Environment Variables as `OPENAI_API_KEY`.

Never commit your API key to GitHub or include it directly in your code.

---

## Running Locally

From inside `apps/midwest_airbnb_chat/`:

```r
shiny::runApp(".", port = 7860)
```

Then open `http://localhost:7860`.

---

## Technology Stack

* **Shiny** - Web application framework for R
* **querychat** - Natural language data querying
* **ellmer** - LLM client for R
* **RSQLite** - SQLite driver for R

---

## Course Information

This application was developed for **ISA 401** at **Miami University**.
