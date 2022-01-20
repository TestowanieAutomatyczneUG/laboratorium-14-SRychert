from behave import *
from src.Book import Book
from src.Author import Author

use_step_matcher("parse")


@given(u'there is an title "{title}"')
def step_impl(context, title):
    context.title = title


@given(u'there is an author "{first_name}", "{last_name}", "{email}"')
def step_impl(context, first_name, last_name, email):
    context.author = Author(first_name, last_name, email)


@given(u'there is an ISBN "{isbn}"')
def step_impl(context, isbn):
    context.isbn = isbn


@when(u'the book is created')
def step_imp(context):
    try:
        context.book = Book(
            context.title, context.author, context.isbn)
    except Exception as ex:
        context.error = ex


@then(u'book data is equal to "{data}"')
def step_imp(context, data):
    assert context.book.title+" "+context.book.ISBN == data
