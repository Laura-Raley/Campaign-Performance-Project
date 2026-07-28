--Weekly Veterinary Technician performance

SELECT
	Week_Number,
	Week_Start,
	SUM(Spend) AS Total_Spend,
	SUM(Impressions) AS Total_Impressions,
	SUM(Clicks) AS Total_Clicks,
	SUM(Leads) AS Total_Leads,
	SUM(Enrollments) AS Total_Enrollments,
	CAST(
		SUM(Spend)/NULLIF(SUM(Impressions),0) * 1000
		AS DECIMAL(10,2)
	) AS CPM,
	CAST(
		SUM(Clicks) * 100.0/NULLIF(SUM(Impressions),0)
		AS DECIMAL(10,2)
	) AS CTR_Percent,
	CAST(
		SUM(Spend)/NULLIF(SUM(Leads),0)
		AS DECIMAL(10,2)
	) AS CPL,
	CAST(
		SUM(Spend)/NULLIF(SUM(Enrollments),0)
		AS DECIMAL(10,2)
	) AS CPE,
	CAST(
		SUM(Enrollments) * 100.0/NULLIF(SUM(Leads),0)
		AS DECIMAL(10,2)
	) AS Lead_to_Enrollment_Rate,
	CAST(
		SUM(Impressions) * 100.0/NULLIF(SUM(Bids),0)
		AS DECIMAL(10,2)
	) AS Win_Rate_Percent,
	CAST(
        SUM(Total_Bid_Amount)
        /NULLIF(
            SUM(Bids)
            * (
                SUM(Impressions) * 1.0
                /NULLIF(SUM(Ad_Plays), 0)
            ),
            0
        ) * 1000
        AS DECIMAL(10,2)
    ) AS Avg_Bid_CPM
FROM dbo.CampaignPerformance
WHERE Campaign = 'Veterinary Technician'
GROUP BY
	Week_Number,
	Week_Start
ORDER BY Week_Number;

--Compare Vet Technician's ad group performance before and after Week 10 (the inflection point)

SELECT 
	Ad_Group,
	CASE
		WHEN Week_Number <= 9 THEN 'Pre-Decline'
		ELSE 'Decline Period'
	END AS Campaign_Period,
	SUM(Spend) AS Total_Spend,
	SUM(Impressions) AS Total_Impressions,
	SUM(Clicks) AS Total_Clicks,
	SUM(Leads) AS Total_Leads,
	SUM(Enrollments) AS Total_Enrollments,
	CAST(
		SUM(Spend)/NULLIF(SUM(Impressions),0) * 1000
		AS DECIMAL(10,2)
	) AS CPM,
	CAST(
		SUM(Clicks) * 100.0/NULLIF(SUM(Impressions),0)
		AS DECIMAL(10,2)
	) AS CTR_Percent,
	CAST(
		SUM(Spend)/NULLIF(SUM(Leads),0)
		AS DECIMAL(10,2)
	) AS CPL,
	CAST(
		SUM(Spend)/NULLIF(SUM(Enrollments),0)
		AS DECIMAL(10,2)
	) AS CPE,
	CAST(
		SUM(Enrollments) * 100.0/NULLIF(SUM(Leads),0)
		AS DECIMAL(10,2)
	) AS Lead_to_Enrollment_Rate,
	CAST(
		SUM(Impressions) * 100.0/NULLIF(SUM(Bids),0)
		AS DECIMAL(10,2)
	) AS Win_Rate_Percent,
	CAST(
        SUM(Total_Bid_Amount)
        /NULLIF(
            SUM(Bids)
            * (
                SUM(Impressions) * 1.0
                /NULLIF(SUM(Ad_Plays), 0)
            ),
            0
        ) * 1000
        AS DECIMAL(10,2)
    ) AS Avg_Bid_CPM
FROM dbo.CampaignPerformance
WHERE Campaign = 'Veterinary Technician'
GROUP BY
	Ad_Group,
	CASE
		WHEN Week_Number <= 9 THEN 'Pre-Decline'
		ELSE 'Decline Period'
	END
ORDER BY
	Ad_Group,
	Campaign_Period DESC;

--Compare Native inventory performance during Pre-Decline (Weeks 1–9) vs. Decline Period (Weeks 10–12)

SELECT 
	Inventory_Source,
	CASE
		WHEN Week_Number <= 9 THEN 'Pre-Decline'
		ELSE 'Decline Period'
	END AS Campaign_Period,
	SUM(Spend) AS Total_Spend,
	CAST(
        SUM(Spend) * 100.0
        /NULLIF(
            SUM(SUM(Spend)) OVER (
                PARTITION BY
                    CASE
                        WHEN Week_Number <= 9 THEN 'Pre-Decline'
                        ELSE 'Decline Period'
                    END
            ),
            0
        )
        AS DECIMAL(10,2)
    ) AS Spend_Share_Percent,
	SUM(Impressions) AS Total_Impressions,
	SUM(Clicks) AS Total_Clicks,
	SUM(Leads) AS Total_Leads,
	SUM(Enrollments) AS Total_Enrollments,
	CAST(
		SUM(Spend)/NULLIF(SUM(Impressions),0) * 1000
		AS DECIMAL(10,2)
	) AS CPM,
	CAST(
		SUM(Clicks) * 100.0/NULLIF(SUM(Impressions),0)
		AS DECIMAL(10,2)
	) AS CTR_Percent,
	CAST(
		SUM(Spend)/NULLIF(SUM(Leads),0)
		AS DECIMAL(10,2)
	) AS CPL,
	CAST(
		SUM(Spend)/NULLIF(SUM(Enrollments),0)
		AS DECIMAL(10,2)
	) AS CPE,
	CAST(
		SUM(Enrollments) * 100.0/NULLIF(SUM(Leads),0)
		AS DECIMAL(10,2)
	) AS Lead_to_Enrollment_Rate,
	CAST(
		SUM(Impressions) * 100.0/NULLIF(SUM(Bids),0)
		AS DECIMAL(10,2)
	) AS Win_Rate_Percent,
	CAST(
        SUM(Total_Bid_Amount)
        /NULLIF(
            SUM(Bids)
            * (
                SUM(Impressions) * 1.0
                /NULLIF(SUM(Ad_Plays), 0)
            ),
            0
        ) * 1000
        AS DECIMAL(10,2)
    ) AS Avg_Bid_CPM
