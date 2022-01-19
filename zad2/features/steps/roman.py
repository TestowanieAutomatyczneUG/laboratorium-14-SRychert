from behave import *
from src.roman import roman

use_step_matcher('parse')

@given("there is roman")
def step_impl(context):
    context.roman = roman

@when("the given number is {number}")
def step_impl(context, number):
    context.result = context.roman(int(number))

@then("the result is {result}")
def step_impl(context, result):
    assert context.result == result