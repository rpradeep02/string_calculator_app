# 📐 String Calculator - Rails App (TDD)

A simple Ruby on Rails application that implements the **String Calculator Kata** using **Test-Driven Development (TDD)**.  
It supports both a **web UI** and **JSON API**, and gracefully handles inputs like custom delimiters and negative numbers.

---

## 🚀 Features

- Add comma-separated or newline-separated numbers
- Supports custom single-character delimiters (e.g. `//;\n1;2`)
- Handles form input from the browser (HTML view)
- Handles API calls via JSON
- Rejects negative numbers with meaningful error messages
- Built with Minitest following TDD principles

---

## 🧪 Sample Inputs & Outputs

| Input               | Output | Notes                           |
|--------------------|--------|---------------------------------|
| `""`               | `0`    | Empty string                    |
| `"1"`              | `1`    | Single number                   |
| `"1,2"`            | `3`    | Two numbers, comma-separated    |
| `"1\n2,3"`         | `6`    | Newlines + commas               |
| `"//;\n1;2"`       | `3`    | Custom delimiter `;`            |
| `"1,-2,3"`         | Error  | Negative number not allowed     |
| `"'1,2'"`          | `3`    | Quoted input — handled gracefully |

---

## 🛠 Requirements

- Ruby 3.x
- Rails 7.x
- Bundler
- SQLite3 (default; MySQL/PostgreSQL optional)

---

## ⚙️ Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/string_calculator_app.git
cd string_calculator_app
```
### 2. Install Dependencies

```bash
bundle install
```
## 3. Set Up the Database
```
rails db:create
rails db:migrate
```

## 4. Start the Rails Server
```
rails server
```
## Open the app in your browser:
```
http://localhost:3000
```

## 🖥 Using the App (Web UI)

1. Enter numbers like 1,2, 1\n2,3, or //;\n1;2
2. Click "Calculate"
3. Results or error messages will appear below the form
4. Quoted input like '1,2' or "1,2" is cleaned automatically

## 📡 API Usage (JSON)
### ➕ Add Numbers
### GET request:
```
/add?numbers=1,2,3
```
### Response:
```
{ "result": 6 }
```
## 🚫 Negative Number Error
### GET request:
```
/add?numbers=1,-2
```
### Response:
```
{ "error": "negative numbers not allowed: -2" }
```
## 🧪 Running Tests
### Run all tests:
```
rails test
```
## Run service or controller tests individually:
```
rails test test/services/string_calculator_test.rb
rails test test/controllers/calculators_controller_test.rb
```
