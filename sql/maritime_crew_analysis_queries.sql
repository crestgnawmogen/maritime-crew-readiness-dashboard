
-- Maritime Crew Readiness and Deployment Analytics Dashboard
-- Company-inspired data analyst case study for a maritime manning agency

-- 1. Total crew by department
SELECT 
    department,
    COUNT(*) AS total_crew
FROM crew_data
GROUP BY department
ORDER BY total_crew DESC;


-- 2. Total crew by deployment status
SELECT 
    deployment_status,
    COUNT(*) AS total_crew
FROM crew_data
GROUP BY deployment_status
ORDER BY total_crew DESC;


-- 3. Crew readiness summary
SELECT 
    readiness_status,
    COUNT(*) AS total_crew
FROM crew_data
GROUP BY readiness_status
ORDER BY total_crew DESC;


-- 4. Document risk summary
SELECT 
    document_risk_status,
    COUNT(*) AS total_crew
FROM crew_data
GROUP BY document_risk_status
ORDER BY total_crew DESC;


-- 5. High-risk and expired documents by department
SELECT 
    department,
    COUNT(*) AS total_high_risk_crew
FROM crew_data
WHERE document_risk_status IN ('Expired', 'High Risk')
GROUP BY department
ORDER BY total_high_risk_crew DESC;


-- 6. Crew ready for deployment by department
SELECT 
    department,
    COUNT(*) AS ready_crew
FROM crew_data
WHERE readiness_status = 'Ready'
GROUP BY department
ORDER BY ready_crew DESC;


-- 7. Average years of experience by rank
SELECT 
    rank,
    ROUND(AVG(years_experience), 2) AS average_years_experience
FROM crew_data
GROUP BY rank
ORDER BY average_years_experience DESC;


-- 8. Crew with documents expiring within 30 days
SELECT 
    crew_id,
    full_name,
    rank,
    department,
    deployment_status,
    document_risk_status,
    nearest_document_expiry_days
FROM crew_data
WHERE nearest_document_expiry_days BETWEEN 0 AND 30
ORDER BY nearest_document_expiry_days ASC;


-- 9. Crew with already expired documents
SELECT 
    crew_id,
    full_name,
    rank,
    department,
    deployment_status,
    nearest_document_expiry_days
FROM crew_data
WHERE nearest_document_expiry_days < 0
ORDER BY nearest_document_expiry_days ASC;


-- 10. Average contract days remaining by department
SELECT 
    department,
    ROUND(AVG(contract_days_remaining), 2) AS average_contract_days_remaining
FROM crew_data
GROUP BY department
ORDER BY average_contract_days_remaining ASC;
