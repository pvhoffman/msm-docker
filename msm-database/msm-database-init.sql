-- appointment table
CREATE TABLE IF NOT EXISTS appt_t (appt_id SERIAL PRIMARY KEY
    , appt_summary INTEGER
    , appt_identifier VARCHAR(255));

-- billing table
CREATE TABLE IF NOT EXISTS billing_t (billing_id SERIAL PRIMARY KEY 
    , billing_contract INTEGER
    , billing_name VARCHAR(255)
    , billing_title VARCHAR(255)
    , billing_address VARCHAR(255)
    , billing_city VARCHAR(255)
    , billing_state VARCHAR(40)
    , billing_zip VARCHAR(40)
    , billing_phone VARCHAR(40)
    , billing_fax VARCHAR(40)
    , billing_email VARCHAR(255)
    , billing_address2 VARCHAR(255)
    , billing_taxid VARCHAR(40)
    , billing_paymentinfo TEXT);

-- book table
CREATE TABLE IF NOT EXISTS book_t (book_id SERIAL PRIMARY KEY
    , book_name VARCHAR(40)
    , book_desc VARCHAR(255)
    , book_life FLOAT DEFAULT 12.0
    , book_state INTEGER DEFAULT 0
    , book_tax INTEGER DEFAULT 1
    , book_flags INTEGER DEFAULT 0
    , book_mobill VARCHAR(255));


