# GHSS Management Testing

Robot Framework test automation project for GHSS Management System.

## Project Structure

```
ghss-management-testing/
├── pages/              # Page Object Model files
│   ├── base_page.robot
│   ├── login_page.robot
│   ├── dashboard_page.robot
│   ├── register_teacher_page.robot
│   ├── teacher_list_page.robot
│   └── performance_dashboard_page.robot
├── tests/              # Test cases
│   ├── admin_login_test.robot
│   ├── hamburger_menu_test.robot
│   ├── logout_test.robot
│   ├── register_teacher_test.robot
│   ├── teacher_list_test.robot
│   └── performance_dashboard_test.robot
├── resources/          # Shared resources
│   ├── common_keywords.robot
│   └── variables.robot
├── results/            # Test execution results (generated)
├── drivers/            # WebDriver executables
└── requirements.txt    # Python dependencies
```

## Setup

1. Install Python dependencies:
   ```bash
   pip install -r requirements.txt
   ```

2. Ensure WebDriver is in the `drivers/` directory

## Running Tests

Run all tests:
```bash
robot tests/
```

Run specific test:
```bash
robot --test "Test Name" tests/
```

Run with output directory:
```bash
robot -d results tests/
```

## Test Results

All test artifacts (log.html, report.html, output.xml, screenshots) are automatically generated in the `results/` directory as configured in `robot.ini`.

## Page Object Model (POM)

This project follows the Page Object Model pattern:
- **Base Page** (`pages/base_page.robot`): Common utilities and shared locators
- **Page Objects**: Each page has its own file with locators and keywords
- **Tests**: Use page object keywords, never interact directly with Selenium

## Notes

- Form fields in Teacher Registration are prefilled, so tests only submit the form
- All screenshots are saved to `results/` directory
- Test output is configured to go to `results/` by default

# hss-management-testing-
