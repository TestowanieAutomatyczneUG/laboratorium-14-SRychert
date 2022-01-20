class Author:
    def __init__(self, first_name, last_name, email) -> None:
        if not isinstance(first_name, str):
            raise TypeError("First name must be string")
        if not isinstance(last_name, str):
            raise TypeError("Last name must be string")
        if not isinstance(email, str):
            raise TypeError("Email must be string")
        self.first_name = first_name
        self.last_name = last_name
        self.email = email
