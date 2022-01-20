from behave import *
from src.Author import Author

use_step_matcher("parse")


@given(u'there is an first_name "{first_name}"')
def step_impl(context, first_name):
    context.first_name = first_name


@given(u'there is an last_name "{last_name}"')
def step_impl(context, last_name):
    context.last_name = last_name


@given(u'there is an email "{email}"')
def step_impl(context, email):
    context.email = email


@given(u'there is an invalid email')
def step_impl(context):
    context.email = 123


@when(u'the author is created')
def step_imp(context):
    try:
        context.author = Author(
            context.first_name, context.last_name, context.email)
    except Exception as ex:
        context.error = ex


@then(u'author first_name is equal to "{first_name}"')
def step_imp(context, first_name):
    assert context.author.first_name == first_name


@then(u'author full name is equal to "{full_name}"')
def step_imp(context, full_name):
    assert context.author.first_name+" "+context.author.last_name == full_name


@then(u'author last_name is equal to "{last_name}"')
def step_imp(context, last_name):
    assert context.author.last_name == last_name


@then(u'author email is equal to "{email}"')
def step_imp(context, email):
    assert context.author.email == email


@then(u'TypeError is raised')
def step_imp(context):
    assert isinstance(context.error, TypeError)
