1.ReAdmission Rate
SELECT 
    ROUND(
        SUM(readmitted_flag)::DECIMAL / COUNT(*) * 100, 2
    ) AS readmission_rate_pct
FROM hospital_admissions;


2. Average Length of Stay
SELECT 
    ROUND(AVG(length_of_stay)::numeric, 2) AS avg_length_of_stay
FROM hospital_admissions;


3. Bed Occupancy by Department
SELECT 
    department,
    ROUND(AVG(bed_occupancy_rate)::numeric, 2) AS avg_bed_occupancy_pct
FROM hospital_admissions
GROUP BY department
ORDER BY avg_bed_occupancy_pct DESC;


4. Monthly Admissions Trend
SELECT 
    DATE_TRUNC('month', admission_date) AS month,
    COUNT(*) AS admissions
FROM hospital_admissions
GROUP BY month
ORDER BY month;


5. Readmission Rate by Department
SELECT
    department,
    ROUND(
        SUM(readmitted_flag)::DECIMAL / COUNT(*) * 100, 2
    ) AS readmission_rate_pct
FROM hospital_admissions
GROUP BY department
ORDER BY readmission_rate_pct DESC;


6. Monthly Readmission Trend
SELECT
    DATE_TRUNC('month', admission_date) AS month,
    ROUND(
        SUM(readmitted_flag)::DECIMAL / COUNT(*) * 100, 2
    ) AS readmission_rate_pct
FROM hospital_admissions
GROUP BY month
ORDER BY month;


7. High-Risk Readmission Patients (LOS > Average)
SELECT
    COUNT(*) AS high_risk_readmissions
FROM hospital_admissions
WHERE readmitted_flag = 1
AND length_of_stay >
    (SELECT AVG(length_of_stay) FROM hospital_admissions);


8. Average Length of Stay by Department
SELECT
    department,
    ROUND(AVG(length_of_stay), 2) AS avg_los
FROM hospital_admissions
GROUP BY department
ORDER BY avg_los DESC;


9. Long Stay Percentage (>7 days)
SELECT
    ROUND(
        COUNT(*) FILTER (WHERE length_of_stay > 7)::DECIMAL
        / COUNT(*) * 100, 2
    ) AS long_stay_pct
FROM hospital_admissions;


10. LOS vs Readmission Correlation Indicator
SELECT
    readmitted,
    ROUND(AVG(length_of_stay), 2) AS avg_los
FROM hospital_admissions
GROUP BY readmitted;


11. Average Bed Occupancy by Department
SELECT
    department,
    ROUND(AVG(bed_occupancy_rate)::numeric, 2) AS avg_bed_occupancy_pct
FROM hospital_admissions
GROUP BY department
ORDER BY avg_bed_occupancy_pct DESC;


12. Over-Utilization Rate (Occupancy > 85%)
SELECT
    ROUND(
        COUNT(*) FILTER (WHERE bed_occupancy_rate > 85)::DECIMAL
        / COUNT(*) * 100, 2
    ) AS over_utilization_pct
FROM hospital_admissions;


13. Under-Utilization Rate (Occupancy < 60%)
SELECT
    ROUND(
        COUNT(*) FILTER (WHERE bed_occupancy_rate < 60)::DECIMAL
        / COUNT(*) * 100, 2
    ) AS under_utilization_pct
FROM hospital_admissions;


14. Department Capacity Stress Index
SELECT
    department,
    ROUND(
        AVG(occupied_beds)::DECIMAL / AVG(total_beds) * 100, 2
    ) AS capacity_stress_index
FROM hospital_admissions
GROUP BY department;


15. Monthly Admission Volume
SELECT
    DATE_TRUNC('month', admission_date) AS month,
    COUNT(*) AS total_admissions
FROM hospital_admissions
GROUP BY month
ORDER BY month;


16. Department Admission Share (%)
SELECT
    department,
    ROUND(
        COUNT(*)::DECIMAL /
        (SELECT COUNT(*) FROM hospital_admissions) * 100, 2
    ) AS admission_share_pct
FROM hospital_admissions
GROUP BY department
ORDER BY admission_share_pct DESC;


17. Operational Efficiency Score
SELECT
    department,
    ROUND(
        (AVG(bed_occupancy_rate) / AVG(length_of_stay))::numeric, 2
    ) AS efficiency_score
FROM hospital_admissions
GROUP BY department
ORDER BY efficiency_score DESC;


18. Readmission Burden Index
SELECT
    department,
    ROUND(
        SUM(readmitted_flag)::DECIMAL * AVG(length_of_stay), 2
    ) AS readmission_burden
FROM hospital_admissions
GROUP BY department
ORDER BY readmission_burden DESC;


19. KPI SUMMARY TABLE
CREATE TABLE hospital_kpi_summary AS
SELECT
    department,
    ROUND(AVG(length_of_stay),2) AS avg_los,
    ROUND(AVG(bed_occupancy_rate)::numeric,2) AS avg_bed_occupancy,
    ROUND(SUM(readmitted_flag)::DECIMAL / COUNT(*) * 100,2) AS readmission_rate
FROM hospital_admissions
GROUP BY department;


20. Total Admissions
Select Count(admission_id)
From public.hospital_admissions

21. Readmission By Department
