@validation @us-002 @email
Feature: Email Address Validation

  Background:
    Given I am on the Horizon registration page
    And the "Email Address" field is visible

  @happy-path
  Scenario: Valid email format is accepted
    When I enter "valid.email@example.com" in the "Email Address" field
    And I move focus away from the email field
    Then I should not see any email validation errors
    And the field should show a green checkmark success indicator

  @negative
  Scenario Outline: Invalid email formats show appropriate errors
    When I enter "<email>" in the "Email Address" field
    And I move focus away from the email field
    Then I should see an error message "<error_message>"
    And the field should be highlighted with red border

    Examples:
      | email | error_message |
      | invalid-email | Please enter a valid email address |
      | @example.com | Please enter a valid email address |
      | user@ | Please enter a valid email address |

  @real-time
  Scenario: Real-time validation during typing
    When I start typing "invalid" in the "Email Address" field
    Then no error should be shown while typing
    When I move focus away from the field
    Then I should see validation error "Please enter a valid email address"