# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Роли
Role.create(:name => :admin)
Role.create(:name => :moderator)
Role.create(:name => :customer)
Role.create(:name => :executor)
# Роли end

# Города
City.create(name: "Астана")
City.create(name: "Алматы")
City.create(name: "Актобе")

# Города end

# Основные категории start
Category.create(name: "Курьерские услуги", parent_id:0)
Category.create(name: "Компьютерная помощь", parent_id:0)
Category.create(name: "Бытовой ремонт", parent_id:0)
Category.create(name: "Установка и ремонт техники", parent_id:0)
Category.create(name: "Уборка и помощь по хозяйству", parent_id:0)
Category.create(name: "Ремонт цифровой техники", parent_id:0)
Category.create(name: "Грузоперевозки", parent_id:0)
Category.create(name: "Купить и доставить", parent_id:0)
Category.create(name: "Виртуальный помощник", parent_id:0)
Category.create(name: "Мероприятия и промоакции", parent_id:0)
Category.create(name: "Фото-видео услуги", parent_id:0)
Category.create(name: "Интернет и дизайн", parent_id:0)
Category.create(name: "Красота и здоровье", parent_id:0)
Category.create(name: "Юридическая помощь", parent_id:0)
# Основные категории end

# Основные суб категории start
Category.create(name: "Пеший курьер на день", parent_id:1, price:5000)
Category.create(name: "Курьер на день с авто", parent_id:1, price:5000)
Category.create(name: "Доставка по одному адресу", parent_id:1, price:800)
Category.create(name: "Доставка по нескольким адресам", parent_id:1, price:2000)
Category.create(name: "Доставка товара покупателю", parent_id:1, price:1000)
Category.create(name: "Забрать и доставить", parent_id:1, price:1500)
Category.create(name: "Забрать заказ из типографии", parent_id:1, price:1000)
Category.create(name: "Доставить подарок", parent_id:1, price:1000)
Category.create(name: "Доставить цветы", parent_id:1, price:1000)
#
Category.create(name: "Установка операционной системы ", parent_id:2,price:2000)
Category.create(name: "Восстановление данных", parent_id:2, price:3000)
Category.create(name: "Ремонт компьютеров", parent_id:2,price:2000)
Category.create(name: "Настройка Wi-Fi роутера", parent_id:2,price:600)
Category.create(name: "Удаление вирусов", parent_id:2,price:2000)
Category.create(name: "Настройка доступа в интернет", parent_id:2,price:1000)
Category.create(name: "Консультации (обучение)", parent_id:2,price:1500)
Category.create(name: "Установка антивируса", parent_id:2, price:700)
Category.create(name: "Установка комплектующих", parent_id:2,price:850)

#
Category.create(name: "Мастер на час ", parent_id:3,price:1500)
Category.create(name: "Ремонт квартиры под ключ", parent_id:3,price:80000)
Category.create(name: "Ремонт кухни", parent_id:3,price:30000)
Category.create(name: "Ремонт ванной, туалета", parent_id:3,price:20000)
Category.create(name: "Требуется сантехник", parent_id:3,price:2000)
Category.create(name: "Установка счетчиков", parent_id:3,price:1200)
Category.create(name: "Укладка плитки", parent_id:3,price:1400)
Category.create(name: "Требуется электрик", parent_id:3,price:2000)
Category.create(name: "Ремонт мебели", parent_id:3,price:5000)
#

#
Category.create(name: "Электрическая плита", parent_id:4,price:1300)
Category.create(name: "Стиральная машина", parent_id:4,price:1400)
Category.create(name: "Посудомоечная машина", parent_id:4,price:1600)
Category.create(name: "Холодильник", parent_id:4,price:1700)
Category.create(name: "Духовой шкаф", parent_id:4,price:1900)
Category.create(name: "Варочная панель", parent_id:4,price:2000)
Category.create(name: "Телевизор", parent_id:4,price:1000)
Category.create(name: "Кондиционер", parent_id:4,price:5000)
Category.create(name: "Водонагреватель", parent_id:4,price:1750)
#
#
Category.create(name: "Убраться в квартире", parent_id:5,price:5000)
Category.create(name: "Приготовить еду", parent_id:5,price:2000)
Category.create(name: "Вымыть окна", parent_id:5,price:2000)
Category.create(name: "Погладить белье", parent_id:5,price:2000)
Category.create(name: "Чистка ковра, дивана", parent_id:5,price:4000)
Category.create(name: "Вынос вещей, мусора", parent_id:5,price:800)
Category.create(name: "Помощь при переезде", parent_id:5,price:4000)
Category.create(name: "Помощь в приготовлении еды", parent_id:5,price:1000)
Category.create(name: "Ремонт одежды", parent_id:5,price:2000)
#

