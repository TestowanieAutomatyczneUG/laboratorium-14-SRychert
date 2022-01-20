Feature: Database

    @mock
    Scenario: Add book
        Given there is an book database
        And some db call that returns "{id: 0, title:"FUTU.RE",ISBN:"9788363944483",author:{first_name:"Dmitry",last_name:"Glukhovsky",email:"dmgluk@gmail.com"}}"
        And there is an author with first_name "Dmitry", second_name "Glukhovsky", email "dmgluk@gmail.com"
        And there is a book "FUTU.RE" with ISBN "9788363944483"
        When we add new book to database
        Then we get "{id: 0, title:"FUTU.RE",ISBN:"9788363944483",author:{first_name:"Dmitry",last_name:"Glukhovsky",email:"dmgluk@gmail.com"}}" as result


    @mock
    Scenario: Add invalid book
        Given there is an book database
        And some db call raising database error
        When function "add_book" is called with argument "23"
        Then DatabaseError is raised

    @mock
    Scenario: Get all books
        Given there is an book database
        And some db call that returns "[{id: 0, title:"FUTU.RE",ISBN:"9788363944483",author:{first_name:"Dmitry",last_name:"Glukhovsky",email:"dmgluk@gmail.com"}}]"
        When function "get_books" is called
        Then we get "[{id: 0, title:"FUTU.RE",ISBN:"9788363944483",author:{first_name:"Dmitry",last_name:"Glukhovsky",email:"dmgluk@gmail.com"}}]" as result

    @mock
    Scenario: Get all books - empty
        Given there is an book database
        And some db call that returns "[]"
        When function "get_books" is called
        Then we get "[]" as result

    @mock
    Scenario: Get book by id
        Given there is an book database
        And some db call that returns "{id: 0, title:"FUTU.RE",ISBN:"9788363944483",author:{first_name:"Dmitry",last_name:"Glukhovsky",email:"dmgluk@gmail.com"}}"
        When function "get_book" is called with argument "0"
        Then we get "{id: 0, title:"FUTU.RE",ISBN:"9788363944483",author:{first_name:"Dmitry",last_name:"Glukhovsky",email:"dmgluk@gmail.com"}}" as result

    @mock
    Scenario: Get book by id - empty
        Given there is an book database
        And some db call that returns "null"
        When function "get_book" is called with argument "69"
        Then we get "null" as result

    @mock
    Scenario: Delete book
        Given there is an book database
        And some db call that returns "DELETED"
        When function "delete_book" is called with argument "0"
        Then we get "DELETED" as result

    @mock
    Scenario: Edit book
        Given there is an book database
        And some db call that returns "{id: 0, title:"FUTU.RE.NEW",ISBN:"9788363944483",author:{first_name:"Dmitry",last_name:"Glukhovsky",email:"dmgluk@gmail.com"}}"
        And there is an author with first_name "Dmitry", second_name "Glukhovsky", email "dmgluk@gmail.com"
        And there is a book "FUTU.RE" with ISBN "9788363944483"
        When we update book in database
        Then we get "{id: 0, title:"FUTU.RE.NEW",ISBN:"9788363944483",author:{first_name:"Dmitry",last_name:"Glukhovsky",email:"dmgluk@gmail.com"}}" as result