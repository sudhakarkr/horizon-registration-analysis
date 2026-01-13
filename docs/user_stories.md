# User Stories - Horizon Registration Feature

## Feature: User Registration (F-001)

### US-001: Register with Email and Password
**As an** executor or family member managing a deceased person's financial affairs  
**I want to** create an account using my email address and password  
**So that** I can securely access the Horizon platform to manage financial accounts

**Acceptance Criteria:**
```gherkin
Scenario: Successful registration with valid information
  Given I am on the Horizon registration page
  When I enter "John Smith" in the "Your Full Name" field
  And I enter "john.smith@example.com" in the "Email Address" field
  And I enter "+44 7123 456789" in the "Phone Number" field
  And I select "Spouse" from the "Relationship to Deceased" dropdown
  And I check the "Terms of Service" checkbox
  And I check the "Privacy Policy" checkbox
  And I click the "Start Registration" button
  Then I should see a success message
  And I should be redirected to the "Your Details" page
  And I should receive a confirmation email at "john.smith@example.com"

Scenario: Registration fails with missing required fields
  Given I am on the Horizon registration page
  When I leave the "Your Full Name" field empty
  And I enter "john.smith@example.com" in the "Email Address" field
  And I click the "Start Registration" button
  Then I should see an error message "Full name is required"
  And I should remain on the registration page

Scenario: Registration fails without accepting terms
  Given I am on the Horizon registration page
  When I enter all required fields correctly
  But I do not check the "Terms of Service" checkbox
  And I click the "Start Registration" button
  Then I should see an error message "You must agree to the Terms of Service"
  And the registration should not proceed

Scenario: Registration fails with duplicate email
  Given a user with email "john.smith@example.com" already exists
  When I try to register with the same email address
  And I complete all other required fields
  And I click the "Start Registration" button
  Then I should see an error message "This email address is already registered"
  And I should see a link to "Sign In" or "Reset Password"
```

**Priority**: Critical  
**Labels**: area:registration, user:executor, release:mvp

---

### US-002: Email Address Validation
**As a** platform administrator  
**I want to** validate email addresses during registration  
**So that** users provide valid contact information and reduce registration errors

**Acceptance Criteria:**
```gherkin
Scenario: Valid email format is accepted
  Given I am on the Horizon registration page
  When I enter "valid.email@example.com" in the "Email Address" field
  And I move focus away from the email field
  Then I should not see any email validation errors
  And the field should show a success indicator

Scenario: Invalid email format shows error
  Given I am on the Horizon registration page
  When I enter "invalid-email" in the "Email Address" field
  And I move focus away from the email field
  Then I should see an error message "Please enter a valid email address"
  And the field should be highlighted in red

Scenario: Email with special characters is validated
  Given I am on the Horizon registration page
  When I enter "user+tag@sub-domain.example.co.uk" in the "Email Address" field
  And I move focus away from the email field
  Then I should not see any email validation errors

Scenario: Empty email field shows required error on submit
  Given I am on the Horizon registration page
  When I leave the "Email Address" field empty
  And I click the "Start Registration" button
  Then I should see an error message "Email address is required"
```

**Priority**: Critical  
**Labels**: area:registration, area:validation, release:mvp

---

### US-003: Phone Number Validation
**As a** platform administrator  
**I want to** validate phone numbers during registration  
**So that** we can contact users for verification and urgent communications

**Acceptance Criteria:**
```gherkin
Scenario: Valid UK phone number is accepted
  Given I am on the Horizon registration page
  When I enter "+44 7123 456789" in the "Phone Number" field
  And I move focus away from the phone field
  Then I should not see any phone validation errors

Scenario: International phone number is accepted
  Given I am on the Horizon registration page
  When I enter "+1 555 123 4567" in the "Phone Number" field
  And I move focus away from the phone field
  Then I should not see any phone validation errors

Scenario: Invalid phone number format shows error
  Given I am on the Horizon registration page
  When I enter "123" in the "Phone Number" field
  And I move focus away from the phone field
  Then I should see an error message "Please enter a valid phone number"

Scenario: Phone number with letters shows error
  Given I am on the Horizon registration page
  When I enter "abc123def" in the "Phone Number" field
  And I move focus away from the phone field
  Then I should see an error message "Phone number must contain only digits and valid formatting characters"
```

**Priority**: High  
**Labels**: area:registration, area:validation, release:mvp

---

### US-004: Relationship to Deceased Selection
**As an** executor or family member  
**I want to** specify my relationship to the deceased  
**So that** the platform understands my legal capacity to manage the estate

