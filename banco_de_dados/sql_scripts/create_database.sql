DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_database WHERE datname = 'teste_intuitivecare_db') THEN
        CREATE DATABASE teste_intuitivecare_db
        WITH
        ENCODING = 'UTF8'
        LC_COLLATE = 'pt_BR.UTF-8'
        LC_CTYPE = 'pt_BR.UTF-8'
        CONNECTION LIMIT =-1;
    END IF;
END $$;