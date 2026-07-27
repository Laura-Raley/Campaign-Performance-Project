--Confirm row count

SELECT COUNT(*) AS TotalRows
FROM dbo.CampaignPerformance;

--Preview the data

SELECT TOP (10) *
FROM dbo.CampaignPerformance;

--Check for duplicate row IDs

SELECT Row_ID, Count(*) AS ID_Count
FROM dbo.CampaignPerformance
GROUP BY Row_ID
HAVING COUNT(*) > 1

--Check for NULL values

SELECT
    COUNT(*) - COUNT(Row_ID) AS RowID_Nulls,
    COUNT(*) - COUNT(Week_Start) AS WeekStart_Nulls,
    COUNT(*) - COUNT(Week_Number) AS WeekNumber_Nulls,
    COUNT(*) - COUNT(Campaign) AS Campaign_Nulls,
    COUNT(*) - COUNT(Ad_Group) AS AdGroup_Nulls,
    COUNT(*) - COUNT(Inventory_Source) AS InventorySource_Nulls,
    COUNT(*) - COUNT(Creative) AS Creative_Nulls,
    COUNT(*) - COUNT(Device_Type) AS DeviceType_Nulls,
    COUNT(*) - COUNT(Spend) AS Spend_Nulls,
    COUNT(*) - COUNT(Impressions) AS Impressions_Nulls,
    COUNT(*) - COUNT(Clicks) AS Clicks_Nulls,
    COUNT(*) - COUNT(Leads) AS Leads_Nulls,
    COUNT(*) - COUNT(Enrollments) AS Enrollments_Nulls,
    COUNT(*) - COUNT(Bids) AS Bids_Nulls,
    COUNT(*) - COUNT(Avg_Bid_CPM) AS AvgBidCPM_Nulls
FROM dbo.CampaignPerformance;

--Check funnel relationships

SELECT *
FROM dbo.CampaignPerformance
WHERE Impressions > Bids
	OR Clicks > Impressions
	OR Leads > Clicks
	OR Enrollments > Leads;

--Check for negative values

SELECT *
FROM dbo.CampaignPerformance
WHERE Spend < 0
   OR Impressions < 0
   OR Clicks < 0
   OR Leads < 0
   OR Enrollments < 0
   OR Bids < 0
   OR Avg_Bid_CPM < 0;