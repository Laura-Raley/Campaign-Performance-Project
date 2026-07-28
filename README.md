# Campaign Performance Analysis

## Overview

This project analyzes the performance of a fictional 12-week digital advertising campaign for an education company. The objective was to identify the factors contributing to declining enrollment efficiency and provide data-driven recommendations to improve campaign performance.

Using SQL Server, I performed data validation, exploratory data analysis, KPI analysis, and performance investigations across campaigns, inventory sources, creatives, and devices.

## Business Problem

The marketing team noticed that campaign efficiency declined for some campaigns during the second half of the 12-week time period.

The objectives of this analysis were to determine:

- Which campaigns and ad groups drove the decline
- Whether inventory mix contributed to worsening performance
- Whether creative fatigue affected results
- What optimizations could improve future campaign performance

## Dataset

The dataset contains 6,624 records representing weekly advertising performance across multiple campaigns.

Fields include:
- Campaign
- Ad Group
- Inventory Source
- Creative
- Device Type
- Spend
- Impressions
- Clicks
- Leads
- Enrollments
- Bids
- Total Bid Amount
- Ad Plays


## Tools Used

- SQL Server
- Power BI

## Analysis Process

1. Data quality validation
2. Exploratory data analysis
3. Weekly performance trends
4. Ad group analysis
5. Inventory source analysis
6. Creative performance analysis
7. Final recommendations

## Key Questions Answered

- Which campaigns generated the highest enrollment volume?
- Which campaigns were the most cost efficient?
- Which inventory sources underperformed?
- Which creatives showed signs of fatigue?
- How did performance change over the 12-week campaign?
- What recommendations would improve future performance?

## Exploratory Data Analysis

The initial analysis focused on evaluating overall campaign performance across a 12-week period. Key performance indicators (KPIs) including Spend, Impressions, Clicks, Leads, Enrollments, CPM, CTR, CPL, CPE, Win Rate, and Average Bid CPM were calculated to establish baseline performance.

To identify meaningful changes over time, the dataset was divided into two six-week periods:

First Half (Weeks 1–6)  
Second Half (Weeks 7–12)

Comparing campaign performance between these periods revealed that:

| Campaign | First Half CPE | Second Half CPE | Trend |
|----------|---------------:|----------------:|-------|
| Healthcare Training | $869.66 | $708.77 | Improved |
| High School Diploma | $1,308.66 | $1,094.52 | Improved |
| Skilled Trades | $11,984.47 | $24,661.19 | Declined |
| Veterinary Technician | $1,544.10 | $1,800.16 | Declined |

While Healthcare Training and High School Diploma became more efficient, Skilled Trades and Veterinary Technician experienced higher Cost per Enrollment (CPE) during the second half of the campaign. These findings established the focus for the next phase of the analysis.

## Diagnostic Data Analysis

### Veterinary Technician Campaign

Weekly performance analysis identified **Week 10 as the beginning of a sustained decline in enrollment efficiency**. CPE increased from $1,379.01 in Week 9 to $2,950.47 in Week 10 and remained elevated through Week 12.

The decline was primarily associated with weaker lead-to-enrollment conversion rather than a significant deterioration in media delivery or auction conditions. Leads remained relatively stable, while the lead-to-enrollment rate fell from 5.61% in Week 9 to 2.71% in Week 10. CPM, CTR, Win Rate, and Average Bid CPM remained comparatively stable during this period.

Ad group analysis showed that **Native was the primary enrollment-driving tactic and experienced a meaningful decline in efficiency**. During the decline period (Weeks 10-12):

- Native CPE increased from $610.07 to $1,021.95
- Native lead-to-enrollment rate declined from 8.42% to 6.02%
- Native CPL increased more moderately from $51.35 to $61.52
- Native Blog generated no enrollments during the decline period, compared with eight prior to the decline

CTV and OLV generated no enrollments in either period and therefore were not the primary cause of the Week 10 performance shift.

The next stage of analysis investigates Native inventory sources to determine whether changes in inventory mix or source-level performance contributed to the decline.

## Dashboard Preview

(We'll insert screenshots here once the Power BI dashboard is complete.)

## Final Recommendations

(We'll complete this section after finishing the analysis.)
