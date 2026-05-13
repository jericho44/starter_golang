-- +++ UP Migration
CREATE TABLE email_verification_tokens (
	id BIGSERIAL PRIMARY KEY,
    uuid UUID NOT NULL UNIQUE DEFAULT gen_random_uuid(),
	user_id BIGINT NOT NULL,
	token VARCHAR(255) NOT NULL UNIQUE,
	expires_at TIMESTAMP NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE INDEX idx_user_id_evt ON email_verification_tokens (user_id);
CREATE INDEX idx_token_evt ON email_verification_tokens (token);
CREATE INDEX idx_expires_at_evt ON email_verification_tokens (expires_at);

-- --- DOWN Migration
DROP TABLE IF EXISTS email_verification_tokens;