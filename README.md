# GHSS Management Testing

Robot Framework test automation for GHSS Management System.

## Setup

```bash
pip install -r requirements.txt
```

## Running Tests

```bash
# Run all tests
robot tests/

# Run specific test
robot --test "Test Name" tests/
```

## Project Structure

- `pages/` - Page Object Model files
- `tests/` - Test cases
- `resources/` - Shared resources and variables
- `results/` - Test execution results (auto-generated)
