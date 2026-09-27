-- =====================================================
-- Project Name:
-- Manufacturing Quality Analytics & Production Intelligence System
--
-- File:
-- 01_Create_Database.sql
--
-- Purpose:
-- Creates the main database for the project
-- =====================================================

DROP DATABASE IF EXISTS manufacturing_quality_analytics;
-- Create Database
CREATE DATABASE IF NOT EXISTS manufacturing_quality_analytics
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;


-- Select Database
USE manufacturing_quality_analytics;


-- Verify Database Selection
SELECT DATABASE();