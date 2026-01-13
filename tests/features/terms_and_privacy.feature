@legal @us-005 @compliance
Feature: Accept Terms of Service and Privacy Policy

  Background:
    Given I am on the Horizon registration page
    And I can see both legal agreement checkboxes

  @critical @negative
  Scenario: Cannot register without accepting Terms of Service
    When I complete all form fields correctly
    And I check the "Privacy Policy" checkbox
    But I do not check the "Terms of Service" checkbox
    And I click the "Start Registration" button
    Then I should see an error message "You must agree to the Terms of Service to continue"
    And the Terms of Service checkbox should be highlighted

  @functional
  Scenario: Terms of Service link opens in new tab
    When I click the "Terms of Service" link
    Then a new browser tab should open
    And the new tab should load the Terms of Service document
    And I should remain on the registration page in the original tab

  @happy-path
  Scenario: Successfully accept both policies
    When I check the "I agree to the Terms of Service" checkbox
    And I check the "I agree to the Privacy Policy" checkbox
    Then both checkboxes should show as checked with checkmarks
    And no error messages should be displayed