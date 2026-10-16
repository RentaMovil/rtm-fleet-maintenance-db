# rtm-fleet-maintenance-db

Liquibase migrations for the tables of RentaMovil's **Fleet & Maintenance** service.

- **Database:** `rentamovil` (SQL Server), **shared** by every service.
- **Own schema:** `fleet` — every table in this repo is created as `fleet.<table>`. Nothing goes in `dbo`.
- **Tables:** `branch`, `branch_operating_hour`, `brand`, `category`, `engine_type`, `vehicle_model`,
  `vehicle`, `maintenance_type`, `vehicle_maintenance`.
- **Own Liquibase history:** `dbo.DATABASECHANGELOG_FLEET` / `dbo.DATABASECHANGELOGLOCK_FLEET`.
- **Run order across repos:** 2nd — after `rtm-iam-db` (this repo grants `fleet_app` access to
  `shared.audit`, which `rtm-iam-db` creates). `rtm-booking-reservation-db` will reference
  `fleet.vehicle` / `fleet.branch`, so it runs after this one.

Full conventions (layout, naming, order, rollback): `rtm-docs/06-data/migration-strategy.md`.
Reference implementation: `rtm-iam-db`. Decision record: ADR-009.

## Layout

```
changelog/changelog-master.yaml   ← entry point: includes 01_ddl → 02_dml → 03_dcl → 04_tcl
01_ddl/
  01_schemas/                       CREATE SCHEMA fleet
  03_tables/                        CREATE TABLE, without FKs
  04_alter/                         FKs and the (branch_id, day_of_week) unique constraint
  05_views/                         (empty)
  10_indexes/                       CREATE INDEX
02_dml/
  00_inserts/                       reference data: categories, engine types, brands, models, maintenance types
  01_updates/                       (empty)
  02_deletes/                       (empty)
03_dcl/
  00_roles/                         fleet_app login and user
  01_grants/                        fleet schema + INSERT on shared.audit
04_tcl/
  02_release_tags/                  (empty)
05_rollbacks/                     mirror of 01_ddl … 03_dcl: one .rollback.sql per .sql
```

Every folder exists even when empty (`databaseChangeLog: []` in its `changelog.yaml`, `.gitkeep` in
its `05_rollbacks` mirror). This repo does **not** start SQL Server: that container is started by
`rtm-iam-db` (shared instance), the same as every other `*-db` repo.

## Requirements

- Java 17+
- Maven 3.9+
- SQL Server running and `rtm-iam-db` already migrated (`docker compose up -d` in `rtm-iam-db`)
- Docker Desktop (only if using the Docker usage path below)

## Local usage

```bash
# 1. Local configuration (once)
cp liquibase.properties.example liquibase.properties
# sa password = MSSQL_SA_PASSWORD from rtm-iam-db/.env
# parameter.fleetAppPassword = a password for fleet_app (also DATABASE_PASSWORD in rtm-fleet-maintenance/.env)

# 2. Pending changesets
mvn liquibase:status

# 3. SQL that would run, without running it
mvn liquibase:updateSQL

# 4. Apply
mvn liquibase:update
```

Undo the last changeset: `mvn liquibase:rollback -Dliquibase.rollbackCount=1`.
Before opening a PR, run update → rollback → update; all three must succeed.

### With Docker (shared `rentamovil` network)

```bash
# Once per machine (the data repos share this network)
docker network create rentamovil

# SQL Server + database + IAM migrations first (rtm-iam-db)
cd ../rtm-iam-db && docker compose up -d

# Then this repo's migrations
cp .env.example .env   # edit MSSQL_SA_PASSWORD / FLEET_APP_PASSWORD to match rtm-iam-db's values
docker compose up -d
```

| Container | What it does | Normal status |
|---|---|---|
| `migrations` | Runs this repo's migrations (same as `mvn liquibase:update`) | `Exited (0)` |

Run order to bring the whole stack up: **rtm-iam-db → rtm-fleet-maintenance-db → rtm-iam →
rtm-fleet-maintenance → rtm-api-gateway** (`docker compose up -d` in each).

> With parameters, the Maven plugin prints a harmless `NoSuchFieldException: The field
> 'parameter.fleetAppPassword' could not be found...`. It tries to read it as its own option first
> and then uses it as a parameter. What matters is the final `BUILD SUCCESS`.

## Service database user (`03_dcl`)

Migrations run as `sa`. The `rtm-fleet-maintenance` service **never** uses `sa`: it connects as
`fleet_app`, which can only read and write data in the `fleet` schema (no DDL, no other schemas,
no `dbo`) and append rows to `shared.audit`. Its password is **not in the repo**: it comes from
`parameter.fleetAppPassword` in `liquibase.properties` (git-ignored). If it's missing, the
changeset fails on purpose.

## Reference data

There are no endpoints to create brands, models, categories, engine types or maintenance types:
they are seeded in `02_dml/00_inserts` and resolved by name, never by hardcoded IDs. To add one,
write a **new** changeset — never edit an applied one.

## Branches

`feat/`, `fix/`, `chore/` → PR to `develop` (Squash and Merge). See
`rtm-docs/00-governance/git-conventions.md`.
