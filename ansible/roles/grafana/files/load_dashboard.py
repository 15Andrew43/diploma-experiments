import requests
import json

server = "http://localhost:3000"
username = "admin"  # Замените на ваше имя пользователя
password = "mysecretpassword"  # Замените на ваш пароль

url = f"{server}/api/dashboards/db"

# Указать путь и имя JSON-файла с данными дашборда
file_path = "/var/lib/grafana/dashboards/mypanel.json"

with open(file_path, "r") as file:
    dashboard_data = json.load(file)

headers = {
    "Content-Type": "application/json"
}

response = requests.post(url=url, auth=(
    username, password), json=dashboard_data, headers=headers, verify=False)

# Проверка статуса ответа
if response.status_code == 200:
    print("Дашборд успешно создан!")
else:
    print("Произошла ошибка при создании дашборда:", response.text)
