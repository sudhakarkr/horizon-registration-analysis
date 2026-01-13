@smoke @us-001 @registration
Feature: Register with Email and Password

  Background:
    Given I navigate to "https://horizon.example.com/register"
    And I am on the Horizon registration page
    And I see the "Horizon" logo in the header
    And I see the registration form

  @happy-path @critical
  Scenario: Successful registration with all valid information
    When I enter "John Smith" in the "Your Full Name" field
    And I enter "john.smith@example.com" in the "Email Address" field
    And I enter "+44 7123 456789" in the "Phone Number" field
    And I select "Spouse" from the "Relationship to Deceased" dropdown
    And I check the "I agree to the Terms of Service" checkbox
    And I check the "I agree to the Privacy Policy" checkbox
    And I click the "Start Registration" button
    Then I should see a success message "Registration successful"
    And I should be redirected to "/your-details" page within 3 seconds
    And I should receive a confirmation email at "john.smith@example.com" within 5 minutes

  @negative @critical
  Scenario: Registration fails with empty full name
    When I leave the "Your Full Name" field empty
    And I enter "john.smith@example.com" in the "Email Address" field
    And I enter "+44 7123 456789" in the "Phone Number" field
    And I select "Spouse" from the "Relationship to Deceased" dropdown
    And I check both terms checkboxes
    And I click the "Start Registration" button
    Then I should see an error message "Full name is required" below the name field
    And the "Your Full Name" field should be highlighted with red border
    And I should remain on the registration page

  @boundary
  Scenario Outline: Registration with various name formats
    When I enter "<name>" in the "Your Full Name" field
    And I complete all other required fields correctly
    And I click the "Start Registration" button
    Then the result should be "<result>"

    Examples:
      | name | result |
      | John Smith | success |
      | Jean-Pierre O'Brien | success |
      | María José García | success |
      | 李明 | success |
      | J | error |
      | 123 | error |