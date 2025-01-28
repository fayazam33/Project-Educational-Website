create database department;
use department;

create table role(
    id int primary key,
    role varchar(20)
);

create table users(
	id int auto_increment primary key,
    name varchar(50) not null,
    username varchar(30) not null unique,
    email varchar(50) not null unique,
    image varchar(100) ,
    session varchar(7),
    role_id int default 1,
    password varchar(50) not null,
    
    foreign key(role_id) references role(id)
    on update cascade
    on delete cascade
);

create table courses(
	id varchar(10)  primary key,
    name varchar(50) not null,
    description text not null,
    session varchar(7) not null,
    teacher_id int not null,
    image varchar(100),
    upload_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    foreign key(teacher_id) references users(id)
    on update cascade
);

create table videos(
	id int auto_increment primary key,
    title varchar(200) not null,
    description text,
    thumbnail varchar(150) not null,
    url varchar(200) not null unique,
    course_id varchar(10) not null,
    upload_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    foreign key(course_id) references courses(id)
    on update cascade
    on delete cascade
);

create table comment(
	id int auto_increment primary key,
    description text not null,
    video_id int not null,
    user_id int not null,
    
    foreign key(video_id) references videos(id)
    on update cascade 
    on delete cascade,
    
    foreign key(user_id) references users(id)
    on update cascade
    on delete cascade
);
alter table comment
add column upload_date TIMESTAMP default current_timestamp;
create table reviews(
	id int auto_increment primary key,
    student int not null,
    course varchar(10) not null,
    description text,
    rating int not null,
    
    foreign key(student) references users(id)
    on update cascade 
    on delete cascade,
    foreign key (course) references courses(id)
    on update cascade
    on delete cascade
    );

-- select * from courses;
-- select * from users;
select * from videos;
-- select * from role;
insert into role
(id,role) values(1,"student"),
          (2,"teacher"),
                    (3,"admin");

insert into users(id , name, username , email , role_id , password )
values(1 , "Fayaz" ,"fam", "2000famuktadir@gmail.com", 3, "11");

insert into users (name,username,email,image,role_id,password) values("Mahmudul Hasan Rana","rana","mahmudulrana@gmail.com","",2,"password"),
													("Dr. Kamal Uddin","kamal","kamaluddin@gmail.com","",2,"password"),
                                                    ("Ratnadip Kuri","kuri","ratnadipkuri@gmail.com","",2,"password"),
                                                    ("Dr. Nazia Majadi","nazia","naziamajadi@gmail.com","",2,"password"),
                                                    ("Dr. Javed Hossain","javed","javedhossain@gmail.com","",2,"password"),
                                                    ("Fateha Khanom Bappi","Bappi","fatehakhanom@gmail.com","",2,"password");

