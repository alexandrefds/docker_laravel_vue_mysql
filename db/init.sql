-- Cria a base de dados
CREATE DATABASE IF NOT EXISTS imob_db;

-- Cria usuário
CREATE USER IF NOT EXISTS 'imob_user'@'%' IDENTIFIED BY 'secret';

-- Dá permissões
GRANT ALL PRIVILEGES ON imob_db.* TO 'imob_user'@'%';

FLUSH PRIVILEGES;
