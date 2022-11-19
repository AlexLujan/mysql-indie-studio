CREATE VIEW view_coupon_type AS
    SELECT 
        id,
        coupon_type
    FROM
        coupon_type;

/*****************************************************/

CREATE VIEW view_employee_experience AS
    SELECT 
        id,
        name_employee_experience
    FROM
        employee_experience;

/*****************************************************/

CREATE VIEW view_employee_type AS
    SELECT 
        id,
        name_employee_type
    FROM
        employee_type;

/*****************************************************/

CREATE VIEW view_game_genre AS
    SELECT 
        id,
        game_genre
    FROM
        game_genre;

/*****************************************************/

CREATE VIEW view_platform AS
    SELECT 
        id,
        name_platform,
        abbreviation
    FROM
        platform;

/*****************************************************/

CREATE VIEW view_user_types AS
    SELECT 
        id,
        name_user_type
    FROM
        user_type;
