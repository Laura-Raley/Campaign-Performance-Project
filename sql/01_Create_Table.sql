--Create table in SQL Server

CREATE TABLE CampaignPerformance (
    Row_ID INT PRIMARY KEY,
    Week_Start DATE,
    Week_Number INT,
    Campaign VARCHAR(50),
    Ad_Group VARCHAR(50),
    Inventory_Source VARCHAR(100),
    Creative VARCHAR(100),
    Device_Type VARCHAR(50),
    Spend DECIMAL(10,2),
    Impressions BIGINT,
    Clicks INT,
    Leads INT,
    Enrollments INT,
    Bids BIGINT,
    Total_Bid_Amount DECIMAL(14,4),
	Ad_Plays BIGINT
);