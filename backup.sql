create database encuestas;
use encuestas;
create table users(
  id varchar(20) primary key,
  fullname text not null,
  documentNumber char(20) not null unique,
  birthday timestamp not null,
  phoneNumber text not null,
  status tinyint default 0 comment '0 not activated, 1 activated, 2 deleted',
  dataVerified boolean default false,
  createdAt timestamp default CURRENT_TIMESTAMP
);

create table credentials(
  id varchar(20) primary key,
  user varchar(20) unique,
  user_email varchar(20) unique,
  password varchar(20) not null,
  createdAt timestamp default CURRENT_TIMESTAMP
);

alter table credentials add constraint fk user_credential foreign key(user) references users(id);
