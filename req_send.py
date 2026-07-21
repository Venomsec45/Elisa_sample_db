import requests
import random
import sys
import time
from rich import print as show
from sample_datas.diagnosis import diagnosis_lists
from sample_datas.lab import lab_lists
from sample_datas.first_names import first_name
from sample_datas.last_names import last_name
from sample_datas.country_id import country_id_identification
from datetime import datetime

def admission_input(patient_id: int, doctor_id: int, payment_id: int, medicine_id: int, country_id: str, 
              admission_date: str, release_date: str, diagnosis: str, urgency_rate: int):
    
    u = "http://127.0.0.1:8000/admission/insert"
    r = requests.post(url=u, params={"patient_id": patient_id, "doctor_id": doctor_id, "payment_id": payment_id, "medicine_id": medicine_id, "country_id": country_id, "admission_date": admission_date, "release_date": release_date, "diagnosis": diagnosis, "urgency_rate": urgency_rate})
    if r.status_code in (200, 201, 202, 204):
        show(f"[[blue]{datetime.now().strftime("%m/%d/%Y_%H-%M-%S")}[/blue] [green]{r.status_code}[/green]] - {r.text}")

    elif r.status_code in (400, 401, 403, 404, 408, 429):
        show(f"[[blue]{datetime.now().strftime("%m/%d/%Y_%H-%M-%S")}[blue] [red]{r.status_code}[/red]] - {r.text}")

def patients_input(patient_id: int, first_name: str, last_name: str, email: str, age: int, 
             birthday: str, contact_number: int, status: str, temperature: float, laboratory_test: str):
    
    u = "http://127.0.0.1:8000/patients/insert"
    r = requests.post(url=u, params={"patient_id": patient_id, "first_name": first_name, "last_name": last_name, "email": email, "age": age, "birthday": birthday, "contact_number": contact_number, "status": status, "temperature": temperature, "laboratory_test": laboratory_test})
    if r.status_code in (200, 201, 202, 204):
        show(f"[[blue]{datetime.now().strftime("%m/%d/%Y_%H-%M-%S")}[/blue] [green]{r.status_code}[/green]] - {r.text}")

    elif r.status_code in (400, 401, 403, 404, 408, 429):
        show(f"[[blue]{datetime.now().strftime("%m/%d/%Y_%H-%M-%S")}[/blue] [red]{r.status_code}[/red]] - {r.text}")

def payment_input(payment_id: int, amount: int, payment_method: str, paid_date: str):
    
    u = "http://127.0.0.1:8000/payment/insert"
    r = requests.post(url=u, params={"payment_id": payment_id, "amount": amount, "payment_method": payment_method, "paid_date": paid_date})
    if r.status_code in (200, 201, 202, 204):
        show(f"[[blue]{datetime.now().strftime("%m/%d/%Y_%H-%M-%S")}[/blue] [green]{r.status_code}[/green]] - {r.text}")

    elif r.status_code in (400, 401, 403, 404, 408, 429):
        show(f"[[blue]{datetime.now().strftime("%m/%d/%Y_%H-%M-%S")}[/blue] [red]{r.status_code}[/red]] - {r.text}")

# For removing a patient
def remove_patient():
    u1 = "http://127.0.0.1:8000/patients/total_num_fetch"
    r = requests.get(url=u1)
    u2 = f"http://127.0.0.1:8000/patients/remove/{random.randint(1, int(r.text))}"
    r2 = requests.delete(url=u2)
    if r.status_code in (200, 201, 202, 204):
        show(f"[[blue]{datetime.now().strftime("%m/%d/%Y_%H-%M-%S")}[/blue] [green]{r2.status_code}[/green]] - [blue]{r2.text}[/blue]")

    elif r.status_code in (400, 401, 403, 404, 408, 429):
        show(f"[[blue]{datetime.now().strftime("%m/%d/%Y_%H-%M-%S")}[/blue] [red]{r2.status_code}[/red]] - {r2.text}")

def insert_data():
    # For admissions
    first_name_generate = first_name()

    last_name_generate = last_name()

    patient_id_generate = 1
    payment_id_generate = 1001
    country_id_generate = country_id_identification()

    diagnosis_generate = diagnosis_lists() 

    lab_tests = lab_lists()
    
    while True:
        try:
            time.sleep(random.randint(1, 20))
            admission_input(patient_id_generate, random.randint(1, 16), payment_id_generate, random.randint(1, 100), random.choice(country_id_generate), f"{random.randint(1, 7)}/{random.randint(1, 29)}/2025", f"{random.randint(8, 12)}/{random.randint(1, 29)}/2025", random.choice(diagnosis_generate), random.randint(1, 5))
            patients_input(patient_id_generate, random.choice(first_name_generate), random.choice(last_name_generate), f"{random.choice(first_name_generate)}@{random.choice(["gmail.com", "outlook.com", "yahoo.com"])}", random.randint(30, 78), f"{random.randint(1, 12)}/{random.randint(1, 29)}/{random.randint(1980, 2018)}", random.randint(3101010101, 9990000000), random.choice(["Waiting", "In admission", "Released", "Cancelled"]), random.uniform(35.0, 39.8), random.choice(lab_tests))
            payment_input(payment_id_generate, random.randint(50, 900), random.choice(["Onsite payment", "Online payment"]), f"{random.randint(8, 12)}/{random.randint(1, 29)}/2025")
            patient_id_generate += 1
            payment_id_generate += 1
            if random.randint(1, 500) == 58:
                remove_patient()

        except KeyboardInterrupt:
            show("\n[red]Script stopped...[/red]")
            sys.exit(2)

insert_data()