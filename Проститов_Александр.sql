-- 1. Создание главной таблицы «Кафедры» (с автоинкрементом)
CREATE TABLE Departments (
    department_number INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    faculty_code INT NOT NULL,
    department_name VARCHAR(150) NOT NULL,
    is_head_department BOOLEAN NOT NULL,
    website VARCHAR(100),
    phone VARCHAR(20) NOT NULL
);

-- 2. Создание зависимой таблицы «Лаборатории» (с внешним ключом и каскадом)
CREATE TABLE Laboratories (
    laboratory_number INT PRIMARY KEY,
    lab_name VARCHAR(150) NOT NULL,
    activity_type VARCHAR(200) NOT NULL,
    head_of_lab VARCHAR(100) NOT NULL,
    workstations_count INT NOT NULL,
    has_project_equipment BOOLEAN NOT NULL,
    department_number INT NOT NULL,
    FOREIGN KEY (department_number) 
        REFERENCES Departments(department_number) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

-- 3. Заполнение таблицы «Кафедры» (10 записей)
INSERT INTO Departments (faculty_code, department_name, is_head_department, website, phone) VALUES
(101, 'Вычислительная техника', TRUE, 'vt.university.ru', '+74951111111'),
(101, 'Программная инженерия', TRUE, 'pi.university.ru', '+74952222222'),
(102, 'Информационная безопасность', FALSE, 'ib.university.ru', '+74953333333'),
(103, 'Высшая математика', FALSE, 'math.university.ru', '+74954444444'),
(103, 'Физика', FALSE, 'physics.university.ru', '+74955555555'),
(104, 'Экономика и менеджмент', TRUE, 'econ.university.ru', '+74956666666'),
(104, 'Маркетинг', FALSE, 'market.university.ru', '+74957777777'),
(105, 'Иностранные языки', FALSE, 'lang.university.ru', '+74958888888'),
(102, 'Системный анализ', TRUE, 'sa.university.ru', '+74959999999'),
(101, 'Искусственный интеллект', TRUE, 'ai.university.ru', '+74950000000');

-- 4. Заполнение таблицы «Лаборатории» (10 записей)
INSERT INTO Laboratories (laboratory_number, lab_name, activity_type, head_of_lab, workstations_count, has_project_equipment, department_number) VALUES
(10, 'Лаборатория микропроцессоров', 'Аппаратное проектирование', 'Иванов И.И.', 15, TRUE, 1),
(11, 'Лаборатория веб-разработки', 'Программирование ПО', 'Петров П.П.', 20, TRUE, 2),
(12, 'Центр криптографии', 'ИБ и шифрование', 'Сидоров С.С.', 10, TRUE, 3),
(13, 'Кабинет вычислений', 'Расчетные задачи', 'Смирнова А.В.', 25, FALSE, 4),
(14, 'Лаборатория оптики', 'Физические эксперименты', 'Кузнецов Д.А.', 12, TRUE, 5),
(15, 'Бизнес-инкубатор', 'Маркетинговые исследования', 'Морозова Е.В.', 18, FALSE, 6),
(16, 'Лаборатория больших данных', 'Анализ данных', 'Васильев В.В.', 16, TRUE, 9),
(17, 'Лаборатория нейросетей', 'Искусственный интеллект', 'Федоров М.Ю.', 22, TRUE, 10),
(18, 'Лингвоцентр', 'Лингвистические исследования', 'Николаева О.П.', 14, FALSE, 8),
(19, 'Лаборатория сетей', 'Сетевые технологии', 'Григорьев А.Н.', 20, TRUE, 1);