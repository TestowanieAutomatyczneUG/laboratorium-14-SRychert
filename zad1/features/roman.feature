Feature: Roman

  Scenario Outline: Calculate roman numbers from decimal ones
    Given there is roman
    When the given number is "<number>"
    Then the result is "<result>"

    Examples:
      | number    | result      |
      |   1       |   I         |
      |   2       |   II        |
      |   3       |   III       |
      |   4       |   IV        |
      |   5       |   V         |
      |   6       |   VI        |
      |   9       |   IX        |
      |   27      |   XXVII     |
      |   48      |   XLVIII    |
      |   49      |   XLIX      |
      |   59      |   LIX       |
      |   93      |   XCIII     |
      |   141     |   CXLI      |
      |   163     |   CLXIII    |
      |   402     |   CDII      |
      |   575     |   DLXXV     |
      |   911     |   CMXI      |
      |   1024    |   MXXIV     |
      |   3000    |   MMM       |
