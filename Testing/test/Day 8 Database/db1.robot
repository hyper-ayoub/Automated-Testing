*** Settings ***
Library     DatabaseLibrary
Library     Collections
Library     String
Library     OperatingSystem

*** Variables ***
${DB_HOST}      localhost
${DB_NAME}      rf
${DB_USER}      root
${DB_PASS}      ${EMPTY}
${DB_PORT}      3306
${TABLE_NAME}   test_tables
${TABLE_delete}   delete_table
${NEW_TABLE_NAME}   new_tables
${COLUMN_NAME}  column1
${NEW_COLUMN_NAME}  new_column
${NEW_COLUMN_TYPE}  INT
${TEST_USER}    test_user
${TEST_USER_PASS}    test_pass

*** Test Cases ***
Test Connection
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASS}    ${DB_HOST}    ${DB_PORT}
    Run Keyword And Return Status    Should Be True    ${TRUE}    # Test the database connection
    Disconnect From Database

Test Create Table
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASS}    ${DB_HOST}    ${DB_PORT}
    ${create_table_status}    Run Keyword And Return Status    Query    CREATE TABLE ${TABLE_NAME} (${COLUMN_NAME} INT)
    Should Be True    ${create_table_status}    # Check if table creation is successful
    Disconnect From Database
Test Create delete Table
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASS}    ${DB_HOST}    ${DB_PORT}
    ${create_table_status}    Run Keyword And Return Status    Query    CREATE TABLE ${TABLE_delete} (${COLUMN_NAME} INT)
    Should Be True    ${create_table_status}    # Check if table creation is successful
    Disconnect From Database
Test Insertion
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASS}    ${DB_HOST}    ${DB_PORT}
    ${insert_status}    Run Keyword And Return Status    Query    INSERT INTO ${TABLE_NAME} (${COLUMN_NAME}) VALUES (42)
    Should Be True    ${insert_status}    # Check if the insertion was successful
    Disconnect From Database

Test Update Table
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASS}    ${DB_HOST}    ${DB_PORT}
    ${update_table_status}    Run Keyword And Return Status    Query    ALTER TABLE ${TABLE_NAME} ADD COLUMN ${NEW_COLUMN_NAME} ${NEW_COLUMN_TYPE}
    Should Be True    ${update_table_status}    # Check if the table update was successful
    Disconnect From Database

Test Deletion
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASS}    ${DB_HOST}    ${DB_PORT}
    ${delete_table_status}    Run Keyword And Return Status    Query    DROP TABLE ${TABLE_delete}
    Should Be True    ${delete_table_status}    # Check if the table deletion was successful
    Disconnect From Database

Test Create User
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASS}    ${DB_HOST}    ${DB_PORT}
    ${create_user_status}    Run Keyword And Return Status    Query    CREATE USER ${TEST_USER} IDENTIFIED BY '${TEST_USER_PASS}'
    Should Be True    ${create_user_status}    # Check if user creation was successful
    Disconnect From Database

Test Grant Permissions
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASS}    ${DB_HOST}    ${DB_PORT}
    ${grant_status}    Run Keyword And Return Status    Query    GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO ${TEST_USER}
    Should Be True    ${grant_status}    # Check if the granting of permissions was successful
    Disconnect From Database

Test Revoke Permissions
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASS}    ${DB_HOST}    ${DB_PORT}
    ${revoke_status}    Run Keyword And Return Status    Query    REVOKE ALL PRIVILEGES ON ${DB_NAME}.* FROM ${TEST_USER}
    Should Be True    ${revoke_status}    # Check if the revoking of permissions was successful
    Disconnect From Database

Test Delete User
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASS}    ${DB_HOST}    ${DB_PORT}
    ${delete_user_status}    Run Keyword And Return Status    Query    DROP USER ${TEST_USER}
    Should Be True    ${delete_user_status}    # Check if the user deletion was successful
    Disconnect From Database