FROM dbo.CampaignPerformance
WHERE Campaign = 'Veterinary Technician'
	AND Ad_Group = 'Native'
GROUP BY
	Inventory_Source,
	CASE
		WHEN Week_Number <= 9 THEN 'Pre-Decline'
		ELSE 'Decline Period'
	END
ORDER BY
	Inventory_Source,
	Campaign_Period DESC;

--Compare Native creative performance during Pre-Decline (Weeks 1–9) vs. Decline Period (Weeks 10–12)

SELECT 
	Creative,
	CASE
		WHEN Week_Number <= 9 THEN 'Pre-Decline'
		ELSE 'Decline Period'
	END AS Campaign_Period,
	SUM(Spend) AS Total_Spend,
	CAST(
        SUM(Spend) * 100.0
        /NULLIF(
            SUM(SUM(Spend)) OVER (
                PARTITION BY
                    CASE
                        WHEN Week_Number <= 9 THEN 'Pre-Decline'
                        ELSE 'Decline Period'
                    END
            ),
            0
        )
        AS DECIMAL(10,2)
    ) AS Spend_Share_Percent,
	SUM(Impressions) AS Total_Impressions,
	SUM(Clicks) AS Total_Clicks,
	SUM(Leads) AS Total_Leads,
	SUM(Enrollments) AS Total_Enrollments,
	CAST(
		SUM(Spend)/NULLIF(SUM(Impressions),0) * 1000
		AS DECIMAL(10,2)
	) AS CPM,
	CAST(
		SUM(Clicks) * 100.0/NULLIF(SUM(Impressions),0)
		AS DECIMAL(10,2)
	) AS CTR_Percent,
	CAST(
		SUM(Spend)/NULLIF(SUM(Leads),0)
		AS DECIMAL(10,2)
	) AS CPL,
	CAST(
		SUM(Spend)/NULLIF(SUM(Enrollments),0)
		AS DECIMAL(10,2)
	) AS CPE,
	CAST(
		SUM(Enrollments) * 100.0/NULLIF(SUM(Leads),0)
		AS DECIMAL(10,2)
	) AS Lead_to_Enrollment_Rate,
	CAST(
		SUM(Impressions) * 100.0/NULLIF(SUM(Bids),0)
		AS DECIMAL(10,2)
	) AS Win_Rate_Percent,
	CAST(
        SUM(Total_Bid_Amount)
        /NULLIF(
            SUM(Bids)
            * (
                SUM(Impressions) * 1.0
                /NULLIF(SUM(Ad_Plays), 0)
            ),
            0
        ) * 1000
        AS DECIMAL(10,2)
    ) AS Avg_Bid_CPM
FROM dbo.CampaignPerformance
WHERE Campaign = 'Veterinary Technician'
	AND Ad_Group = 'Native'
GROUP BY
	Creative,
	CASE
		WHEN Week_Number <= 9 THEN 'Pre-Decline'
		ELSE 'Decline Period'
	END
ORDER BY
	Creative,
	Campaign_Period DESC;

--Compare Native inventory by creative performance during Pre-Decline (Weeks 1–9) vs. Decline Period (Weeks 10–12)

SELECT
    Inventory_Source,
    Creative,
    CASE
        WHEN Week_Number <= 9 THEN 'Pre-Decline'
        ELSE 'Decline Period'
    END AS Campaign_Period,
    SUM(Spend) AS Total_Spend,
    CAST(
        SUM(Spend) * 100.0
        /NULLIF(
            SUM(SUM(Spend)) OVER (
                PARTITION BY
                    CASE
                        WHEN Week_Number <= 9 THEN 'Pre-Decline'
                        ELSE 'Decline Period'
                    END
            ),
            0
        )
        AS DECIMAL(10,2)
    ) AS Spend_Share_Percent,
    SUM(Leads) AS Total_Leads,
    SUM(Enrollments) AS Total_Enrollments,
    CAST(
        SUM(Spend)/NULLIF(SUM(Leads), 0)
        AS DECIMAL(10,2)
    ) AS CPL,
    CAST(
        SUM(Spend)/NULLIF(SUM(Enrollments), 0)
        AS DECIMAL(10,2)
    ) AS CPE,
    CAST(
        SUM(Enrollments) * 100.0
        /NULLIF(SUM(Leads), 0)
        AS DECIMAL(10,2)
    ) AS Lead_to_Enrollment_Rate
FROM dbo.CampaignPerformance
WHERE Campaign = 'Veterinary Technician'
    AND Ad_Group = 'Native'
GROUP BY
    Inventory_Source,
    Creative,
    CASE
        WHEN Week_Number <= 9 THEN 'Pre-Decline'
        ELSE 'Decline Period'
    END
ORDER BY
    Inventory_Source,
    Creative,
    Campaign_Period DESC;