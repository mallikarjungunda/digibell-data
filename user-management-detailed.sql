-- Users Table (for user registration)
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    designation VARCHAR(50) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    password_reset_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE INDEX idx_password_reset_time (user_id, password_reset_time)
);

-- UserSessions Table (for user login/logout tracking)
CREATE TABLE UserSessions (
    session_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    login_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    logout_time TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- AuditTrail Table (for auditing user actions)
CREATE TABLE AuditTrail (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    action VARCHAR(100) NOT NULL,
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- PasswordHistory Table (for storing last 5 passwords of users)
CREATE TABLE PasswordHistory (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    password_hash VARCHAR(255) NOT NULL,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- OTP Table (for storing OTPs for two-step authentication)
CREATE TABLE OTP (
    otp_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    otp_code VARCHAR(6) NOT NULL,
    otp_type ENUM('EMAIL', 'PHONE') NOT NULL,
    is_verified BOOLEAN DEFAULT false,
    expiry_time TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);


