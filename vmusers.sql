-- Create the users database
CREATE DATABASE IF NOT EXISTS users;

-- Switch to the users database
USE users;

-- Create a table to store session data
CREATE TABLE IF NOT EXISTS userdata (
    user_id INT,
    username VARCHAR(255),
    password VARCHAR(255)
);

-- Create another table to store VM info (ssh conn string, cpu/ram amount, the userid of the vm owner)
CREATE TABLE IF NOT EXISTS vminfo (
    vm_id INT NOT NULL AUTO_INCREMENT,
    owner_id INT NOT NULL,
    cpu VARCHAR(255),
    ram VARCHAR(255),
    connection_info VARCHAR(255)
);

-- Create a user for the database admin
CREATE USER IF NOT EXISTS 'admin'@'%' IDENTIFIED BY 'admin';

-- Grant privileges on the users database
GRANT ALL PRIVILEGES ON users.* TO 'admin'@'%';

-- Flush privileges to apply changes
FLUSH PRIVILEGES;

ALTER TABLE `userdata` ADD PRIMARY KEY (`user_id`), ADD UNIQUE KEY `username` (`username`), MODIFY `user_id` INT NOT NULL AUTO_INCREMENT;

ALTER TABLE `vminfo` ADD PRIMARY KEY (`vm_id`), MODIFY `vm_id` INT NOT NULL AUTO_INCREMENT;

INSERT INTO `userdata` (`user_id`, `username`, `password`) VALUES (1, 'admin', 'admin');
