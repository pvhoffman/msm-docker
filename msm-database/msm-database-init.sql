-- mobile salesmagic database structure
-- mostly as it would appear within the
-- sqlite database on the iPad.

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

-- contract_book_t relation table
CREATE TABLE IF NOT EXISTS contract_book_t (contract_id INTEGER
    , book_id INTEGER);

-- contract_discount_t relation table 
CREATE TABLE IF NOT EXISTS contract_discount_t (contract_discount_id SERIAL PRIMARY KEY
    , contract_id INTEGER
    , discount_id INTEGER
    , discount_amount FLOAT
    , discount_book VARCHAR(40)
    , discount_revision INTEGER default 0
    , flags INTEGER default 0);

-- customer table
CREATE TABLE IF NOT EXISTS customer_t (customer_id SERIAL PRIMARY KEY 
    , customer_contract INTEGER
    , customer_name VARCHAR(255)
    , customer_title VARCHAR(255)
    , customer_address VARCHAR(255)
    , customer_address2 VARCHAR(255)
    , customer_city VARCHAR(255)
    , customer_state VARCHAR(40)
    , customer_zip VARCHAR(40)
    , customer_phone VARCHAR(255)
    , customer_fax VARCHAR(255)
    , customer_email VARCHAR(255)
    , customer_notes TEXT
    , customer_associate VARCHAR(255)
    , customer_geocode VARCHAR(255)
    , customer_carriernum VARCHAR(255)
    , customer_website VARCHAR(255)
    , customer_contact VARCHAR(255)
    , customer_mailname VARCHAR(255)
    , customer_mailadd VARCHAR(255)
    , customer_mailadd2 VARCHAR(255)
    , customer_mailcity VARCHAR(255)
    , customer_mailstate VARCHAR(40)
    , customer_mailzip VARCHAR(40)
    , customer_mobile VARCHAR(255)
    , customer_distaddress VARCHAR(255)
    , customer_distcsz VARCHAR(255));

-- discount table for predefined contract discount types
CREATE TABLE IF NOT EXISTS discount_t (discount_id SERIAL PRIMARY KEY
    , discount_amount FLOAT
    , discount_desc VARCHAR(255)
    , discount_num VARCHAR(40)
    , discount_line VARCHAR(40)
    , discount_type VARCHAR(40)
    , discount_flags INTEGER default 0);

-- listing_t table can concievably be anything which can be sold
CREATE TABLE IF NOT EXISTS listing_t (listing_id SERIAL PRIMARY KEY
    , contract_id INTEGER
    , item_id INTEGER
    , class_id INTEGER DEFAULT -1
    , trade_id INTEGER DEFAULT -1
    , cap_id INTEGER DEFAULT -1
    , def1 VARCHAR(255)
    , def2 VARCHAR(255)
    , phone VARCHAR(255)
    , radata VARCHAR(255)
    , listing_amount FLOAT DEFAULT 0
    , listing_book VARCHAR(255)
    , listing_revision INTEGER DEFAULT 0
    , listing_order INTEGER DEFAULT 0
    , listing_attributes INTEGER DEFAULT 0
    , listing_section VARCHAR(255)
    , listing_calloutid INTEGER DEFAULT -1
    , listing_deleted INTEGER DEFAULT 0
    , listing_ucap INTEGER DEFAULT -1
    , listing_scap INTEGER DEFAULT -1
    , listing_sortkey VARCHAR(255));

-- proof table, one contract can have many proofs
CREATE TABLE IF NOT EXISTS proof_t (proof_id SERIAL PRIMARY KEY
    , proof_contract INTEGER
    , proof_section VARCHAR(255)
    , proof_filename VARCHAR(255));

-- sales rep table
CREATE TABLE IF NOT EXISTS rep_t (rep_id SERIAL PRIMARY KEY
    , rep_code VARCHAR(40)
    , rep_mobile VARCHAR(40)
    , rep_first VARCHAR(40)
    , rep_last VARCHAR(40)
    , rep_pendcont VARCHAR(40));

