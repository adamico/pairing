Feature: pairing lines from 2 csv tables
  In order to match controls for my cases
  As myself
  I want this script to match lines from 2 csv files
  By 3 columns: pregnancy age, patient age, call date

  Scenario Outline: compare case with control
    Given a cas with values <cas>
    When I try to match a temoin with values <temoin>
    Then I should have <match> matches
    Examples:
        | cas           | temoin        | match |
        | 2002, 38, 13  | 2002, 38, 13  | 3     |
        | 2002, 38, 13  | 2002, 38, 11  | 3     |
        | 2002, 38, 13  | 2002, 38, 15  | 3     |
        | 2002, 38, 13  | 2002, 40, 13  | 3     |
        | 2002, 38, 13  | 2002, 36, 13  | 3     |
        | 2002, 38, 13  | 2001, 38, 13  | 3     |
        | 2002, 38, 13  | 2003, 38, 13  | 3     |