#
Category.create(name: "Телефонов", parent_id:6,price:2000)
Category.create(name: "Фотоаппаратов", parent_id:6,price:3000)
Category.create(name: "Игровых приставок", parent_id:6,price:4000)
Category.create(name: "Навигаторов", parent_id:6,price:2000)
Category.create(name: "Аудиотехники", parent_id:6,price:2500)
Category.create(name: "Видеокамер", parent_id:6,price:3500)
Category.create(name: "Видеорегистраторов", parent_id:6,price:3000)
Category.create(name: "Сигнализаций", parent_id:6,price:1500)
Category.create(name: "Ресиверов", parent_id:6, price:2500)
#

#
Category.create(name: "Мебель", parent_id:7,price:2000)
Category.create(name: "Бытовая техника", parent_id:7,price:2000)
Category.create(name: "Переезд", parent_id:7,price:1500)
Category.create(name: "Пассажирские перевозки", parent_id:7,price:1400)
Category.create(name: "Строительные материалы", parent_id:7,price:1500)
Category.create(name: "Транспортировка автомобилей", parent_id:7,price:2000)
Category.create(name: "Вывоз мусора", parent_id:7,price:1500)
Category.create(name: "Требуется водитель на день", parent_id:7, price:6000)
Category.create(name: "Требуется автоинструктор", parent_id:7,price:5000)
#

#
Category.create(name: "Продукты из магазина", parent_id:8,price:800)
Category.create(name: "Продукты с рынка", parent_id:8,price:900)
Category.create(name: "Доставить еду из ресторана", parent_id:8,price:1000)
Category.create(name: "Доставить лекарства из аптеки", parent_id:8,price:1000)
Category.create(name: "Мебель из Тулпара", parent_id:8,price:2000)
Category.create(name: "Заказ из интернет-магазина", parent_id:8,price:1000)
Category.create(name: "Билеты на мероприятие", parent_id:8,price:1500)
Category.create(name: "Строительные материалы", parent_id:8,price:2000)
Category.create(name: "Корм для животных", parent_id:8,price:1000)
#

#
Category.create(name: "Поиск и сбор информации", parent_id:9,price:1500)
Category.create(name: "Обзвон по телефону", parent_id:9,price:2000)
Category.create(name: "Расшифровка аудио- и видеозаписей", parent_id:9,price:2000)
Category.create(name: "Перевод", parent_id:9,price:3000)
Category.create(name: "Поиск и заказ билетов", parent_id:9,price:1200)
Category.create(name: "Личный ассистент", parent_id:9,price:2000)
Category.create(name: "Копирайтинг", parent_id:9,price:2000)
Category.create(name: "Размещение объявлений", parent_id:9,price:5000)
Category.create(name: "Тестирование сервисов", parent_id:9,price:1000)
#

#
Category.create(name: "Промоутер", parent_id:10,price:2000)
Category.create(name: "Тамада, ведущий", parent_id:10,price:6000)
Category.create(name: "Промо-модель", parent_id:10,price:2000)
Category.create(name: "Массовка", parent_id:10,price:1000)
Category.create(name: "Помощь на мероприятии", parent_id:10,price:2000)
Category.create(name: "Тайный покупатель", parent_id:10,price:2000)
Category.create(name: "Супервайзер, хостес", parent_id:10,price:3000)
Category.create(name: "Аниматор", parent_id:10,price:2000)
Category.create(name: "Официант", parent_id:10,price:900)
#

#
Category.create(name: "Фотограф на мероприятие", parent_id:11,price:20000)
Category.create(name: "Видеооператор на мероприятие", parent_id:11,price:20000)
Category.create(name: "Обработка фотографий", parent_id:11,price:6000)
Category.create(name: "Монтаж видеоролика", parent_id:11,price:3000)
Category.create(name: "Проведение фотосессии", parent_id:11,price:3000)
Category.create(name: "Оцифровка видео, аудио, фото", parent_id:11,price:3000)
Category.create(name: "Студийная фотосъемка", parent_id:11,price:3000)
Category.create(name: "Предметная фотосъемка", parent_id:11,price:5000)
Category.create(name: "Репортажная фотосъемка", parent_id:11,price:3000)
#

