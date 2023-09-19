# Airport-DB-MySQL
Author: Kakhnouski Eugene, 153503

- [Description](#description)
- [Infological model](#infological-model)
- [Functional requirements](#functional-requirements)
- [Datalogical model](#datalogical-model)

## Description 
About Repository with laboratory works on the discipline DM-DMS (Data Models and Database Management Systems) (BSUIR, 5th semester)

## Infological model
> <b>Инфологическая модель базы данных</b> - это высокоуровневое абстрактное представление структуры и отношений данных в базе данных без учета конкретных деталей реализации, таких как схема хранения данных или физическая структура таблиц.
> <p id='FK'><b>Foreign Key</b> - это структурный элемент в реляционной базе данных, который устанавливает связь между двумя таблицами.</p>

### Таблицы:
1. <b>Пользователь</b> (User) - таблица, описывающая данные для входа в аккаунт пользователя. 
    
    1.1 <b>Поля</b>:
    - Логин
    - Пароль
    - Электронная почта
    - Роль
    - Время создания аккаунта
    - Время последнего входа в аккаунт


2. <b>Паспорт</b> (Passport) - таблица, описывающая личные данные пользователя.
    
    2.1 <b>Поля</b>:
    - ФИО
    - День рождения
    - Гендер
    - Национальность
    - Код страны
    - Номер паспорта
    - Идентификационный номер
    - Дата выдачи
    - Дата истечения срока годности
    
    2.2 <b>Связи</b>: 
    - OneToOne с таблицей пользователя (User)


3. <b>Рейс</b> (Flight) - таблица, описывающая данные о рейсе.
    
    3.1 <b>Поля</b>:
    - Номер рейса
    - Аэропорт прилета ([FK](#FK))
    - Аэропорт вылета ([FK](#FK))
    - Самолет ([FK](#FK))
    - Авиакомпания ([FK](#FK))
    
    3.2 <b>Связи</b>: 
    - OneToMany с таблицей аэропортов (Airport)
    - OneToMany с таблицей самолетов (Plane)
    - OneToMany с таблицей авиакомпаний (Airline)


4. <b>Билет</b> (Ticket) - таблица, описывающая данные билета. Через таблицу Ticket осуществляется наличие связи ManyToMany между User и Flight.
    
    4.1 <b>Поля</b>:
    - Номер билета
    - Место ([FK](#FK))
    - Пользователь ([FK](#FK))
    - Рейс ([FK](#FK))
    - Класс билета ([FK](#FK))
    - Дата бронирования
    
    4.2 <b>Связи</b>: 
    - OneToMany с таблицей пользователей (User)
    - OneToMany с таблицей классов места (SeatClass)
    - OneToMany с таблицей рейсов (Flight)


5. <b>Расписание</b> (Schedule) - таблица, описывающая данные расписания.
    
    5.1 <b>Поля</b>:
    - Ожидаемая временная метка отправления 
    - Ожидаемая временная метка прибытия
    - Реальная временная метка прибытия
    - Реальная временная метка прибытия
    - Рейс ([FK](#FK))
    
    5.2 <b>Связи</b>: 
    - OneToOne с таблицей рейсов (Flight)


6. <b>Самолет</b> (Plane) - таблица, описывающая данные о самолете.
    
    6.1 <b>Поля</b>:
    - Модель
    - Вместимость
    - Регистрационный номер


7. <b>Аэропорт</b> (Airport) - таблица, описывающая данные об аэропорте.
    
    7.1 <b>Поля</b>:
    - Название
    - Код 
    - Город ([FK](#FK))
    
    7.2 <b>Связи</b>: 
    - OneToMany с таблицей городов (Flight)


8. <b>Авиакомпания</b> (Airline) - таблица, описывающая данные об авиакомпании.
    
    8.1 <b>Поля</b>:
    - Название
    - Описание
    - Страна ([FK](#FK))
    
    8.2 <b>Связи</b>: 
    - OneToMany с таблицей стран (Country)


9. <b>Класс места</b> (SeatClass) - таблица, описывающая данные классе места.
    
    9.1 <b>Поля</b>:
    - Название


10. <b>Багаж</b> (Baggage) - таблица, описывающая данные о багаже.
    
    10.1 <b>Поля</b>:
    - Вес
    - Билет ([FK](#FK))

        
    10.2 <b>Связи</b>: 
    - OneToMany с таблицей билетов (Ticket)


11. <b>Страна</b> (Country) - таблица, описывающая данные о стране.
    
    11.1 <b>Поля</b>:
    - Название


12. <b>Город</b> (City) - таблица, описывающая данные о городе.
    
    12.1 <b>Поля</b>:
    - Название
    - Страна ([FK](#FK))

    12.2 <b>Связи</b>: 
    - OneToMany с таблицей стран (Country)


13. <b>Журнал</b> (log) - таблица, описывающая данные о действиях пользователя.
    
    13.1 <b>Поля</b>:
    - Название события 
    - Описание события
    - Время события 
    - Пользователь ([FK](#FK))

    13.2 <b>Связи</b>: 
    - OneToMany с таблицей пользователей (User)

14. <b>Место</b> (Seat) - таблица, описывающая данные о местах.
    
    14.1 <b>Поля</b>:
    - Номер
    - Ряд
    - Самолет ([FK](#FK))
    - Класс места ([FK](#FK))

    14.2 <b>Связи</b>: 
    - OneToMany с таблицей классов места (SeatClass)
    - OneToMany с таблицей самолета (Plane)


## Functional requirements
> <b>Функциональные требования проекта</b> - это описание того, как должен работать проект и какие функции и операции в нем должны присутствовать.

><p id="CRUD"><b>CRUD</b> (Create/Read/Update/Delete) - это операции создания/чтения/обновления/удаления информации.</p>

#### Гость:
- Аунтефикация
- Авторизация
- Создание аккаунта
- Поиск доступных рейсов с фильтрацией по различным параметрам
- Чтение различного рода информации (расписание, рейсы, билеты, список авиакомпаний, аэропорты)

#### Пользователь:
- Функции [гостя](#гость)
- [CRUD](#CRUD) операции с паспортными данными
- Бронирование билетов
- Отмена бронирования билета

#### Сотрудник:
- Функции [пользователя](#пользователь)
- [CRUD](#CRUD) оперции с различными моделями: 
    - Пользователи
    - Рейсы
    - Расписания
    - Билеты
    - Багаж
    - Питание на борту
    - Класс билета
    - Авиакомпании
    - Аэропорты

#### Администратор:
- Функции [сотрудника](#сотрудник)
- [CRUD](#CRUD) оперции с различными моделями: 
    - Сотрудники
- Назначение ролей для пользователей


## Datalogical model