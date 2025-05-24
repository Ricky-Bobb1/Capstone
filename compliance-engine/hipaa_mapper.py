def map_to_hipaa(event_type):
    hipaa_rules = {
        "prompt_injection": "164.312(a)(2)(iv) - Access Control",
        "phi_leak": "164.502 - Uses and disclosures of PHI"
    }
    return hipaa_rules.get(event_type, "No mapping found")

print(map_to_hipaa("phi_leak"))
