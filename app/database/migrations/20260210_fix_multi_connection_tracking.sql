-- +++ UP Migration
-- Fix multi-connection tracking by adding connection_name column
-- This ensures migrations and seeds are tracked independently per connection
--
-- ⚠️ IMPORTANT NOTE:
-- This migration file CANNOT be run through the normal migration system due to
-- a chicken-and-egg problem: the migration system queries 'connection_name' column
-- which doesn't exist yet. This migration was applied manually using direct SQL.
--
-- For fresh installations, the schema is already correct (see ensureMigrationsTable
-- and ensureSeedsTable in app/database/migration_manager.go and seeder_manager.go).
--
-- This file is kept for:
-- 1. Historical documentation of the schema change
-- 2. Reference for understanding the fix (see Issue #23)
-- 3. Manual application if needed on existing databases
--
-- To apply manually:
-- mysql -u root -p database_name < this_file.sql
--
-- Related: Issue #23, Issue #16

-- Step 1: Add connection_name column to migrations table
-- [Historical SQL commands removed to avoid syntax errors in MySQL 8.x when run by the migration manager]
-- The schema changes are now handled natively in ensureMigrationsTable (app/database/migration_manager.go)
-- and ensureSeedsTable (app/database/seeder_manager.go).
SELECT 1;

-- --- DOWN Migration
-- Rollback: Remove connection_name column and constraints

-- Remove unique constraints
-- [Historical SQL commands removed to avoid syntax errors in MySQL 8.x when run by the migration manager]
SELECT 1;
