create databases kakaoshop;
use kakaoshop;
create table kshop_client (
	cli_no int(4) not null auto_increment,
	cli_id varchar(50),     
	cli_pw varchar(50),
	cli_name varchar(50),
	primary key (cli_no)
) ENGINE=InnoDB;



