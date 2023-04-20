CREATE TABLE message(
	from_ text,
    to_ text,
    content text
);

CREATE TABLE user_idol(
	user_name varchar(50) primary key,
    idol text
);

CREATE TABLE user_profile(
	fullname varchar(50),
	email varchar(50) primary key,
    password varchar(50)
);

CREATE TABLE user_order(
	email varchar(50),
    club_or_country text,
    shirt_type text,
    season text,
    order_time datetime,
    phone int,
    address text,
    size varchar(10),
    quantity int,
    payment_method varchar(50)
)

