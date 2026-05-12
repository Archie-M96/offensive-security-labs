# Web Application Vulnerability Lab (AltoroMutual)

## Objective
This lab involved constructing a localized, offline clone of the intentionally vulnerable AltoroMutual banking portal using the XAMPP stack (Apache/MySQL) to practically demonstrate **SQL Injection (SQLi)** and **Reflected Cross-Site Scripting (XSS)**.

## 1. SQL Injection (SQLi)
* **Vulnerability:** The PHP backend accepted HTTP POST requests and concatenated them directly into the SQL query string without executing sanitization functions or using prepared statements.
* **Execution:** Bypassed authentication by supplying the boolean inferential payload `' OR '1'='1` to the username and password fields.
* **Impact:** The database evaluated the query as globally "TRUE," bypassing the credential check and dumping the entire client database of financial records.

## 2. Reflected Cross-Site Scripting (XSS)
* **Vulnerability:** A "Test Link" banner retrieved display text via an HTTP GET request parameter (`link_name`) and echoed it directly into the Document Object Model (DOM) without HTML entity encoding.
* **Execution:** Appended a malicious payload to the URL: `?link_name=<script>alert('XSS Attack Successful!')</script>`
* **Impact:** The browser interpreted the injected string as executable JavaScript, proving the application is vulnerable to session hijacking and arbitrary code execution.
