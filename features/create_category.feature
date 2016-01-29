Feature: Create admin category
  As a blog administrator
  In order to share my thoughts with the world
  I want to be able to add categories to my blog

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Index redirect to new
    Given I am on the admin dashboard page
    When  I follow "Categories"
    Then  I should be on the admin new category page

  Scenario: Successfully create new category
    Given I am on the admin new category page
    When I fill in "category_name" with "Foobar Category"
    And I fill in "category_keywords" with "Foo Bar"
    And I fill in "category_description" with "Descriptions of FooBar Category"
    And I press "Save"
    Then I should be on the admin new category page
