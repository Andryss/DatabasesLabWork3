-- Найти группы, в которых в 2011 году было более 10 обучающихся студентов на кафедре вычислительной техники.
-- Для реализации использовать подзапрос.

-- идея:
-- берем только учеников на ВТ за 2011 год и делаем маппинг на людей
-- группируем по группам, для каждой считаем уникальных людей
SELECT
    Н_УЧЕНИКИ.ГРУППА as "Более 10 ВТшников за 2011"
FROM
    Н_УЧЕНИКИ
    JOIN Н_ЛЮДИ ON Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
WHERE
    Н_УЧЕНИКИ.ИД IN ( -- все Н_УЧЕНИКИ.ИД на кафедре ВТ
        SELECT
            Н_УЧЕНИКИ.ИД
        FROM
            Н_УЧЕНИКИ
            JOIN Н_ПЛАНЫ ON Н_УЧЕНИКИ.ПЛАН_ИД = Н_ПЛАНЫ.ИД
            JOIN Н_ОТДЕЛЫ ON Н_ПЛАНЫ.ОТД_ИД_ЗАКРЕПЛЕН_ЗА = Н_ОТДЕЛЫ.ИД
        WHERE
            Н_ОТДЕЛЫ.КОРОТКОЕ_ИМЯ = 'ВТ'
    ) AND
    ( -- только за 2011 год
        (
            Н_УЧЕНИКИ.НАЧАЛО >= '2011-01-01 00:00:00' AND
            Н_УЧЕНИКИ.НАЧАЛО < '2012-01-01 00:00:00'
        ) OR (
            Н_УЧЕНИКИ.КОНЕЦ >= '2011-01-01 00:00:00' AND
            Н_УЧЕНИКИ.КОНЕЦ < '2012-01-01 00:00:00'
        )
    ) AND
    Н_УЧЕНИКИ.СОСТОЯНИЕ = 'утвержден'
GROUP BY
    Н_УЧЕНИКИ.ГРУППА
HAVING
    COUNT(DISTINCT(Н_ЛЮДИ.ИД)) > 10;