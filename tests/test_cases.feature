# Test Cases - Horizon Registration Feature

This directory contains comprehensive BDD test specifications covering all aspects of the registration feature.

## Test Suites

### 1. User Registration (@smoke @us-001)
- Happy path: Successful registration
- Negative: Empty fields, missing terms acceptance, duplicate emails
- Boundary: Min/max name lengths, various name formats

### 2. Email Validation (@validation @us-002)
- Valid/invalid email formats
- Real-time validation
- Accessibility compliance

### 3. Phone Number Validation (@validation @us-003)
- International phone formats
- Invalid formats
- Boundary testing

### 4. Relationship Selection (@functional @us-004)
- Dropdown options
- Selection validation
- Keyboard navigation
- Accessibility

### 5. Terms and Privacy (@legal @us-005)
- Policy acceptance validation
- Link functionality
- Data capture

### 6. Support Access (@support @us-006)
- Call/email support buttons
- Navigation links
- Analytics tracking

### 7. Real-time Validation (@validation @us-007)
- Success indicators
- Error handling
- Debouncing
- Screen reader support

### 8. Performance (@performance)
- Page load times
- Validation performance
- Form submission

### 9. Security (@security)
- SQL injection prevention
- XSS protection
- CSRF tokens
- Rate limiting

### 10. Accessibility (@accessibility @a11y)
- WCAG 2.1 AA compliance
- Keyboard navigation
- Screen reader compatibility

### 11. Mobile Responsiveness (@mobile)
- Device compatibility
- Touch interactions

### 12. Cross-browser (@cross-browser)
- Chrome, Firefox, Safari, Edge
- Version compatibility

## Test Execution

```bash
# Run all tests
npm test

# Run by tag
npm test -- --tags @smoke
npm test -- --tags @critical
npm test -- --tags "@validation and @email"

# Run specific feature
npm test -- features/registration.feature
```

## Test Coverage

- **Total Scenarios**: 65+
- **Critical Priority**: 18
- **High Priority**: 24
- **Medium Priority**: 23

## Full Test Cases

For the complete Gherkin test scenarios, see:
- [Full Test Cases Document](../memory/test_cases.md) - Complete BDD scenarios with Given-When-Then steps
- Individual feature files (to be created per test framework)
