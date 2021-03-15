SELECT COUNT(DISTINCT partner_rk) AS Количество
FROM
	msu_analytics.partner AS pa
	LEFT JOIN msu_analytics.location AS l USING(partner_rk)
	INNER JOIN msu_analytics.legend AS le USING(partner_rk)
	INNER JOIN msu_analytics.quest AS q USING(legend_rk)
WHERE l.location_rk IS NULL;