-- contract table
CREATE TABLE IF NOT EXISTS contract_t (contract_id SERIAL PRIMARY KEY
    , contract_account VARCHAR(255)
    , contract_book VARCHAR(40)
    , contract_rep INTEGER
    , contract_company VARCHAR(255)
    , contract_salescode VARCHAR(255)
    , contract_signature VARCHAR(255)
    , contract_signdate VARCHAR(40)
    , contract_status INTEGER DEFAULT -1
    , contract_number VARCHAR(255) DEFAULT NULL
    , contract_notes TEXT
    , contract_signer VARCHAR(255)
    , contract_pdf VARCHAR(255)
    , contract_revision INTEGER DEFAULT 0
    , contract_copies INTEGER
    , contract_invoiceprepub INTEGER
    , contract_invoicetotal INTEGER
    , contract_invoicedatefirst VARCHAR(255)
    , contract_packetnumber VARCHAR(255)
    , contract_pif FLOAT DEFAULT 0
    , contract_tradeout FLOAT DEFAULT 0
    , contract_paymentinfo TEXT -- json object
    , contract_lastamount FLOAT DEFAULT 0
    , contract_copies2 INTEGER
    , contract_copies3 INTEGER
    , contract_copies4 INTEGER
    , contract_tax INTEGER DEFAULT 1
    , contract_invoiceinterval INTEGER DEFAULT 30
    , contract_paycode VARCHAR(255)
    , contract_telco VARCHAR(255));

-- summary table is a subset of the contract/customer tables
CREATE TABLE IF NOT EXISTS summary_t (summary_id SERIAL PRIMARY KEY 
    , summary_account VARCHAR(255)
    , summary_book VARCHAR(40)
    , summary_name VARCHAR(255)
    , summary_address VARCHAR(255)
    , summary_city VARCHAR(255)
    , summary_state VARCHAR(40)
    , summary_zip VARCHAR(40)
    , summary_phone VARCHAR(40)
    , summary_date VARCHAR(40)
    , summary_status INTEGER
    , summary_notsold_status INTEGER DEFAULT -1
    , summary_rep INTEGER
    , summary_flags INTEGER DEFAULT 0
    , summary_geocode VARCHAR(255)
    , summary_amount FLOAT);

-- payment info for a contract
CREATE TABLE IF NOT EXISTS paymentinfo_t (paymentinfo_id SERIAL PRIMARY KEY
    , paymentinfo_contract INTEGER
    , paymentinfo_amount FLOAT
    , paymentinfo_type INTEGER
    , paymentinfo_checknumber INTEGER
    , paymentinfo_checkother1 VARCHAR(40)
    , paymentinfo_checkother2 VARCHAR(40)
    , paymentinfo_checkother3 VARCHAR(40)
    , paymentinfo_cctype VARCHAR(40)
    , paymentinfo_ccname VARCHAR(255)
    , paymentinfo_ccnumber_red VARCHAR(255)
    , paymentinfo_ccnumber_black BYTEA -- always stored encrypted, private key cert not on server
    , paymentinfo_ccexpiration INTEGER
    , paymentinfo_ccother1 VARCHAR(255)
    , paymentinfo_ccother2 VARCHAR(255)
    , paymentinfo_ccother3 VARCHAR(255)
    , paymentinfo_cyclebegins INTEGER
    , paymentinfo_cycleends INTEGER
    , paymentinfo_cyclerecuresdays INTEGER
    , paymentinfo_book VARCHAR(40)
    , paymentinfo_deposit FLOAT
    , paymentinfo_data TEXT);

-- competitive info
CREATE TABLE IF NOT EXISTS competitive_t (competitive_id SERIAL PRIMARY KEY
    , competitive_contract INTEGER
    , competitive_class VARCHAR(255)
    , competitive_item VARCHAR(255)
    , competitive_amount FLOAT);

