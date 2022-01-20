class DatabaseError(Exception):
    pass


class Database:
    def __init__(self, books={}) -> None:
        self.books = books

    def db_call(self, *args):
        pass

    def get_books(self):
        return self.db_call("get", "books")

    def get_book(self, book_id):
        return self.db_call("get", f"books{book_id}")

    def add_book(self, book):
        return self.db_call("post", "books", book)

    def delete_book(self, book_id):
        return self.db_call("delete", f"books{book_id}")

    def edit_book(self, book):
        return self.db_call("put", f"books{book.ISBN}")
