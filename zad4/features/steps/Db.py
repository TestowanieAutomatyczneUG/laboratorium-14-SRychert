from behave import *
from src.Db import Database, DatabaseError
from src.Author import Author
from src.Book import Book
from unittest.mock import MagicMock

use_step_matcher("parse")


# GIVEN


@given(u'there is an book database')
def step_impl(context):
    context.db = Database()


@given(u'some db call that returns "{return_value}"')
def step_impl(context, return_value):
    context.db.db_call = MagicMock(return_value=return_value)


@given(u'some db call raising database error')
def step_impl(context):
    context.db.db_call = MagicMock(side_effect=DatabaseError)


@given(u'there is an author with first_name "{first_name}", second_name "{last_name}", email "{email}"')
def step_impl(context, first_name, last_name, email):
    context.author = Author(first_name, last_name, email)


@given(u'there is a book "{title}" with ISBN "{isbn}"')
def step_impl(context, title, isbn):
    context.book = Book(title, context.author, isbn)
# WHEN


@when(u'function "{function}" is called with argument "{arg}"')
def step_impl(context, function, arg):
    try:
        context.result = getattr(context.db, function)(arg)
    except Exception as x:
        context.error = x


@when(u'function "{function}" is called')
def step_impl(context, function):
    try:
        context.result = getattr(context.db, function)()
    except Exception as x:
        context.error = x


@when(u'we add new book to database')
def step_impl(context):
    try:
        context.result = context.db.add_book(context.book)
    except Exception as x:
        context.error = x


@when(u'we update book in database')
def step_impl(context):
    try:
        context.result = context.db.edit_book(context.book)
    except Exception as x:
        context.error = x

# THEN


@then(u'we get "{result}" as result')
def step_impl(context, result):
    assert context.result == result


@Then(u'DatabaseError is raised')
def step_impl(context):
    assert isinstance(context.error, DatabaseError)
