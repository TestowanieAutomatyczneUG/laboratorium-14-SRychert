from behave import *
from src.ISBNValidator import validator

use_step_matcher("parse")


@given(u"there is an ISBN Validator")
def step_impl(context):
    context.isbn_validator = validator


@when(u'we pass string ISBN number "{isbn_number}"')
def step_impl(context, isbn_number):
    context.result = context.isbn_validator(isbn_number)


@then('the result is "{result}"')
def step_impl(context, result):
    value = True if result == "True" else False
    assert context.result == value
