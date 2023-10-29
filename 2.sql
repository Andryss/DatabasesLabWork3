-- Сделать запрос для получения атрибутов из указанных таблиц, применив фильтры по указанным условиям:
-- Таблицы: Н_ЛЮДИ, Н_ВЕДОМОСТИ, Н_СЕССИЯ.
-- Вывести атрибуты: Н_ЛЮДИ.ИМЯ, Н_ВЕДОМОСТИ.ДАТА, Н_СЕССИЯ.ДАТА.
-- Фильтры (AND):
-- a) Н_ЛЮДИ.ФАМИЛИЯ < Афанасьев.
-- b) Н_ВЕДОМОСТИ.ИД < 1457443.
-- Вид соединения: INNER JOIN.

SELECT
    Н_ЛЮДИ.ИМЯ, Н_ВЕДОМОСТИ.ДАТА, Н_СЕССИЯ.ДАТА
FROM
    Н_ЛЮДИ
    INNER JOIN Н_ВЕДОМОСТИ ON Н_ВЕДОМОСТИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
    INNER JOIN Н_СЕССИЯ ON Н_СЕССИЯ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
WHERE
    Н_ЛЮДИ.ФАМИЛИЯ < 'Афанасьев' AND
    Н_ВЕДОМОСТИ.ИД < 1457443;