**Acceptance Criteria:**
```gherkin
Scenario: Select relationship from dropdown
  Given I am on the Horizon registration page
  When I click the "Relationship to Deceased" dropdown
  Then I should see the following options:
    | Spouse/Partner |
    | Child |
    | Parent |
    | Sibling |
    | Executor |
    | Solicitor |
    | Other |
  
Scenario: Successfully select a relationship
  Given I am on the Horizon registration page
  When I click the "Relationship to Deceased" dropdown
  And I select "Executor" from the list
  Then the dropdown should display "Executor"
  And the field should be marked as valid

Scenario: Relationship is required for registration
  Given I am on the Horizon registration page
  When I complete all fields except "Relationship to Deceased"
  And I click the "Start Registration" button
  Then I should see an error message "Please select your relationship to the deceased"

Scenario: "Other" relationship option is available
  Given I am on the Horizon registration page
  When I click the "Relationship to Deceased" dropdown
  And I select "Other" from the list
  Then the dropdown should display "Other"
  And I should be able to continue with registration
```

**Priority**: High  
**Labels**: area:registration, user:executor, release:mvp

---

### US-007: Accept Terms of Service and Privacy Policy
**As a** platform administrator  
**I want to** ensure users explicitly accept our Terms of Service and Privacy Policy  
**So that** we maintain legal compliance and user consent

**Acceptance Criteria:**
```gherkin
Scenario: Both checkboxes must be checked to register
  Given I am on the Horizon registration page
  When I complete all form fields correctly
  But I do not check the "Terms of Service" checkbox
  And I do not check the "Privacy Policy" checkbox
  And I click the "Start Registration" button
  Then I should see error messages for both unchecked boxes
  And the registration should not proceed

Scenario: Terms of Service link opens in new tab
  Given I am on the Horizon registration page
  When I click the "Terms of Service" link
  Then the Terms of Service document should open in a new browser tab
  And I should remain on the registration page

Scenario: Privacy Policy link opens in new tab
  Given I am on the Horizon registration page
  When I click the "Privacy Policy" link
  Then the Privacy Policy document should open in a new browser tab
  And I should remain on the registration page

Scenario: Successfully accept both policies
  Given I am on the Horizon registration page
  When I check the "Terms of Service" checkbox
  And I check the "Privacy Policy" checkbox
  Then both checkboxes should show as checked
  And I should be able to proceed with registration
```

**Priority**: Critical  
**Labels**: area:registration, area:legal, release:mvp

---

### US-008: Access Support During Registration
**As a** user having difficulty with registration  
**I want to** easily contact support for help  
**So that** I can complete my registration successfully

**Acceptance Criteria:**
```gherkin
Scenario: Call support button displays phone number
  Given I am on the Horizon registration page
  When I scroll to the "Need assistance?" section
  Then I should see a "Call Support" button with phone icon
  And the button should be clearly visible

Scenario: Email help button opens email client
  Given I am on the Horizon registration page
  When I click the "Email Help" button
  Then my default email client should open
  And the "To" field should be pre-filled with the support email address
  And the subject should be pre-filled with "Registration Assistance Request"

Scenario: Support links in navigation are accessible
  Given I am on the Horizon registration page
  When I look at the header navigation
  Then I should see a "Support" link
  And I should see a "Contact" link
  And both should be clickable
```

**Priority**: High  
**Labels**: area:registration, area:support, release:mvp

---

### US-010: Real-time Form Validation
**As a** user filling out the registration form  
**I want to** receive immediate feedback on my inputs  
**So that** I can correct errors before submitting

**Acceptance Criteria:**
```gherkin
Scenario: Valid input shows success indicator
  Given I am on the Horizon registration page
  When I enter valid data in any form field
  And I move focus away from that field
  Then the field should show a visual success indicator
  And no error message should be displayed

Scenario: Invalid input shows error immediately
  Given I am on the Horizon registration page
  When I enter invalid data in any form field
  And I move focus away from that field
  Then the field should be highlighted with red border
  And an error message should appear below the field
  And the error message should explain what is wrong

Scenario: Error clears when input becomes valid
  Given I have an error displayed for a form field
  When I correct the input to be valid
  And I move focus away from that field
  Then the error message should disappear
  And the red highlight should be removed
  And a success indicator should appear

Scenario: All validation errors shown on submit
  Given I am on the Horizon registration page
  When I leave multiple fields empty or invalid
  And I click the "Start Registration" button
  Then all validation errors should be displayed
  And the page should scroll to the first error
  And the first invalid field should receive focus
```

**Priority**: High  
**Labels**: area:registration, area:validation, user:customer, release:mvp
