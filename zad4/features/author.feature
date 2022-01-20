Feature: Author

    Scenario Outline: Create author, check full_name
        Given there is an first_name "<first_name>"
        And there is an last_name "<last_name>"
        And there is an email "dmgluk@gmail.com"
        When the author is created
        Then author full name is equal to "<full_name>"

        Examples:
            | first_name | last_name     | full_name            |
            | Dmitry     | Glukhovsky    | Dmitry Glukhovsky    |
            | Wojtek     | Pietruszewski | Wojtek Pietruszewski |
            | Adam       | Pilarski      | Adam Pilarski        |
            | Szymon     | Merski        | Szymon Merski        |
            | Mati       | Stapaj        | Mati Stapaj          |

    Scenario: Create author, check last_name
        Given there is an first_name "Dmitry"
        And there is an last_name "Glukhovsky"
        And there is an email "dmgluk@gmail.com"
        When the author is created
        Then author last_name is equal to "Glukhovsky"

    Scenario: Create author, check email
        Given there is an first_name "Dmitry"
        And there is an last_name "Glukhovsky"
        And there is an email "dmgluk@gmail.com"
        When the author is created
        Then author email is equal to "dmgluk@gmail.com"

    Scenario: Create author, invalid
        Given there is an first_name "Dmitry"
        And there is an last_name "Glukhovsky"
        And there is an invalid email
        When the author is created
        Then TypeError is raised