#
Category.create(name: "Сайт под ключ", parent_id:12,price:20000)
Category.create(name: "Доработка сайта", parent_id:12,price:15000)
Category.create(name: "Дизайн сайтов", parent_id:12,price:20000)
Category.create(name: "Разработка логотипов", parent_id:12,price:5000)
Category.create(name: "Рисунки и иллюстрации", parent_id:12,price:3000)
Category.create(name: "Программирование", parent_id:12,price:25000)
Category.create(name: "Верстка", parent_id:12,price:10000)
Category.create(name: "Реклама в интернете", parent_id:12,price:6000)
Category.create(name: "Поддержка группы в соцсетях", parent_id:12,price:5000)
#

#
Category.create(name: "Требуется парикмахер", parent_id:13,price:900)
Category.create(name: "Требуется косметолог", parent_id:13,price:2000)
Category.create(name: "Требуется визажист", parent_id:13,price:2000)
Category.create(name: "Нужен личный тренер", parent_id:13,price:5000)
Category.create(name: "Требуется диетолог", parent_id:13,price:5000)
Category.create(name: "Нужен массажист", parent_id:13,price:3000)
Category.create(name: "Требуется мастер маникюра", parent_id:13,price:2000)
Category.create(name: "Требуется стилист", parent_id:13,price:3000)
Category.create(name: "Нужна медсестра", parent_id:13,price:2000)
#

#
Category.create(name: "Юридическая консультация", parent_id:14,price:2000)
Category.create(name: "Составление договоров", parent_id:14,price:3000)
Category.create(name: "Проверка договоров", parent_id:14,price:2500)
Category.create(name: "Оформление документов", parent_id:14,price:1500)
Category.create(name: "Регистрация фирм", parent_id:14,price:4000)
Category.create(name: "Помощь при ДТП", parent_id:14,price:6000)
Category.create(name: "Защита в суде", parent_id:14,price:20000)
Category.create(name: "Сопровождение сделок", parent_id:14,price:9000)
Category.create(name: "Составление исковых заявлений", parent_id:14,price:4000)
#

# Основные суб категории end

# Категории по пользователям start
Ecategory.create(name: "Курьерские услуги", parent_id:0)
Ecategory.create(name: "Компьютерная помощь", parent_id:0)
Ecategory.create(name: "Бытовой ремонт", parent_id:0)
Ecategory.create(name: "Установка и ремонт техники", parent_id:0)
Ecategory.create(name: "Уборка и помощь по хозяйству", parent_id:0)
Ecategory.create(name: "Ремонт цифровой техники", parent_id:0)
Ecategory.create(name: "Грузоперевозки", parent_id:0)
Ecategory.create(name: "Купить и доставить", parent_id:0)
Ecategory.create(name: "Виртуальный помощник", parent_id:0)
Ecategory.create(name: "Мероприятия и промоакции", parent_id:0)
Ecategory.create(name: "Фото-видео услуги", parent_id:0)
Ecategory.create(name: "Интернет и дизайн", parent_id:0)
Ecategory.create(name: "Красота и здоровье", parent_id:0)
Ecategory.create(name: "Юридическая помощь", parent_id:0)
# Категории по пользователям end

