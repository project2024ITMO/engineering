# Проект
Данный репозиторий создан для аттестации по предмету "Инжиниринг управления данными". 
Наш проект - создание функционального напитка на основе экстрактов цветков спиреи с повышенными антиоксидантными свойствами.
Над проектом работали:

Пригодина Мария Вадимовна

Шульгин Марк Владимирович

Климова Ирина Александровна
____________________________
В рамках проекта был создана Яндекс-форма для опроса целевой аудитории. Цель опроса - выявление потребности в продукте и готовности ЦА покупать предлагаемый продукт. 
Всего в опросе приняли участие 112 человек. Сбор данных происходил вручную, скачиванием JSON файла с данными опроса.
В репозитории, помимо данного файла, содержится файл JSON с необработанными данными, а также скрипты Python и запросы SQL.

База данных расположена на стороннем сервере, куда идет подключение через специально созданного пользователя func. Подключение к базе данных происходит при помощи программы Navicat, там же мы отслеживаем наполнение базы данных и выполнение скриптов.
База данных - реляционная база данных PostgreSQL. 
____________________________
БИЗНЕС-ПРАВИЛА

- Ответ должен содержать хотя бы два символа (да-нет, например)
- При ответе на  вопрос №2 "Придерживаетесь ли Вы ЗОЖ" Да должна быть заполнен блок №3 
- При ответе Нет - заполнен блок №4
- Дополнительное исследование в приложении, там удалены анкеты,являющиеся наиболее незначительными для дальнейшего анализа

____________________________

В рамках проекта были выполнены следующие шаги:

1.	Определение области проекта

Маркетинг - определение целевой группы покупателей разрабатываемого функ. напитка путем анкетирования через опрос

2. Сбор данных

Источники данных - Яндекс-опрос. Данные получаются различными вариантами:
- закачка на Я-диск, скачивание оттуда
- скачивание со странички созданного опроса в профиле в формате .xlsx или .json (нами выбран) 
- при соответствующих настройках в профиле получение на почту

3. Очистка данных

Я-опрос возвращает достаточно структурированные данные.

В обработку входит:
- открытие и разбор локального json-файла запуском Python-скрипта
- размещение данных из него в ленд-таблицу, "приземление" данных
- корректировка вопросов, недостаточно сформулированных, с непонятным отношением к группе вопросов
- разбиение тектстового описания вопроса на поле №группы вопросов, № подгруппы - варианта ответов на вопрос,
- отделение описания вариантов ответа на вопрос от текста самого вопроса
- визуальная оценка полученных данных и зачистка ответов, не относящихся к корректным (ответы длиной менее 2 символов считаются недействительными и зачищаются на NULL)
- применение бизнес-правила (в данном опросе выбираются только ответы людей, относящих себя к группе 18–24  года)

4. Предобработка данных

- данные, содержащиеся в таблице-источнике анализа (целевой таблице), достаточно структурированы для анализа
- принято решение не выделять справочники, так как данные в полях однотипны, содержат конечное количество значений и готовы для конечной визуализации и аналитики
- при несомненной избыточности данных с практической точки зрения нет смысла выделять группы вопросов в отдельные таблицы
- в случае предоставления пользователю-опрашиваемому возможности самостоятельно вписывать ответы на вопросы, данным веры меньше, и их пришлось бы очищать
- вся предобработка делается запуском из Python-скрипта хранимых процедур на БД

5. Разметка данных

Данные не кластеризуются. Разделением наших данных будет являться группа вопросов, выделенная в отдельное поле.

6. Интеграция данных

Происходит в момент загрузки данных из json-файла в БД. Предполагается очистка таблицы, затем новая загрузка целиком из файла. Вариант, при котором загружаются только не полученные с прошлого раза анкеты, возможен на основе ID анкеты, получаемого из Яндекс-опроса (не используется)

7. Хранение данных

Выбрана реляционная БД PostgreSQL 12.22
В БД созданы 2 таблицы
 а) таблица form_land, содержащая строки, получаемые из json-файла, исходник
 б) таблица form_data, содержащая строки ответов, преобразованных вопросов с ответами

8. Анализ данных и визуализация
Визуализация выполняется с помощью Apache Superset
Составлен дашборд с чартами, содержащими информацию по группам вопросов, общими итогами и т.д.

