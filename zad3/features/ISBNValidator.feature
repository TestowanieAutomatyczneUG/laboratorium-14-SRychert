Feature: ISBNValidator

  Scenario Outline: ISBN Validator
    Given there is an ISBN Validator
    When we pass string ISBN number "<string>"
    Then the result is "<result>"

    Examples:
      | string                           | result |
      | 978-3-16-148410-0                | True   |
      | 978-83-87347-42-0                | True   |
      | 9781861972712                    | True   |
      | 978-83-87347-42-1                | False  |
      | 978-3-16-148410-2                | False  |
      | 123123123123                     | False  |
      | asdasdasd                        | False  |
      | ******                           | False  |
      | []                               | False  |
      | 9.781861972712                   | False  |
      | 12312312312.3123123              | False  |
      | -123123123                       | False  |
      | -123123123.123123123             | False  |
      | {}                               | False  |
      | ""                               | False  |
      | ---------------------------      | False  |
      | 978-3-16-148------410----------0 | True   |