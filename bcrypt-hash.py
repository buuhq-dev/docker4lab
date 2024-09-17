import bcrypt
password = b"Tpb@2024"  # Replace with the actual password
hashed = bcrypt.hashpw(password, bcrypt.gensalt())
print(hashed)