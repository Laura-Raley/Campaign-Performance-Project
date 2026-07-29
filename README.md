# Campaign Performance Analysis

## Overview

This project analyzes the performance of a fictional 12-week digital advertising campaign for an education company. The objective was to identify the factors contributing to declining enrollment efficiency and provide data-driven recommendations to improve campaign performance.

Using SQL Server, I performed data validation, exploratory data analysis, diagnostic analysis, and performance investigations across campaigns, inventory sources and creatives.

## Business Problem

The marketing team noticed that campaign efficiency declined during the second half of the 12-week time period.

The objectives of this analysis were to determine:

- Which campaigns and ad groups drove the decline
- Whether inventory mix contributed to worsening performance
- Whether creative fatigue affected results
- What optimizations could improve future campaign performance

## Dataset

The dataset contains 6,624 records representing weekly advertising performance across multiple campaigns.

Fields include:

- Week Start
- Week Number
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

- Which campaigns contributed to the dip in performance?
- Which inventory sources underperformed?
- Which creatives showed signs of fatigue?
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

#### Native Inventory Analysis

Inventory analysis showed that the Native decline was driven by a combination of **inventory mix shifts and weaker source-level lead-to-enrollment conversion**. DailyNews Network and OpenWeb Media, two of the strongest enrollment performers before the decline, lost spend share and became less efficient during Weeks 10–12. Lifestyle Today also experienced a substantial decline in conversion efficiency.

Meanwhile, spend shifted toward GameSphere and Tail Aggregate. Both sources improved their CPE and lead-to-enrollment rates during the decline period, partially offsetting deterioration elsewhere. Overall, the results suggest that the Native CPE increase was driven by **changes in inventory allocation and declining conversion performance among previously strong inventory sources**.

| Inventory Source | Campaign Period | Spend Share | CPE | Lead-to-Enrollment Rate |
|:-----------------|:----------------|------------:|----:|------------------------:|
| DailyNews Network | Pre-Decline | 16.74% | $280.17 | 14.88% |
| DailyNews Network | Decline Period | 9.72% | $1,540.29 | 3.28% |
| GameSphere | Pre-Decline | 23.17% | $2,780.03 | 2.28% |
| GameSphere | Decline Period | 30.80% | $1,393.74 | 5.04% |
| Lifestyle Today | Pre-Decline | 17.83% | $802.25 | 5.97% |
| Lifestyle Today | Decline Period | 14.18% | $1,497.44 | 3.45% |
| OpenWeb Media | Pre-Decline | 18.40% | $339.61 | 13.18% |
| OpenWeb Media | Decline Period | 13.36% | $470.44 | 10.11% |
| Tail Aggregate | Pre-Decline | 23.86% | $1,227.12 | 4.90% |
| Tail Aggregate | Decline Period | 31.94% | $1,011.74 | 7.19% |

#### Native Creative Analysis

Creative performance showed that the Native decline was concentrated in **Career Change Static** and **Tuition Value Static**. Both creatives experienced sharp declines in lead-to-enrollment conversion, which drove significantly higher CPE during the decline period. Career Change Static was particularly impactful because its spend share increased slightly while CPE rose from **$632.95 to $1,912.51**.

In contrast, **Graduate Story Static remained efficient**, with CPE improving slightly and lead-to-enrollment rate increasing from 8.52% to 9.42%.

| Creative | Campaign Period | Spend Share | CPE | Lead-to-Enrollment Rate |
|:---------|:----------------|------------:|----:|------------------------:|
| Career Change Static | Pre-Decline | 34.29% | $632.95 | 8.41% |
| Career Change Static | Decline Period | 36.22% | $1,912.51 | 3.92% |
| Graduate Story Static | Pre-Decline | 32.56% | $601.10 | 8.52% |
| Graduate Story Static | Decline Period | 33.20% | $584.36 | 9.42% |
| Tuition Value Static | Pre-Decline | 33.14% | $596.51 | 8.33% |
| Tuition Value Static | Decline Period | 30.58% | $1,383.84 | 4.09% |

#### Inventory × Creative Analysis

Cross-analysis of inventory source and creative confirmed that the Native decline was driven by a combination of **source-level deterioration and creative performance**. DailyNews Network experienced weaker lead-to-enrollment conversion across all three creatives, indicating a broader decline in inventory quality. Meanwhile, Career Change Static and Tuition Value Static underperformed across multiple inventory sources.

