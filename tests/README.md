# Test Specifications - Horizon Registration Feature

## Directory Structure

```
tests/
├── features/
│   ├── registration.feature          # US-001: Core registration scenarios
│   ├── email_validation.feature      # US-002: Email validation
│   ├── phone_validation.feature      # US-003: Phone validation
│   ├── terms_and_privacy.feature     # US-005: Legal compliance
│   ├── security.feature              # Security test scenarios
│   └── accessibility.feature         # Accessibility compliance
└── README.md                         # This file
```

## Running Tests

### Prerequisites
```bash
npm install @cucumber/cucumber playwright
```

### Execute Tests

```bash
# Run all tests
npm test

# Run by tag
npm test -- --tags @smoke
npm test -- --tags @critical
npm test -- --tags "@validation and @email"

# Run specific feature
npm test -- tests/features/registration.feature
```

## Test Coverage

- **Total Scenarios**: 65+
- **Critical Priority**: 18
- **High Priority**: 24
- **Medium Priority**: 23

### Coverage by Area
- ✅ Functional Testing: 28 scenarios
- ✅ Validation Testing: 15 scenarios
- ✅ Security Testing: 4 scenarios
- ✅ Accessibility Testing: 6 scenarios
- ✅ Performance Testing: 3 scenarios
- ✅ Mobile Testing: 4 scenarios
- ✅ Cross-browser Testing: 5 scenarios

## Test Tags

| Tag | Purpose |
|-----|---------|
| @smoke | Quick smoke tests for core functionality |
| @critical | Critical path scenarios |
| @validation | Field validation scenarios |
| @security | Security testing |
| @accessibility | WCAG compliance tests |
| @performance | Performance benchmarks |
| @mobile | Mobile responsiveness |
| @cross-browser | Browser compatibility |

## Complete Test Documentation

For the full test specification with all 65+ scenarios, see:
- [Complete Test Cases](../docs/test_cases_complete.md)
- [Project Memory](../memory/test_cases.md)