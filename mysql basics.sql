-- Users Table (for user registration)
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    password_reset_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE INDEX idx_password_reset_time (user_id, password_reset_time)
);



select * from Users;
insert into users (username, email, phone )
	values ();