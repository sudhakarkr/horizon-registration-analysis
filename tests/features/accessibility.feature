@accessibility @a11y
Feature: Registration Form Accessibility

  @wcag @critical
  Scenario: Form meets WCAG 2.1 AA standards
    When I analyze the registration page with an accessibility tool
    Then it should pass all WCAG 2.1 AA criteria
    And all form fields should have proper labels
    And all interactive elements should be keyboard accessible

  @keyboard
  Scenario: Complete form navigation with keyboard only
    When I use only the keyboard (Tab, Shift+Tab, Enter, Space)
    Then I should be able to navigate through all form fields
    And I should be able to open dropdowns
    And I should be able to check checkboxes
    And I should be able to submit the form

  @screen-reader
  Scenario: Form is usable with screen reader
    Given I am using a screen reader (NVDA, JAWS, or VoiceOver)
    When I navigate the registration form
    Then all labels should be announced correctly
    And error messages should be announced