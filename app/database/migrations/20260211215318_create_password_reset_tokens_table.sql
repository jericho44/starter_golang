-- +++ UP Migration
CREATE TABLE password_reset_tokens (
	id BIGSERIAL PRIMARY KEY,
	email VARCHAR(255) NOT NULL,
	token VARCHAR(255) NOT NULL UNIQUE,
	expires_at TIMESTAMP NOT NULL,
	used_at TIMESTAMP NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_email ON password_reset_tokens (email);
CREATE INDEX idx_token ON password_reset_tokens (token);
CREATE INDEX idx_expires_at ON password_reset_tokens (expires_at);

-- --- DOWN Migration
DROP TABLE IF EXISTS password_reset_tokens;