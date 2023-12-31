# DatabasesLabWork3

## Assignment

Составить запросы на языке SQL (пункты 1-7).

1. Сделать запрос для получения атрибутов из указанных таблиц, применив фильтры по указанным условиям:
Н_ТИПЫ_ВЕДОМОСТЕЙ, Н_ВЕДОМОСТИ.
Вывести атрибуты: Н_ТИПЫ_ВЕДОМОСТЕЙ.ИД, Н_ВЕДОМОСТИ.ДАТА.
Фильтры (AND):
a) Н_ТИПЫ_ВЕДОМОСТЕЙ.ИД < 2.
b) Н_ВЕДОМОСТИ.ИД > 1457443.
c) Н_ВЕДОМОСТИ.ИД < 1250972.
Вид соединения: INNER JOIN.

2. Сделать запрос для получения атрибутов из указанных таблиц, применив фильтры по указанным условиям:
Таблицы: Н_ЛЮДИ, Н_ВЕДОМОСТИ, Н_СЕССИЯ.
Вывести атрибуты: Н_ЛЮДИ.ИМЯ, Н_ВЕДОМОСТИ.ДАТА, Н_СЕССИЯ.ДАТА.
Фильтры (AND):
a) Н_ЛЮДИ.ФАМИЛИЯ < Афанасьев.
b) Н_ВЕДОМОСТИ.ИД < 1457443.
Вид соединения: INNER JOIN.

3. Составить запрос, который ответит на вопрос, есть ли среди студентов вечерней формы обучения люди без ИНН.

4. Найти группы, в которых в 2011 году было более 10 обучающихся студентов на кафедре вычислительной техники.
Для реализации использовать подзапрос.

5. Выведите таблицу со средними оценками студентов группы 4100 (Номер, ФИО, Ср_оценка), у которых средняя оценка больше средней оценк(е|и) в группе 1101.

6. Получить список студентов, зачисленных до первого сентября 2012 года на первый курс заочной формы обучения (специальность: Программная инженерия). В результат включить:
номер группы;
номер, фамилию, имя и отчество студента;
номер и состояние пункта приказа;
Для реализации использовать подзапрос с EXISTS.

7. Вывести список студентов, имеющих одинаковые имена, но не совпадающие даты рождения.


## Scripts

[1.sql](./1.sql)

[2.sql](./2.sql)

[3.sql](./3.sql)

[4.sql](./4.sql)

[5.sql](./5.sql)

[6.sql](./6.sql)

[7.sql](./7.sql)


## Usage

Usage for PostgreSQL with psql util:

```shell
psql -h $PG_HOST -d $PG_DATABASE -c '\i ${number}.sql'
```