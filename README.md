# ELT Project with dbt

Това е ELT (Extract, Load, Transform) проект, построен с dbt (data build tool) за обработка и трансформация на данни за продажби.

## Структура на проекта

```
ELT_project/
├── dbt_project.yml          # Основна конфигурация на dbt проекта
├── models/
│   └── models/
│       ├── staging/         # Staging слой - почистване и стандартизация
│       │   ├── customers_raw_table.sql
│       │   ├── sales_north_raw_table.sql
│       │   ├── staging_checks.yml
│       │   
│       ├── marts/           # Marts слой - бизнес логика
│       │   ├── dim_customers.sql
│       │   ├── fact_sales_north.sql
│       │   └── marts_checks.yml
│       └── aggregated/      # Агрегирани данни
│           ├── sales_by_region.sql
│           └── sales_summary_brand_day.sql
            ├── aggregated_checks.yml
├── macros/                  # Преизползваеми SQL макроси
│   ├── create_csv_file_format.sql
│   ├── create_json_format.sql
│   ├── load_product_metadata_raw.sql
│   ├── load_sales_north_raw.sql
│   
├── seeds/                   
├── snapshots/             
└── target/                 
```

## Архитектура на данните

### 🔧 Staging Layer
Почистване и стандартизация на raw данните:
- **customers_raw_table**: Основни данни за клиенти и продукти
- **sales_north_raw_table**: Raw данни за продажби от северния регион

### 🏪 Marts Layer
Бизнес готови таблици:
- **dim_customers**: Dimension таблица с клиентска информация
- **fact_sales_north**: Fact таблица с продажбите от северния регион

### 📊 Aggregated Layer
Агрегирани анализи:
- **sales_by_region**: Продажби по регион и категория
- **sales_summary_brand_day**: Обобщение на продажбите по брандове и дни

## Схеми в базата данни

- **STAGING**: Съдържа staging модели за почистване на данните
- **TRANSFORMED**: Съдържа marts и aggregated модели за анализи
- **AGGREGATED**: Съдържа високо агрегирани данни

## Макроси

- **load_sales_north_raw()**: Зарежда данни от S3 в sales_north_raw таблица
- **load_product_metadata_raw()**: Зарежда метаданни за продуктите
- **create_csv_file_format()**: Създава CSV формат за файловете
- **create_json_format()**: Създава JSON формат

## Data Quality тестове

Проектът включва comprehensive data quality проверки:

### Staging тестове
- Уникалност на primary keys
- Проверка за NULL стойности
- Валидация на критични полета

### Marts тестове
- Референтна цялост между fact и dimension таблици
- Бизнес правила за продажбите (позитивни стойности)
- Качество на данните за брандове и категории

## Стартиране на проекта

### Предпоставки
```bash
pip install dbt-snowflake
```

### Конфигурация
1. Настройте `~/.dbt/profiles.yml` с вашите Snowflake credentials
2. Обновете dbt_project.yml според вашата среда

### Команди
```bash
# Инсталиране на dependencies
dbt deps

# Изпълнение на всички модели
dbt run

# Изпълнение на тестовете
dbt test

# Генериране на документация
dbt docs generate
dbt docs serve
```

### Поетапно изпълнение
```bash
# Само staging модели
dbt run --select staging

# Само marts модели
dbt run --select marts

# Само конкретен модел
dbt run --select fact_sales_north
```

## Използвани технологии

- **dbt**: Data transformation framework
- **Snowflake**: Cloud data warehouse
- **SQL**: За трансформации на данните
- **YAML**: За конфигурация и тестове

## Автор

Проект за обучение по ELT процеси и data engineering с dbt.
