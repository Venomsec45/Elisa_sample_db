import requests
import random
import time
from rich import print as show

def admission_input(patient_id: int, doctor_id: int, payment_id: int, medicine_id: int, country_id: str, 
              admission_date: str, release_date: str, diagnosis: str, urgency_rate: int):
    
    u = "http://127.0.0.1:8000/admissions"
    r = requests.post(url=u, params={"patient_id": patient_id, "doctor_id": doctor_id, "payment_id": payment_id, "medicine_id": medicine_id, "country_id": country_id, "admission_date": admission_date, "release_date": release_date, "diagnosis": diagnosis, "urgency_rate": urgency_rate})
    if r.status_code in (200, 201, 202, 204):
        show(f"[green][{r.status_code}][/green] - {r.text}")

    elif r.status_code in (400, 401, 403, 404, 408, 429):
        show(f"[red][{r.status_code}][/red] - {r.text}")

def patients_input(patient_id: int, first_name: str, last_name: str, email: str, age: int, 
             birthday: str, contact_number: int, status: str, temperature: float, laboratory_test: str):
    
    u = "http://127.0.0.1:8000/patients"
    r = requests.post(url=u, params={"patient_id": patient_id, "first_name": first_name, "last_name": last_name, "email": email, "age": age, "birthday": birthday, "contact_number": contact_number, "status": status, "temperature": temperature, "laboratory_test": laboratory_test})
    if r.status_code in (200, 201, 202, 204):
        show(f"[green][{r.status_code}][/green] - {r.text}")

    elif r.status_code in (400, 401, 403, 404, 408, 429):
        show(f"[red][{r.status_code}][/red] - {r.text}")

def payment_input(payment_id: int, amount: int, payment_method: str, paid_date: str):
    
    u = "http://127.0.0.1:8000/payment"
    r = requests.post(url=u, params={"payment_id": payment_id, "amount": amount, "payment_method": payment_method, "paid_date": paid_date})
    if r.status_code in (200, 201, 202, 204):
        show(f"[green][{r.status_code}][/green] - {r.text}")

    elif r.status_code in (400, 401, 403, 404, 408, 429):
        show(f"[red][{r.status_code}][/red] - {r.text}")