# subcategoty пользователи start
Ecategory.create(name:"Пешие курьеры",parent_id:1)
Ecategory.create(name:"Курьеры на авто",parent_id:1)
Ecategory.create(name:"Ремонт ПК",parent_id:2)
Ecategory.create(name:"Восстановление данных",parent_id:2)
Ecategory.create(name:"Удаление вирусов",parent_id:2)
Ecategory.create(name:"Настройка Wi-Fi",parent_id:2)
Ecategory.create(name:"Установка программ и ОС",parent_id:2)
Ecategory.create(name:"Обучение и консультации",parent_id:2)
Ecategory.create(name:"Удаленная помощь",parent_id:2)
Ecategory.create(name:"Мелкий бытовой ремонт",parent_id:3)
Ecategory.create(name:"Ремонт и сборка мебели",parent_id:3)
Ecategory.create(name:"Электрики",parent_id:3)
Ecategory.create(name:"Сантехники",parent_id:3)
Ecategory.create(name:"Комплексный ремонт квартир",parent_id:3)
Ecategory.create(name:"Ремонт дверей и окон",parent_id:3)
Ecategory.create(name:"Ремонт стен",parent_id:3)
Ecategory.create(name:"Ремонт полов",parent_id:3)
Ecategory.create(name:"Ремонт потолков",parent_id:3)
Ecategory.create(name:"Электрические (газовые) плиты",parent_id:4)
Ecategory.create(name:"Стиральные машины",parent_id:4)
Ecategory.create(name:"Кондиционеры и сплит системы",parent_id:4)
Ecategory.create(name:"Посудомоечные машины",parent_id:4)
Ecategory.create(name:"Духовки и варочные шкафы",parent_id:4)
Ecategory.create(name:"Вытяжки",parent_id:4)
Ecategory.create(name:"Водонагреватели",parent_id:4)
Ecategory.create(name:"Спутниковые тарелки",parent_id:4)
Ecategory.create(name:"Телевизоры, домашние кинотеатры",parent_id:4)
Ecategory.create(name:"Холодильники",parent_id:4)
Ecategory.create(name:"Уборка, домработницы",parent_id:5)
Ecategory.create(name:"Приготовление еды",parent_id:5)
Ecategory.create(name:"Стирка, глажка, химчистка",parent_id:5)
Ecategory.create(name:"Аудио-техника",parent_id:6)
Ecategory.create(name:"Фото и видео техника",parent_id:6)
Ecategory.create(name:"Системы безопасности",parent_id:6)
Ecategory.create(name:"Телефоны",parent_id:6)
Ecategory.create(name:"Игровые консоли",parent_id:6)
Ecategory.create(name:"Автотехника",parent_id:6)
Ecategory.create(name:"Перевозка грузов",parent_id:7)
Ecategory.create(name:"Водители",parent_id:7)
Ecategory.create(name:"Автоинструкторы",parent_id:7)
Ecategory.create(name:"Помощь при переезде",parent_id:7)
Ecategory.create(name:"Купить и доставить",parent_id:8)
Ecategory.create(name:"Поиск информации",parent_id:9)
Ecategory.create(name:"Обзвоны по телефону",parent_id:9)
Ecategory.create(name:"Копирайтинг, переводы",parent_id:9)
Ecategory.create(name:"Размещение объявлений",parent_id:9)
Ecategory.create(name:"Тестирование сервисов",parent_id:9)
Ecategory.create(name:"Консьерж услуги",parent_id:9)
Ecategory.create(name:"Промоутеры",parent_id:10)
Ecategory.create(name:"Модели",parent_id:10)
Ecategory.create(name:"Массовка",parent_id:10)
Ecategory.create(name:"Помощь на мероприятиях",parent_id:10)
Ecategory.create(name:"Тайные покупатели",parent_id:10)
Ecategory.create(name:"Фотографы",parent_id:11)
Ecategory.create(name:"Видео-операторы",parent_id:11)
Ecategory.create(name:"Обработка и редактирование фото",parent_id:11)
Ecategory.create(name:"Обработка и монтаж видео",parent_id:11)
Ecategory.create(name:"Дизайн",parent_id:12)
Ecategory.create(name:"Вёрстка и программирование",parent_id:12)
Ecategory.create(name:"Социальные сети",parent_id:12)
Ecategory.create(name:"Поисковая оптимизация",parent_id:12)
Ecategory.create(name:"Обучение и консультации",parent_id:12)
Ecategory.create(name:"Парикмахерские услуги",parent_id:13)
Ecategory.create(name:"Массажисты",parent_id:13)
Ecategory.create(name:"Маникюр, педикюр, наращивание ногтей",parent_id:13)
Ecategory.create(name:"Наращивание ресниц",parent_id:13)
Ecategory.create(name:"Наращивание волос",parent_id:13)
Ecategory.create(name:"Косметология, макияж",parent_id:13)
Ecategory.create(name:"Тату, пирсинг, боди-арт",parent_id:13)
Ecategory.create(name:"Личные тренеры",parent_id:13)
Ecategory.create(name:"Юридическая помощь",parent_id:14)
# subcategoty пользователи end