-- stores revision information for a contract, a contract can have 4 different revisions
CREATE TABLE IF NOT EXISTS revision_t (revision_id SERIAL PRIMARY KEY 
    , revision_contract INTEGER
    , revision_number INTEGER
    , revision_savedate VARCHAR(255));

-- stores the date/time of the table updates
CREATE TABLE IF NOT EXISTS update_t (update_id SERIAL PRIMARY KEY 
    , update_name VARCHAR(255)
    , update_date VARCHAR(255));

-- free listing table
CREATE TABLE IF NOT EXISTS freelisting_t (freelisting_id SERIAL PRIMARY KEY 
    , freelisting_contractid INTEGER
    , freelisting_itemid INTEGER
    , freelisting_classid INTEGER
    , freelisting_competitiveid INTEGER
    , freelisting_def1 VARCHAR(255)
    , freelisting_def2 VARCHAR(255)
    , freelisting_phone VARCHAR(255)
    , freelisting_order INTEGER
    , freelisting_added INTEGER DEFAULT 0
    , freelisting_sort VARCHAR(255)
    , freelisting_bk VARCHAR(255)
    , freelisting_class VARCHAR(255)
    , freelisting_source VARCHAR(255)
    , freelisting_forder INTEGER
    , freelisting_city VARCHAR(255)
    , freelisting_state VARCHAR(40)
    , freelisting_uid INTEGER
    , freelisting_action VARCHAR(255)
    , freelisting_zip VARCHAR(40)
    , freelisting_copies1 INTEGER DEFAULT 0
    , freelisting_copies2 INTEGER DEFAULT 0
    , freelisting_copies3 INTEGER DEFAULT 0
    , freelisting_copies4 INTEGER DEFAULT 0
    , freelisting_contact VARCHAR(255)
    , freelisting_distinfo VARCHAR(255));

-- speculative art captured on the ipad by the sales rep for a prospective customer
CREATE TABLE IF NOT EXISTS specart_t (specart_id SERIAL PRIMARY KEY 
    , specart_contract INTEGER
    , specart_filename VARCHAR(255)
    , specart_notes TEXT
    , specart_flags INTEGER DEFAULT 0);

-- relation table linking display ad items and anchor items
CREATE TABLE IF NOT EXISTS listinglink_t (listinglink_id SERIAL PRIMARY KEY
    , anchor_id INTEGER
    , display_id INTEGER);

-- user defined fields
CREATE TABLE IF NOT EXISTS udf_t (udf_id SERIAL PRIMARY KEY
    , udf_contract INTEGER
    , udf_fieldname VARCHAR(255)
    , udf_fieldvalue VARCHAR(255));

-- customer memos/notes about a customer
CREATE TABLE IF NOT EXISTS memo_t (memo_id SERIAL PRIMARY KEY
    , memo_contract INTEGER
    , memo_date VARCHAR(40)
    , memo_time VARCHAR(40)
    , memo_note TEXT
    , memo_pdate VARCHAR(40)
    , memo_pamount VARCHAR(40)
    , memo_type INTEGER
    , memo_user VARCHAR(255)
    , memo_ord INTEGER
    , memo_book VARCHAR(40));

CREATE TABLE IF NOT EXISTS revisionspec_t (revisionspec_id SERIAL PRIMARY KEY 
    , revisionspec_revision INTEGER
    , revisionspec_contractdocument VARCHAR(255));

CREATE TABLE IF NOT EXISTS contractform_t (contractform_id SERIAL PRIMARY KEY 
    , contractform_summary INTEGER
    , contractform_filename VARCHAR(255)
    , contractform_flags INTEGER);

CREATE TABLE IF NOT EXISTS graphicapproval_t (graphicapproval_id SERIAL PRIMARY KEY
    , graphicapproval_graphicid INTEGER
    , graphicapproval_graphickind INTEGER
    , graphicapproval_approved_filename VARCHAR(255)
    , graphicapproval_original_filename VARCHAR(255));