def insert_data():
    # For admissions
    first_name_generate = random.choice([
    "Aaron", "Abigail", "Adam", "Adrian", "Aiden", "Alan", "Albert", "Alexa", "Alexander", "Alexis",
    "Alice", "Alicia", "Alyssa", "Amanda", "Amber", "Amelia", "Amy", "Andrea", "Andrew", "Angela",
    "Angelica", "Angelina", "Anthony", "Arthur", "Ashley", "Austin", "Ava", "Barbara", "Benjamin", "Bethany",
    "Bianca", "Blake", "Brandon", "Brenda", "Brian", "Brianna", "Brittany", "Brooke", "Caleb", "Cameron",
    "Camila", "Carl", "Carla", "Carlos", "Carmen", "Carol", "Caroline", "Catherine", "Charles", "Charlotte",
    "Cheryl", "Chloe", "Chris", "Christian", "Christina", "Christine", "Christopher", "Claire", "Clara", "Cole",
    "Colin", "Connor", "Courtney", "Crystal", "Daniel", "Danielle", "David", "Dean", "Deborah", "Dennis",
    "Derek", "Derrick", "Diana", "Dominic", "Donna", "Dylan", "Edward", "Elaine", "Eleanor", "Elena",
    "Elijah", "Elizabeth", "Ella", "Ellen", "Emily", "Emma", "Eric", "Erica", "Ethan", "Eva",
    "Evelyn", "Faith", "Felix", "Fernando", "Florence", "Frances", "Gabriel", "Gabriella", "Gavin", "George",
    "Georgia", "Gerald", "Gina", "Grace", "Gregory", "Hannah", "Harold", "Hazel", "Heather", "Henry",
    "Holly", "Hunter", "Ian", "Isaac", "Isabel", "Isabella", "Jack", "Jackson", "Jacob", "Jade",
    "Jake", "James", "Jamie", "Jane", "Jared", "Jason", "Jasmine", "Jayden", "Jean", "Jeffrey",
    "Jenna", "Jennifer", "Jeremy", "Jerry", "Jessica", "Jill", "Joan", "Joanna", "John", "Johnny",
    "Jonathan", "Jordan", "Joseph", "Joshua", "Joy", "Juan", "Judith", "Julia", "Julian", "Julie",
    "Justin", "Karen", "Katherine", "Kathleen", "Kathryn", "Kayla", "Keith", "Kelly", "Kenneth", "Kevin",
    "Kim", "Kimberly", "Kyle", "Lance", "Larry", "Laura", "Lauren", "Leah", "Leo", "Leon",
    "Leonard", "Leslie", "Liam", "Lillian", "Lily", "Linda", "Logan", "Lori", "Louis", "Lucas",
    "Lucy", "Luis", "Luke", "Luna", "Madeline", "Madison", "Maria", "Marie", "Marilyn", "Mark",
    "Martha", "Martin", "Mary", "Mason", "Matthew", "Megan", "Melanie", "Melissa", "Michael", "Michelle",
    "Mila", "Miranda", "Molly", "Monica", "Morgan", "Nancy", "Natalie", "Nathan", "Nicholas", "Nicole",
    "Noah", "Nolan", "Norman", "Olivia", "Oscar", "Owen", "Pamela", "Patricia", "Patrick", "Paul",
    "Paula", "Peter", "Philip", "Phoebe", "Priscilla", "Rachel", "Ralph", "Randy", "Raymond", "Rebecca",
    "Richard", "Robert", "Roger", "Ronald", "Rose", "Ruby", "Russell", "Ryan", "Samantha", "Samuel",
    "Sandra", "Sara", "Sarah", "Scott", "Sean", "Shane", "Shannon", "Sharon", "Shelby", "Sophia",
    "Spencer", "Stacy", "Stephanie", "Stephen", "Steve", "Steven", "Susan", "Sydney", "Taylor", "Teresa",
    "Terry", "Theodore", "Thomas", "Tiffany", "Timothy", "Tracy", "Tristan", "Tyler", "Valerie", "Vanessa",
    "Victor", "Victoria", "Vincent", "Virginia", "Walter", "Wayne", "William", "Willow", "Xander", "Yvonne",
    "Zachary", "Zoe", "Ariel", "Bella", "Brent", "Cecilia", "Clark", "Daisy", "Damian", "Edgar",
    "Elisa", "Emmanuel", "Esther", "Francis", "Frederick", "Georgia", "Giselle", "Grant", "Hailey", "Harry",
    "Hope", "Ivan", "Janet", "Jasper", "Jerome", "Joel", "Jonas", "Joyce", "Juliet", "Kara",
    "Kelsey", "Kristine", "Lara", "Lawrence", "Levi", "Loren", "Marco", "Marcus", "Margaret", "Marvin",
    "Mia", "Miguel", "Naomi", "Neil", "Nina", "Olive", "Paolo", "Parker", "Quentin", "Ramon",
    "Raquel", "Reese", "Riley", "Robin", "Romeo", "Roy", "Sabrina", "Seth", "Shawn", "Simon",
    "Skylar", "Stella", "Sylvia", "Tara", "Tina", "Travis", "Trevor", "Vera", "Violet", "Warren",
    "Wesley", "Whitney", "Yuri", "Zane", "Alfred", "Anita", "Arnold", "Beatrice", "Bernard", "Clyde",
    "Cynthia", "Douglas", "Edith", "Eugene", "Fiona", "Gloria", "Gordon", "Harriet", "Hector", "Irene",
    "Janice", "Kristopher", "Louise", "Marissa", "Miriam", "Nadine", "Oliver", "Penelope", "Quincy", "Regina",
    "Roland", "Sheila", "Sonia", "Trisha", "Ulysses", "Vivian", "Wendy", "Xenia", "Yolanda", "Zelda"
])
    last_name_generate = random.choice([
    "Smith", "Johnson", "Williams", "Brown", "Jones", "Garcia", "Miller", "Davis", "Rodriguez", "Martinez",
    "Hernandez", "Lopez", "Gonzalez", "Wilson", "Anderson", "Thomas", "Taylor", "Moore", "Jackson", "Martin",
    "Lee", "Perez", "Thompson", "White", "Harris", "Sanchez", "Clark", "Ramirez", "Lewis", "Robinson",
    "Walker", "Young", "Allen", "King", "Wright", "Scott", "Torres", "Nguyen", "Hill", "Flores",
    "Green", "Adams", "Nelson", "Baker", "Hall", "Rivera", "Campbell", "Mitchell", "Carter", "Roberts",
    "Gomez", "Phillips", "Evans", "Turner", "Diaz", "Parker", "Cruz", "Edwards", "Collins", "Reyes",
    "Stewart", "Morris", "Morales", "Murphy", "Cook", "Rogers", "Gutierrez", "Ortiz", "Morgan", "Cooper",
    "Peterson", "Bailey", "Reed", "Kelly", "Howard", "Ramos", "Kim", "Cox", "Ward", "Richardson",
    "Watson", "Brooks", "Chavez", "Wood", "James", "Bennett", "Gray", "Mendoza", "Ruiz", "Hughes",
    "Price", "Alvarez", "Castillo", "Sanders", "Patel", "Myers", "Long", "Ross", "Foster", "Jimenez",
    "Santos", "Bautista", "Aquino", "Navarro", "Delacruz", "Salazar", "Castro", "Domingo", "Velasco", "Villanueva",
    "Mercado", "Soriano", "Deleon", "DelosReyes", "Aguilar", "Valdez", "Pascual", "Tolentino", "Luna", "Ocampo",
    "Marquez", "Villanueva", "Estrada", "Pineda", "Magsaysay", "DeGuzman", "DelaRosa", "Manalo", "Samson", "Francisco",
    "Lorenzo", "Abad", "Rosales", "Galang", "Dizon", "Yap", "Tan", "Lim", "Go", "Ong",
    "Chan", "Sy", "Chua", "Co", "Kho", "Yu", "Ty", "Ang", "See", "Tee",
    "Dominguez", "Esquivel", "Ferrer", "Fuentes", "Galvez", "Ibanez", "Lazaro", "Magno", "Natividad", "Padilla",
    "Quinto", "Roxas", "Sarmiento", "Trinidad", "Umali", "Vergara", "Zamora", "Acosta", "Beltran", "Caballero",
    "Calderon", "Cordero", "Delgado", "Escobar", "Espinoza", "Fajardo", "Gallardo", "Herrera", "Ibarra", "Juarez",
    "Lara", "Macias", "Nieves", "Oliva", "Palacios", "Quiroz", "Renteria", "Solis", "Tapia", "Valencia",
    "Arias", "Bravo", "Campos", "Cedeno", "Correa", "Cuevas", "Delgado", "Espinosa", "Franco", "Godinez",
    "Leon", "Maldonado", "Montoya", "Orozco", "Peralta", "Ponce", "Rivas", "Salinas", "Serrano", "Trevino",
    "Valenzuela", "Vega", "Zaragoza", "Armstrong", "Arnold", "Austin", "Barnes", "Bell", "Black", "Boyd",
    "Bradley", "Bryant", "Burns", "Burton", "Butler", "Carpenter", "Carr", "Chapman", "Cole", "Coleman",
    "Cunningham", "Daniels", "Dean", "Douglas", "Duncan", "Elliott", "Ellis", "Erickson", "Farmer", "Ferguson",
    "Fisher", "Ford", "Fox", "Gardner", "George", "Gibson", "Gordon", "Graham", "Grant", "Griffin",
    "Hamilton", "Hansen", "Harper", "Hawkins", "Hayes", "Henderson", "Henry", "Holland", "Holmes", "Hunter",
    "Jacobs", "Jenkins", "Jordan", "Keller", "Kennedy", "Knight", "Lane", "Lawrence", "Little", "Marshall",
    "Mason", "Matthews", "Meyer", "Miles", "Mills", "Montgomery", "Moody", "Nash", "Nichols", "Oliver",
    "Owens", "Palmer", "Payne", "Pearson", "Porter", "Powell", "Pratt", "Quinn", "Ray", "Rice",
    "Rose", "Russell", "Ryan", "Schmidt", "Schneider", "Shaw", "Simpson", "Sims", "Spencer", "Stanley",
    "Stephens", "Stone", "Sullivan", "Tucker", "Vasquez", "Wade", "Wallace", "Walsh", "Walters", "Warren",
    "Weaver", "Webb", "Welch", "Wells", "West", "Wheeler", "Whitaker", "Wheaton", "Wilkins", "Willis",
    "Wise", "Wolfe", "Wong", "Woodward", "York", "Zimmerman", "Abbott", "Bishop", "Blair", "Briggs",
    "Cannon", "Clayton", "Conner", "Cross", "Doyle", "Fleming", "Garner", "Hurst", "Johnston", "Klein",
    "Lambert", "Manning", "Newton", "Osborne", "Page", "Pope", "Preston", "Sharp", "Sherman", "Slater",
    "Snow", "Underwood", "Vaughn", "Wiggins", "Yates", "Zuniga", "Barrera", "Carrillo", "Escamilla", "Huerta",
    "Infante", "Miramontes", "Partida", "Rosario", "Sotelo", "Toribio", "Urbina", "Villalobos", "Zepeda", "Arellano"
])
    patient_id_generate = 1
    doctor_id_generate = random.randint(1, 16)
    payment_id_generate = 1001
    medicine_id_generate = random.randint(1, 100)
    country_id_generate = ['ID', 'FR', 'RU', 'GR', 'CN', 'NP', 'PH', 'TH', 'PL', 'SK', 'AM', 'CU', 'PT', 'NG', 'SV', 'IR', 'AF', 'TZ', 'TL', 'UA', 'EE', 'CZ', 'EG', 'DO', 'VE', 'SE', 'HR', 'US', 'CO', 'PE', 'NL', 'JP', 'NZ', 'MG', 'VN', 'LK', 'SY', 'CA', 'CM']
    diagnosis_generate = [
    "Essential hypertension", "Type 2 diabetes mellitus", "Hyperlipidemia", 
    "Gastroesophageal reflux disease", "Anxiety disorder", "Major depressive disorder", "Acute upper respiratory infection", "Back pain, unspecified", "Osteoarthritis", 
    "Asthma, unspecified", "Hypothyroidism", "Vitamin D deficiency", "Allergic rhinitis", "Acute pharyngitis", "Urinary tract infection", 
    "Obesity, unspecified", "Acute bronchitis", "Fibromyalgia", "Migraine, unspecified", "Irritable bowel syndrome", "Chronic kidney disease", 
    "Atrial fibrillation", "Gout", "Iron deficiency anemia", "Insomnia", "Sleep apnea", "Psoriasis", 
    "Eczema", "Gastroenteritis", "Benign prostatic hyperplasia","Essential hypertension", "Type 2 diabetes mellitus", "Hyperlipidemia", 
    "Gastroesophageal reflux disease", "Anxiety disorder", "Major depressive disorder", "Acute upper respiratory infection", "Back pain, unspecified", "Osteoarthritis", 
    "Asthma, unspecified", "Hypothyroidism", "Vitamin D deficiency", "Allergic rhinitis", "Acute pharyngitis", "Urinary tract infection", 
    "Obesity, unspecified", "Acute bronchitis", "Fibromyalgia", "Migraine, unspecified", "Irritable bowel syndrome", "Chronic kidney disease", 
    "Atrial fibrillation", "Gout", "Iron deficiency anemia", "Insomnia", "Sleep apnea", "Psoriasis", 
    "Eczema", "Gastroenteritis", "Benign prostatic hyperplasia","Essential hypertension", "Type 2 diabetes mellitus", "Hyperlipidemia", 
    "Gastroesophageal reflux disease", "Anxiety disorder", "Major depressive disorder", "Acute upper respiratory infection", "Back pain, unspecified", "Osteoarthritis", 
    "Asthma, unspecified", "Hypothyroidism", "Vitamin D deficiency", "Allergic rhinitis", "Acute pharyngitis", "Urinary tract infection", "Obesity, unspecified", "Acute bronchitis", "Fibromyalgia", 
    "Migraine, unspecified", "Irritable bowel syndrome", "Chronic kidney disease", "Atrial fibrillation", "Gout", "Iron deficiency anemia", 
    "Insomnia", "Sleep apnea", "Psoriasis", "Eczema", "Gastroenteritis", "Benign prostatic hyperplasia",
    "Essential hypertension", "Type 2 diabetes mellitus", "Hyperlipidemia", "Gastroesophageal reflux disease", "Anxiety disorder", "Major depressive disorder", 
    "Acute upper respiratory infection", "Back pain, unspecified", "Osteoarthritis", "Asthma, unspecified"
]

    while True:
        admission_input(patient_id_generate, doctor_id_generate, payment_id_generate, medicine_id_generate, country_id_generate, f"{random.randint(1, 7)}/{random.randint(1, 29)}/2025", f"{random.randint(8, 12)}/{random.randint(1, 29)}/2025", random.choice(diagnosis_generate), random.randint(1, 5))
        patients_input(patient_id_generate, first_name_generate, last_name_generate, f"{first_name_generate}@{random.choice(["gmail.com", "outlook.com", "yahoo.com"])}", random.randint(30, 78), f"{random.randint(1, 12)}/{random.randint(1, 29)}/{random.randint(1980, 2018)}", random.randint(3101010101, 9990000000), random.choice["Waiting", "In admission", "Released", "Cancelled"], random.uniform(35.0, 39.8))
        payment_input(payment_id_generate, random.randint(50, 900), random.choice(["Onsite payment", "Online payment"]), f"{random.randint(8, 12)}/{random.randint(1, 29)}/2025")

if __name__ == "__main__":
    insert_data()