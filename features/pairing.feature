Feature: pairing lines from 2 csv tables
  In order to match controls for my cases
  As myself
  I want this script to match lines from 2 csv files
  By 3 columns: pregnancy age, patient age, call date

  Scenario Outline: compare case with control
    Given a cas with values <cas>
    When I try to match a temoin with values <temoin>
    Then I should have <match> matches
    Examples: 3 matches
        | cas           | temoin        | match |
        | 2002, 38, 13  | 2002, 38, 13  | 3     |
        | 2002, 38, 13  | 2002, 38, 11  | 3     |
        | 2002, 38, 13  | 2002, 38, 15  | 3     |
        | 2002, 38, 13  | 2002, 40, 13  | 3     |
        | 2002, 38, 13  | 2002, 36, 13  | 3     |
        | 2002, 38, 13  | 2001, 38, 13  | 3     |
        | 2002, 38, 13  | 2003, 38, 13  | 3     |

    Examples: 2 matches
        | cas           | temoin        | match |
        | 2002, 38, 13  | 2002, 38, 10  | 2     |
        | 2002, 38, 13  | 2002, 38, 16  | 2     |
        | 2002, 38, 13  | 2002, 35, 13  | 2     |
        | 2002, 38, 13  | 2002, 41, 13  | 2     |
        | 2002, 38, 13  | 2004, 38, 13  | 2     |
        | 2002, 38, 13  | 2000, 38, 13  | 2     |

    Examples: 1 match
        | cas           | temoin        | match |
        | 2002, 38, 13  | 2002, 35, 10  | 1     |
        | 2002, 38, 13  | 2002, 41, 10  | 1     |
        | 2002, 38, 13  | 2004, 35, 13  | 1     |
        | 2002, 38, 13  | 2000, 41, 13  | 1     |
        | 2002, 38, 13  | 2004, 38, 10  | 1     |
        | 2002, 38, 13  | 2000, 38, 10  | 1     |

    Examples: no match
        | cas           | temoin        | match |
        | 2002, 38, 13  | 2000, 35, 10  | 0     |
        | 2002, 38, 13  | 2004, 41, 10  | 0     |
        | 2002, 38, 13  | 2004, 35, 13  | 0     |
        | 2002, 38, 13  | 2000, 35, 16  | 0     |

