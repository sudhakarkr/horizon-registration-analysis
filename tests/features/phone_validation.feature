@validation @us-003 @phone
Feature: Phone Number Validation

  Background:
    Given I am on the Horizon registration page
    And the "Phone Number" field is visible

  @happy-path
  Scenario Outline: Valid phone numbers are accepted
    When I enter "<phone_number>" in the "Phone Number" field
    And I move focus away from the phone field
    Then I should not see any phone validation errors
    And the field should show a success indicator

    Examples:
      | phone_number |
      | +44 7123 456789 |
      | +447123456789 |
      | +1 555 123 4567 |
      | +91 98765 43210 |

  @negative
  Scenario Outline: Invalid phone numbers show errors
    When I enter "<phone_number>" in the "Phone Number" field
    And I move focus away from the phone field
    Then I should see an error message "<error_message>"

    Examples:
      | phone_number | error_message |
      | 123 | Please enter a valid phone number |
      | abc123def | Phone number must contain only digits and valid formatting characters |