from behave import *
from src.roman import roman

use_step_matcher('parse')


@given(u'there is roman')
def step_impl(context):
    context.roman = roman


@when(u'the given number is "{number}"')
def step_impl(context, number):
    context.result = context.roman(int(number))


@then(u'the result is "{result}"')
def step_impl(context, result):
    assert context.result == result
