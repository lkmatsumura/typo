Feature: Merge Articles
  As a blog administrator
  In order to avoid similar articles
  I want to be able to merge two articles

  Background:
    Given the blog is set up
    And the following articles exist
     | id | title    | body          | user_id |
     | 3  | Foobar   | Lorem Ipsum   | 2       |
     | 4  | Foobar 2 | Lorem Ipsum 2 | 2       |
     | 5  | Foobar 3 | Lorem Ipsum 3 | 3       |
 
    And the following comments exist
     | id | body                                                     | article    | author |
     | 1  | Lorem ipsum dolor sit amet, consectetur adipiscing elit. | Foobar     | John   |
     | 2  | Etiam eget ligula eu lectus lobortis condimentum.        | Foobar     | Joe    |
     | 3  | Aliquam nonummy auctor massa.                            | Foobar 2   | Bel    |
     | 4  | Pellentesque habitant morbi tristique senectus           | Foobar 2   | Melina |
     | 5  | et netus et malesuada fames ac turpis egestas.           | Foobar 2   | Katie  |
     | 6  | Nulla at risus.                                          | Foobar 3   | John   |

#  Scenario: A non-admin cannot merge articles
#    Given     I am logged in as publisher
#          And I am on the article page for "Foobar"
#    When      I fill in "merge_with" with "4"
#          And I press "Merge"
#    Then      I should see "Error, you are not allowed to perform this action"
#          And the article "Foobar" should have body "Lorem Ipsum"

  Scenario: A non-admin cannot merge articles
    Given     I am logged in as publisher
          And I am on the article page for "Foobar"
    Then      I should not see "Merge Articles"



  Scenario: The article to merge does not exist
    Given I am logged into the admin panel
          And I am on the article page for "Foobar"
    When      I fill in "merge_with" with "15"
          And I press "Merge"
    Then      I should see "Error, the article to be merged does not exist"

  Scenario: The article to merge is the same article
    Given I am logged into the admin panel
          And I am on the article page for "Foobar"
    When      I fill in "merge_with" with "3"
          And I press "Merge"
    Then      I should see "Error, cannot merge the same article"

  Scenario: Successfully merge articles
    Given I am logged into the admin panel
          And I am on the article page for "Foobar"
    When      I fill in "merge_with" with "5"
          And I press "Merge"
    Then      the article "Foobar" should have body "Lorem Ipsum Lorem Ipsum 3"
          And the article "Foobar" should have "3" comments
          And the article "Foobar 3" should be deleted

