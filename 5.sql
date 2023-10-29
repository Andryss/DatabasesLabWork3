-- Выведите таблицу со средними оценками студентов группы 4100 (Номер, ФИО, Ср_оценка),
-- у которых средняя оценка больше средней оценк(е|и) в группе 1101.

SELECT
    Н_ЛЮДИ.ИД AS "Номер",
    (Н_ЛЮДИ.ФАМИЛИЯ || ' ' || Н_ЛЮДИ.ИМЯ || ' ' || Н_ЛЮДИ.ОТЧЕСТВО) AS "ФИО",
    AVG(Н_ВЕДОМОСТИ.ОЦЕНКА::int) AS "Ср_оценка"
FROM
    Н_УЧЕНИКИ
    JOIN Н_ЛЮДИ ON Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
    JOIN Н_ВЕДОМОСТИ ON Н_ВЕДОМОСТИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
WHERE
    Н_УЧЕНИКИ.ГРУППА = '4100' AND
    Н_ВЕДОМОСТИ.ОЦЕНКА IN ('2', '3', '4', '5') AND
    Н_ВЕДОМОСТИ.СОСТОЯНИЕ = 'актуальна'
GROUP BY
    Н_ЛЮДИ.ИД, Н_ЛЮДИ.ФАМИЛИЯ, Н_ЛЮДИ.ИМЯ, Н_ЛЮДИ.ОТЧЕСТВО
HAVING
    AVG(Н_ВЕДОМОСТИ.ОЦЕНКА::int) > ( -- средняя оценка в группе 1101
        SELECT
            AVG(Н_ВЕДОМОСТИ.ОЦЕНКА::int)
        FROM
            Н_УЧЕНИКИ
            JOIN Н_ЛЮДИ ON Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
            JOIN Н_ВЕДОМОСТИ ON Н_ВЕДОМОСТИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
        WHERE
            Н_УЧЕНИКИ.ГРУППА = '1101' AND
            Н_ВЕДОМОСТИ.ОЦЕНКА IN ('2', '3', '4', '5')
    )
ORDER BY
    "ФИО";