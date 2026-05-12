-- +migrate Up
CREATE TABLE IF NOT EXISTS refresh_tokens (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    token VARCHAR(255) NOT NULL UNIQUE,
    expires_at TIMESTAMP NOT NULL,
    revoked BOOLEAN DEFAULT FALSE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE INDEX idx_user_token ON refresh_tokens (user_id, token);
CREATE INDEX idx_expires ON refresh_tokens (expires_at);
CREATE INDEX idx_deleted_at ON refresh_tokens (deleted_at);

-- +migrate Down
DROP TABLE IF EXISTS refresh_tokens;
