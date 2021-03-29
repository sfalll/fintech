WITH jan_perc (quest_rk, Success) AS (
    SELECT quest_rk, SUM(game_flg) / CAST(COUNT(game_flg) AS float8)
    FROM game
    WHERE EXTRACT(MONTH FROM game_dttm) = 1
    GROUP BY quest_rk
),

feb_perc (quest_rk, Success) AS (
    SELECT quest_rk, SUM(game_flg) / CAST(COUNT(game_flg) AS float8)
    FROM game
    WHERE EXTRACT(MONTH FROM game_dttm) = 2
    GROUP BY quest_rk
)

SELECT quest_nm
FROM
    feb_perc AS fp
    INNER JOIN jan_perc AS jp USING (quest_rk)
    INNER JOIN quest AS q USING (quest_rk)
ORDER BY ABS(jp.Success - fp.Success) DESC, quest_rk DESC
LIMIT 1;