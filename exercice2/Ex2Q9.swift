func valid(_ email : String) -> Bool{
    return email.contains("@") && email.contains(".")
}
print(valid("test@gmail_com"))