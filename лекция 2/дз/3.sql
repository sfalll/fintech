WITH jan_perc (quest_rk, Success) AS (
    SELECT quest_rk, SUM(game_flg) / CAST(COUNT(game_flg) AS float8)
    FROM
        game
        INNER JOIN calendar ON calendar.calendar_dt = game.game_dttm
    WHERE month_nm = 'January'
    GROUP BY quest_rk
),

feb_perc (quest_rk, Success) AS (
    SELECT quest_rk, SUM(game_flg) / CAST(COUNT(game_flg) AS float8)
    FROM
        game
        INNER JOIN calendar ON calendar.calendar_dt = game.game_dttm
    WHERE month_nm = 'February'
    GROUP BY quest_rk
)

SELECT quest_nm, ABS(jp.Success - fp.Success) AS Разность
FROM
    feb_perc as fp
    INNER JOIN jan_perc AS jp USING (quest_rk)
    INNER JOIN quest AS q USING (quest_rk)
ORDER BY 2 DESC, quest_rk DESC
LIMIT 1;
