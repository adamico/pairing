Feature: compare 2 arrays by 3 columns
  In order to match controls for my cases
  As myself
  I want this script to match 2 arrays
  By 3 columns: pregnancy age, patient age, call date

  Background:
    Given a cas with 2002, 38, 13

  Scenario Outline: puts cas and temoin values
    Given a temoin with <temoin>
    Then I should see "Cas has values : <cas>"
    Then I should see "Temoin has values : <temoin>"
      Examples:
        | cas         | temoin      |
        | 2002, 38, 13| 2001, 37, 12|

  @focus
  Scenario Outline: compare case with control
      Given a temoin with <temoin>
    Then the result should be "<result> match(es)"
    Examples: 3 matches
        | temoin        | result |
        | 2002, 38, 13  | 3     |
        | 2002, 38, 11  | 3     |
        | 2002, 38, 15  | 3     |
        | 2002, 40, 13  | 3     |
        | 2002, 36, 13  | 3     |
        | 2001, 38, 13  | 3     |
        | 2003, 38, 13  | 3     |

    Examples: 2 matches
        | temoin        | result |
        | 2002, 38, 10  | 2     |
        | 2002, 38, 16  | 2     |
        | 2002, 35, 13  | 2     |
        | 2002, 41, 13  | 2     |
        | 2004, 38, 13  | 2     |
        | 2000, 38, 13  | 2     |

    Examples: 1 match
        | temoin        | result |
        | 2002, 35, 10  | 1     |
        | 2002, 41, 10  | 1     |
        | 2004, 35, 13  | 1     |
        | 2000, 41, 13  | 1     |
        | 2004, 38, 10  | 1     |
        | 2000, 38, 10  | 1     |

    Examples: no match
        | temoin        | result |
        | 2000, 35, 10  | No    |
        | 2004, 41, 10  | No    |
        | 2004, 35, 16  | No    |
        | 2000, 35, 16  | No    |

