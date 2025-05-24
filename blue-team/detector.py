def detect_phi(text):
    phi_keywords = ["name", "address", "dob", "ssn", "phone", "insurance"]
    for word in phi_keywords:
        if word in text.lower():
            return True
    return False

text = input("Enter output to scan: ")
if detect_phi(text):
    print("⚠️ Possible PHI detected!")
else:
    print("✅ Clean")
