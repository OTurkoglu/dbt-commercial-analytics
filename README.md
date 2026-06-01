# dbt Commercial Analytics

A production-style dbt project demonstrating analytics engineering best practices using the Jaffle Shop public dataset. Built to showcase data modelling patterns used in commercial and marketing analytics at scale.

## Project Structure

models/
├── sources/          # Entry points — pull only necessary fields from raw tables
├── staging/          # Light cleaning and renaming, 1:1 with source tables
├── intermediate/     # Business logic, joins and calculations
└── marts/            # Final business-facing tables for analysts and reporting

tests/
└── generic/          # Custom generic tests reusable across all models

## Lineage

Raw Sources → src_ (sources) → stg_ (staging) → int_ (intermediate) → marts

## Models

### Sources
| Model | Description |
|-------|-------------|
| src_customers | Entry point for raw customer data |
| src_orders | Entry point for raw orders data |

### Staging
| Model | Description |
|-------|-------------|
| stg_customers | Cleaned and renamed customer fields |
| stg_orders | Cleaned and renamed order fields |

### Intermediate
| Model | Description |
|-------|-------------|
| int_customer_order_summary | Customer-level order metrics — counts, revenue, dates |

### Marts
| Model | Description |
|-------|-------------|
| customer_orders | Final customer orders table served to commercial and marketing teams |

## Key Modelling Decisions

- No SELECT * — all columns named explicitly at every layer
- Staging is source-aligned — one staging model per source table, no joins, no logic
- Business logic lives in intermediate — staging stays clean, marts stay simple
- Marts are serving layer only — no calculations, just selecting from intermediate
- Schema files named after their models for clarity and navigability
- Source tests — uniqueness, not_null, referential integrity and accepted_values on all key columns

## Testing Strategy

- Built-in dbt tests: unique, not_null, accepted_values, relationships
- dbt-utils: expression_is_true for numeric boundary checks
- Custom generic test: assert_positive_value — reusable test ensuring no negative values in numeric columns

## Tech Stack

- Transformation: dbt Core 2.0
- Warehouse: BigQuery (GCP)
- Packages: dbt-utils 1.3.3
- Dataset: Jaffle Shop Classic by dbt Labs

## Running the Project

Install dependencies: pip3 install dbt-bigquery
Install dbt packages: dbt deps
Run all models: dbt run
Run tests: dbt test
Generate docs: dbt docs generate && dbt docs serve

## About

Built by Ozleyis Turkoglu — Analytics Engineering Lead with 10+ years building data platforms at Vodafone and Virgin Media O2.



