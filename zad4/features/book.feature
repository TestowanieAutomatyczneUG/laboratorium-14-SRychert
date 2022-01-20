Feature: Book

    Scenario Outline: Create book, check data
        Given there is an title "<title>"
        And there is an author "Dmitry", "Glukhovsky", "dmgluk@gmail.com"
        And there is an ISBN "<isbn>"
        When the book is created
        Then book data is equal to "<data>"

        Examples:
            | title                                 | isbn                        | data                                                |
            | FUTU.RE                               | 9788363944483               | FUTU.RE 9788363944483                               |
            | Harry Potter and the sorcerer's stone | 9780439554930               | Harry Potter and the sorcerer's stone 9780439554930 |
            | Aslan (Chronicles of Narnia)          | 9780060276362               | Aslan (Chronicles of Narnia) 9780060276362          |
            | The lord of the rings                 | 9780395647387               | The lord of the rings 9780395647387                 |

    Scenario Outline: Create book, error
        Given there is an title "<title>"
        And there is an author "Dmitry", "Glukhovsky", "dmgluk@gmail.com"
        And there is an ISBN "<isbn>"
        When the book is created
        Then TypeError is raised

        Examples:
            | title             | isbn          |
            | FUTU.RE           | 123           |
            | Dziady            | []            |
            | Pan Tadeusz       | {}            |
            | Testowanie        | 48585233526   |
            | Some Title        | 0.161645646   |
            | The secret agent  | testing       |