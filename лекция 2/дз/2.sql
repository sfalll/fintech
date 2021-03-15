SELECT AVG(g.time) AS Время, p.partner_nm AS Партнер
FROM
    msu_analytics.quest AS q
    INNER JOIN msu_analytics.location AS l USING (location_rk)
    INNER JOIN msu_analytics.partner AS p USING (partner_rk)
    INNER JOIN msu_analytics.game AS g USING(quest_rk)
    INNER JOIN msu_analytics.employee AS e USING(employee_rk)
WHERE e.gender_cd = 'f'
GROUP BY p.partner_nm
ORDER BY 1, 2
LIMIT 1