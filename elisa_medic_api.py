from fastapi import FastAPI, Body
import mysql.connector
# import argparse
# import uvicorn

# def commands():
#     parser = argparse.ArgumentParser()
#     parser.add_argument("--host", required=True)
#     parser.add_argument("--username", required=True)
#     parser.add_argument("--return {"error": f"---->{e}<----"}word", required=True)
#     parser.add_argument("--database", required=True)
#     return parser

# args = commands().parse_args()

db = mysql.connector.connect(
    host="localhost",
    username="root",
    password="pass123",
    database="Elisa_db_backup"
)

app = FastAPI()

# For fetching data
 # To make the database save changes

# get requests
@app.get("/patients/fetch")
def patients():
    try:
        cursor = db.cursor(dictionary=True) 
        query = "SELECT * FROM patients"
        cursor.execute(query)
        patient_data = cursor.fetchall()
        if patient_data:
            return patient_data
        
        return {"message": "There are no patients"}
    
    except Exception as e:
        return {"error": f"---->{e}<----"}

@app.get("/doctors/fetch")
def doctors():
    try:
        cursor = db.cursor(dictionary=True) 
        query = "SELECT * FROM doctors"
        cursor.execute(query)
        doctor_data = cursor.fetchall()
        if doctor_data:
            return doctor_data
        
        return {"message": "There are no doctors"}
    
    except Exception as e:
        return {"error": f"---->{e}<----"}

# Post requests
@app.post("/admission/insert")
def admission(patient_id: int, doctor_id: int, payment_id: int, medicine_id: int, country_id: str, admission_date: str, release_date: str, diagnosis: str, urgency_rate: int):
    try:
        cursor = db.cursor() 
        query = "INSERT INTO admissions (patient_id, doctor_id, payment_id, medicine_id, country_id, admission_date, release_date, diagnosis, urgency_rate) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"
        data = (patient_id, doctor_id, payment_id, medicine_id, country_id, admission_date, release_date, diagnosis, urgency_rate)

        cursor.execute(query, data)
        db.commit()
        cursor.close()
        return {"message": "Data sent successfully"}
    
    except Exception as e:
        return {"error": f"---->{e}<----"}

@app.post("/patients/insert")
def patients(patient_id: int, first_name: str, last_name: str, email: str, age: int, birthday: str, contact_number: int, status: str, temperature: float, laboratory_test: str):
    try:
        cursor = db.cursor() 
        query = "INSERT INTO patients (patient_id, first_name, last_name, email, age, birthday, contact_number, status, temperature, laboratory_test) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
        data = (patient_id, first_name, last_name, email, age, birthday, contact_number, status, temperature, laboratory_test)
        cursor.execute(query, data)
        db.commit()
        cursor.close()
        return {"message": f"Patient {first_name} {last_name} has been added"}
    
    except Exception as e:
        return {"error": f"---->{e}<----"}

@app.post("/payment/insert")
def payment(payment_id: int, amount: int, payment_method: str, paid_date: str):
    try:
        cursor = db.cursor() 
        query = "INSERT INTO payment (payment_id, amount, payment_method, paid_date) VALUES (%s, %s, %s, %s)"
        data = (payment_id, amount, payment_method, paid_date)
        cursor.execute(query, data)
        db.commit()
        cursor.close()
        return {"message": f"Transaction added | Amount: {amount}"}
    
    except Exception as e:
        return {"error": f"---->{e}<----"}

# Update requests
@app.put("/patient/change/{patient_id}")
def update_patient(patient_id: int, first_name: str = Body(...), last_name: str = Body(...), age: int = Body(...), email: str = Body(...)):
    try:
        cursor = db.cursor() 
        query = "UPDATE patients SET first_name = %s, last_name = %s, age = %s, email = %s WHERE patient_id = %s"
        data = (patient_id, first_name, last_name, age, email)
        cursor.execute(query, data)
        db.commit()
        cursor.close()
        return {"message": "Name has been changed"}
    
    except Exception as e:
        return {"error": f"---->{e}<----"}

# Delete requests
@app.delete("/doctors/remove/{doctor_id}")
def doctor_remove(doctor_id: int):
    try:
        cursor = db.cursor() 
        query = "DELETE FROM doctors WHERE doctor_id = %s"
        cursor.execute(query, (doctor_id, ))
        cursor.close()
        db.commit()
        return {"message": f"Doctor with the doctor {doctor_id} has been removed"}
    
    except Exception as e:
        return {"error": f"----> {e} <----"}
    
@app.get("/payment_9283847AseNs")
def payments_from_patients(patient_id: int):
    try:
        cursor = db.cursor(dictionary=True) 
        query = "SELECT * FROM admissions WHERE patient_id = %s"
        data = (patient_id, )
        cursor.execute(query, data)
        payment_data = cursor.fetchall()
        if payment_data:
            return payment_data["payment_id"]
        
        return {"message": "There are no doctors"}
    
    except Exception as e:
        return {"error": f"---->{e}<----"}
    
@app.delete("/patients/remove/{patient_id}")
def patient_remove(patient_id: int):
    try:
        cursor = db.cursor()
        pay_id = payments_from_patients(patient_id)
        query_1 = "DELETE FROM payments WHERE payment_id = %s" 
        data = (pay_id, )
        cursor.execute(query_1, data)
        query_2 = "DELETE FROM patients WHERE patient_id = %s; DELETE FROM admissions WHERE patient_id = %s;"
        for _ in cursor.execute(query_2, (patient_id, patient_id), multi=True):
            pass

        cursor.close()
        db.commit()
        return {"message": f"Doctor with the doctor {patient_id} has been removed"}
    
    except Exception as e:
        return {"error": f"----> {e} <----"}