@security @critical
Feature: Registration Security

  @sql-injection
  Scenario: Prevent SQL injection in form fields
    When I enter "'; DROP TABLE users; --" in the "Your Full Name" field
    And I submit the form
    Then the input should be sanitized
    And no SQL injection should occur

  @xss
  Scenario: Prevent XSS attacks
    When I enter "<script>alert('XSS')</script>" in the "Your Full Name" field
    And I submit the form
    Then the script should be escaped or stripped
    And no JavaScript should execute

  @csrf
  Scenario: CSRF token protection
    When I load the registration page
    Then a CSRF token should be generated
    When I submit the form
    Then the CSRF token should be validated on the server

  @rate-limiting
  Scenario: Rate limiting on registration attempts
    When I attempt to register 10 times in 1 minute
    Then I should be rate limited after 5 attempts