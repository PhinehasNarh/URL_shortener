# URL Shortener

## Project Description
This project is a lightweight URL shortener built using **Ruby** and the **Sinatra** web framework. It allows users to shorten long URLs into compact links and redirect back to the original URL when the shortened link is accessed.


## Features
- Shorten any long URL into a smaller, unique key-based link.
- Redirect shortened URLs back to the original URL.
- In-memory database for URL storage (ideal for testing and small-scale applications).
- Simple Sinatra framework implementation for ease of use.


## Prerequisites
Before running this project, ensure you have the following installed:

1. **Ruby** (latest stable version recommended)
   - Download from [RubyInstaller for Windows](https://rubyinstaller.org/).
2. **Sinatra** gem
   - Install by running:
     ```bash
     gem install sinatra
     ```
3. **curl** or a tool like Postman for testing the API.

---

## Installation and Setup

1. Clone or download this repository to your local machine.
2. Navigate to the project folder and save the script as `url_shortener.rb`.
3. Run the script:
   ```bash
   ruby url_shortener.rb
   ```
4. The application will start, and you can access it on [http://localhost:4567](http://localhost:4567).



## API Endpoints

### **1. Home Page**
- **URL**: `/`
- **Method**: GET
- **Description**: Displays a welcome message.

### **2. Shorten a URL**
- **URL**: `/shorten`
- **Method**: POST
- **Parameters**:
  - `url` (string): The original URL to be shortened.
- **Example**:
  ```bash
  curl -X POST -d "url=https://example.com/long-url" http://localhost:4567/shorten
  ```
- **Response**: A shortened URL, e.g., `http://localhost:4567/abc123`.

### **3. Redirect to Original URL**
- **URL**: `/:short_key`
- **Method**: GET
- **Description**: Redirects to the original URL based on the provided short key.
- **Example**:
  Access `http://localhost:4567/abc123` in your browser, and it will redirect to the original URL.

---

## Example Workflow
1. Start the application by running:
   ```bash
   ruby url_shortener.rb
   ```
2. Use `curl` to shorten a URL:
   ```bash
   curl -X POST -d "url=https://www.example.com/a/very/long/url" http://localhost:4567/shorten
   ```
   Response:
   ```
   Shortened URL: http://localhost:4567/xyz789
   ```
3. Open the shortened URL (`http://localhost:4567/xyz789`) in your browser, and you will be redirected to the original URL.

---

## Code Explanation

### **Key Components**
1. **In-memory Database**:
   ```ruby
   url_database = {}
   ```
   Stores the mapping of short keys to original URLs.

2. **Shorten URL Logic**:
   ```ruby
   short_key = SecureRandom.hex(3)
   url_database[short_key] = original_url
   ```
   Generates a random 6-character key and stores it with the original URL.

3. **Redirect Logic**:
   ```ruby
   redirect original_url
   ```
   Uses the Sinatra `redirect` method to forward users to the original URL.

---

## Limitations
- URLs are stored in memory and will be lost when the application stops.
- No input validation for malformed URLs.
- Not suitable for high-traffic production environments without persistence (e.g., database integration).



## Future Enhancements
- Add a persistent database (e.g., SQLite or PostgreSQL) for storing URLs.
- Implement URL expiration.
- Add input validation to ensure valid URLs are provided.
- Create a front-end interface for users to interact with the shortener.
- Implement analytics for shortened URL usage.



## Dependencies
- [Sinatra](http://sinatrarb.com/): Lightweight web framework for Ruby.



## License
This project is licensed under the MIT License. You are free to use, modify, and distribute it as per the license terms.



## Acknowledgments
- Inspired by popular URL shorteners like Bitly.
- Thanks to the Ruby and Sinatra communities for their fantastic documentation and support.

### #ph1n3y
