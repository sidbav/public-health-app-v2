Feature: Accessing Resources questions
As a user
I want to be access resources
So that I can get the help I need

Background: surveys, users, and local resources in database
  Given the following surveys exist:
  | id | survey_name | survey_category | languages |
  | 1 | U.S. Household Food Security Survey | Food Security | English, Spanish, Chinese |
  | 2 | Six-Item Short Form of the Food Security Survey | Food Security | English |


  Given the following users exist:
  | first_name | last_name | phone_number | address_line_1 | address_line_2 | zip   | city            | state        | date_of_birth | email             | password | confirmation_token   | confirmed_at               | confirmation_sent_at       |
  | Test       | User      | 1231231234   | 123 Street     |                | 77840 | College Station | Texas        | 1999-01-01    | testuser@test.com | Test123  | 123                  | 2023-02-21 21:19:16.346030 | 2023-02-21 21:16:57.180869 |
  | Test       | User2     | 1231231234   | 123 Street     | APT 123        | 12345 | College Station | Texas        | 1999-01-01    | testuser2@test.com | Test123  | 123                  | 2023-02-21 21:19:16.346030 | 2023-02-21 21:16:57.180869 |

  Given the following local resources:
  | zip  | name | website | address | phone_number | email |
  | 77840| Islamic Community of Bryan/College Station (ICBCS) | https://www.icbcs.org/ | 417 Stasney St, College Station, TX 77840 | | board@icbcs.org|
  | 77841| ANTIOCH COMMUNITY CHURCH | https://www.antiochcs.org/| 1803 BRIARCREST DR, BRYAN, TX 77802, USA| (979)703-8411 | INFO@ANTIOCHCS.ORG |

Scenario: User is logged in and can access the resource page
  Given I am logged in
  When I visit the home screen
  Then I should see "Resources"
  When I click on the "Resources" link
  Then I should see "Islamic Community of Bryan/College Station (ICBCS)"
  And I should not see "ANTIOCH COMMUNITY CHURCH"
  And I should see "Food Banks near 77840"
