# Используем официальный образ Python
FROM python:3.10-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Устанавливаем зависимости
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Копируем проект
COPY . .

# Собираем статические файлы
RUN python manage.py collectstatic --noinput

# Указываем команду для запуска приложения
CMD ["gunicorn", "geodesy_project.wsgi:application", "--bind", "0.0.0.0:8000"]