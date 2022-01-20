def validator(isbn_number: str) -> bool:
    if not isinstance(isbn_number, str):
        return False

    isbn_number = isbn_number.replace("-", "")
    if len(isbn_number) != 13:
        return False

    weight = False
    isbn_number_sum = 0
    for digit in isbn_number:
        try:
            isbn_number_sum += int(digit) * 3 if weight else int(digit)
            weight = not weight
        except ValueError:
            return False

    sum_rest = isbn_number_sum % 10
    result = 10 - 10 if sum_rest == 0 else 10 - sum_rest
    return True if result == 0 else False
