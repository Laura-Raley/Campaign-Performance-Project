--Calculate the main KPIs

SELECT
    SUM(Spend) AS Total_Spend,
    SUM(Impressions) AS Total_Impressions,
    SUM(Clicks) AS Total_Clicks,
    SUM(Leads) AS Total_Leads,
    SUM(Enrollments) AS Total_Enrollments,
    SUM(Bids) AS Total_Bids,
    CAST(
        SUM(Spend) / NULLIF(SUM(Impressions), 0) * 1000
        AS DECIMAL(10,2)
    ) AS CPM,
    CAST(
        SUM(Clicks) * 100.0 / NULLIF(SUM(Impressions), 0)
        AS DECIMAL(10,2)
    ) AS CTR_Percent,
    CAST(
        SUM(Spend) / NULLIF(SUM(Leads), 0)
        AS DECIMAL(10,2)
    ) AS CPL,
    CAST(
        SUM(Spend) / NULLIF(SUM(Enrollments), 0)
        AS DECIMAL(10,2)
    ) AS CPE,
    CAST(
        SUM(Impressions) * 100.0 / NULLIF(SUM(Bids), 0)
        AS DECIMAL(10,2)
    ) AS Win_Rate_Percent,
    CAST(
        SUM(Total_Bid_Amount)
        / NULLIF(
            SUM(Bids)
            * (
                SUM(Impressions) * 1.0
                / NULLIF(SUM(Ad_Plays), 0)
            ),
            0
        ) * 1000
        AS DECIMAL(10,2)
    ) AS Avg_Bid_CPM
FROM dbo.CampaignPerformance;

--Performance by campaign

SELECT
    Campaign,
    SUM(Spend) AS Total_Spend,
    SUM(Impressions) AS Total_Impressions,
    SUM(Clicks) AS Total_Clicks,
    SUM(Leads) AS Total_Leads,
    SUM(Enrollments) AS Total_Enrollments,
    SUM(Bids) AS Total_Bids,
    CAST(
        SUM(Spend) / NULLIF(SUM(Impressions), 0) * 1000
        AS DECIMAL(10,2)
    ) AS CPM,
    CAST(
        SUM(Clicks) * 100.0 / NULLIF(SUM(Impressions), 0)
        AS DECIMAL(10,2)
    ) AS CTR_Percent,
    CAST(
        SUM(Spend) / NULLIF(SUM(Leads), 0)
        AS DECIMAL(10,2)
    ) AS CPL,
    CAST(
        SUM(Spend) / NULLIF(SUM(Enrollments), 0)
        AS DECIMAL(10,2)
    ) AS CPE,
    CAST(
        SUM(Impressions) * 100.0 / NULLIF(SUM(Bids), 0)
        AS DECIMAL(10,2)
    ) AS Win_Rate_Percent,
    CAST(
        SUM(Total_Bid_Amount)
        / NULLIF(
            SUM(Bids)
            * (
                SUM(Impressions) * 1.0
                / NULLIF(SUM(Ad_Plays), 0)
            ),
            0
        ) * 1000
        AS DECIMAL(10,2)
    ) AS Avg_Bid_CPM
FROM dbo.CampaignPerformance
GROUP BY Campaign
ORDER BY Campaign;

--Compare first-half and second-half CPE performance by campaign

SELECT
    Campaign,
    CASE
        WHEN Week_Number <= 6 THEN 'First Half'
        ELSE 'Second Half'
    END AS Campaign_Period,
    SUM(Spend) AS Total_Spend,
    SUM(Impressions) AS Total_Impressions,
    SUM(Clicks) AS Total_Clicks,
    SUM(Leads) AS Total_Leads,
    SUM(Enrollments) AS Total_Enrollments,
    SUM(Bids) AS Total_Bids,
    CAST(
        SUM(Spend) / NULLIF(SUM(Impressions), 0) * 1000
        AS DECIMAL(10,2)
    ) AS CPM,
    CAST(
        SUM(Clicks) * 100.0 / NULLIF(SUM(Impressions), 0)
        AS DECIMAL(10,2)
    ) AS CTR_Percent,
    CAST(
        SUM(Spend) / NULLIF(SUM(Leads), 0)
        AS DECIMAL(10,2)
    ) AS CPL,
    CAST(
        SUM(Spend) / NULLIF(SUM(Enrollments), 0)
        AS DECIMAL(10,2)
    ) AS CPE,
    CAST(
        SUM(Impressions) * 100.0 / NULLIF(SUM(Bids), 0)
        AS DECIMAL(10,2)
    ) AS Win_Rate_Percent,
    CAST(
        SUM(Total_Bid_Amount)
        / NULLIF(
            SUM(Bids)
            * (
                SUM(Impressions) * 1.0
                / NULLIF(SUM(Ad_Plays), 0)
            ),
            0
        ) * 1000
        AS DECIMAL(10,2)
    ) AS Avg_Bid_CPM
FROM dbo.CampaignPerformance
GROUP BY
    Campaign,
    CASE
        WHEN Week_Number <= 6 THEN 'First Half'
        ELSE 'Second Half'
    END
ORDER BY
    Campaign,
    Campaign_Period;

--Calculate change in CPE between periods

WITH PeriodPerformance AS
(
	SELECT
		Campaign,
		CASE
			WHEN Week_Number <=6 THEN 'First Half'
			ELSE 'Second Half'
		END AS Campaign_Period,
		CAST(
			SUM(Spend)/NULLIF(SUM(Enrollments),0)
			AS DECIMAL(10,2)
		) AS CPE
FROM dbo.CampaignPerformance
GROUP BY
	Campaign,
	CASE
		WHEN Week_Number <=6 THEN 'First Half'
		ELSE 'Second Half'
	END
),

CampaignComparison AS
(
	SELECT
		Campaign,
		MAX(
			CASE
				WHEN Campaign_Period = 'First Half'
				THEN CPE
			END
		) AS 'First_Half_CPE',
		MAX(
			CASE
				WHEN Campaign_Period = 'Second Half'
				THEN CPE
			END
		) AS 'Second_Half_CPE'
	FROM PeriodPerformance
	GROUP BY Campaign
)
SELECT
	Campaign,
	First_Half_CPE,
	Second_Half_CPE,
	CAST(
		Second_Half_CPE - First_Half_CPE
		AS DECIMAL(10,2)
	) AS CPE_Dollar_Change,
	CAST(
		(Second_Half_CPE - First_Half_CPE)
		*100.0
		/NULLIF(First_Half_CPE,0)
		AS DECIMAL(10,2)
	) AS CPE_Percentage_Change
FROM CampaignComparison
ORDER BY CPE_Percentage_Change;