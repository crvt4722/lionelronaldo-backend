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
    password varchar(200)
);

CREATE TABLE user_order(
	email varchar(50),
    shirt_type varchar(50),
    season varchar(50),
    order_time datetime,
    phone varchar(20),
    address varchar(100),
    size varchar(10),
    quantity int,
    payment_method varchar(50),
    club_or_nation varchar(50),
    player varchar(50),
    delivery_status varchar(50)
)


