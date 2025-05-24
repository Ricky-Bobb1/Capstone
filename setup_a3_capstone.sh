#!/bin/bash

echo "📦 Creating A3 Capstone Project Structure..."
mkdir -p red-team blue-team compliance-engine docker-arena logs .vscode

echo "🐳 Writing Docker Compose..."
cat > docker-arena/docker-compose.yml <<EOL
version: '3'
services:
  webapp:
    image: nginx
    ports:
      - "8080:80"
  ehr:
    image: httpd
    ports:
      - "8081:80"
EOL

echo "🛡 Writing Blue Team agent..."
cat > blue-team/detector.py <<EOL
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
EOL

echo "📜 Writing HIPAA compliance mapper..."
cat > compliance-engine/hipaa_mapper.py <<EOL
def map_to_hipaa(event_type):
    hipaa_rules = {
        "prompt_injection": "164.312(a)(2)(iv) - Access Control",
        "phi_leak": "164.502 - Uses and disclosures of PHI"
    }
    return hipaa_rules.get(event_type, "No mapping found")

print(map_to_hipaa("phi_leak"))
EOL

touch logs/log.txt
echo "✅ Setup complete."