Graduate Story Static was more resilient, including substantial improvement on GameSphere during the decline period. Overall, the results suggest that **neither inventory nor creative alone explains the decline; specific inventory-creative combinations contributed to weaker enrollment efficiency**.

### Skilled Trades Campaign

Weekly analysis showed that the Skilled Trades campaign had **very low enrollment volume, resulting in highly volatile CPE**. Weekly enrollments ranged from 0–4, making individual week-over-week CPE changes unreliable as indicators of a sustained performance shift.

However, a notable pattern emerged in the second half of the campaign. **Weeks 7–10 generated zero enrollments despite continued spend and relatively stable lead volume**. Enrollments returned in Weeks 11–12.

Rather than identifying a single decline point, the analysis suggests that Skilled Trades' higher second-half CPE was primarily associated with **inconsistent lead-to-enrollment conversion and low enrollment volume**, rather than a clear deterioration in lead-generation efficiency or media costs.

Ad-group analysis showed that **Native was the only tactic generating enrollments and was the primary driver of the campaign's higher second-half CPE**. Native spend and lead volume increased, but enrollments declined from 9 to 5, causing CPE to rise from **$4,174.55 to $10,591.88** and lead-to-enrollment rate to fall from **1.23% to 0.58%**.

CTV, OLV, and Streaming Audio generated no enrollments in either half of the campaign. Native's CPM, Win Rate, and Average Bid CPM remained relatively stable, indicating that the decline was driven more by **weaker lead-to-enrollment conversion than by worsening media costs or auction conditions**.

#### Native Inventory Analysis

Inventory analysis showed a clear **shift in spend toward GameSphere and Tail Aggregate during the second half**. Their combined spend share increased from roughly 40% to 60%, while DailyNews Network, Lifestyle Today, and OpenWeb Media lost share.

The higher-spend sources generated relatively few enrollments, while DailyNews Network—one of the stronger first-half sources—produced no enrollments in the second half. This suggests that **inventory mix contributed to the decline in Native enrollment efficiency**, although low enrollment volume makes source-level CPE highly volatile.

| Inventory Source | Campaign Period | Spend Share | CPE | Lead-to-Enrollment Rate |
|:-----------------|:----------------|------------:|----:|------------------------:|
| DailyNews Network | First Half | 19.71% | $925.79 | 4.85% |
| DailyNews Network | Second Half | 10.73% | — | 0.00% |
| GameSphere | First Half | 20.04% | — | 0.00% |
| GameSphere | Second Half | 30.82% | $16,320.22 | 0.46% |
| Lifestyle Today | First Half | 20.14% | — | 0.00% |
| Lifestyle Today | Second Half | 14.43% | $7,643.00 | 0.69% |
| OpenWeb Media | First Half | 20.08% | $7,542.91 | 0.61% |
| OpenWeb Media | Second Half | 14.92% | $7,901.41 | 0.63% |
| Tail Aggregate | First Half | 20.03% | — | 0.00% |
| Tail Aggregate | Second Half | 29.10% | $7,705.21 | 0.89% |

#### Native Creative Analysis

Creative analysis showed mixed performance across Native creatives. **Career Change Static showed the clearest deterioration**, with spend share increasing from 33.81% to 35.20% while enrollments fell from four to zero. Tuition Value Static also became less efficient, with CPE increasing from $3,207.63 to $8,593.70 and lead-to-enrollment rate declining from 1.66% to 0.66%.

In contrast, Graduate Story Static improved, with CPE declining from $12,036.00 to $5,710.93 and lead-to-enrollment rate increasing from 0.42% to 0.99%. Overall, creative performance likely contributed to the Native decline, but **low enrollment volume makes creative-level CPE highly volatile and limits the strength of the conclusions**.

| Creative | Campaign Period | Spend Share | CPE | Lead-to-Enrollment Rate |
|:---------|:----------------|------------:|----:|------------------------:|
| Career Change Static | First Half | 33.81% | $3,176.11 | 1.59% |
| Career Change Static | Second Half | 35.20% | — | 0.00% |
| Graduate Story Static | First Half | 32.04% | $12,036.00 | 0.42% |
| Graduate Story Static | Second Half | 32.35% | $5,710.93 | 0.99% |
| Tuition Value Static | First Half | 34.15% | $3,207.63 | 1.66% |
| Tuition Value Static | Second Half | 32.45% | $8,593.70 | 0.66% |

## Dashboard Preview

(We'll insert screenshots here once the Power BI dashboard is complete.)

## Final Recommendations

(We'll complete this section after finishing the analysis.)
