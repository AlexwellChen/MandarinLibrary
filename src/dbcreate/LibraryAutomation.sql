use libraryautomation;
create table book(
	BookId varchar(20) not null,
    BookName varchar(20) not null,
    Press varchar(20) not null,
    Price varchar(20) not null,
    Position varchar(20) not null,
    ISBN varchar(20) not null,
    Status varchar(20) not null, --avaliable
    Category varchar(20) not null,
    PRIMARY KEY (BookId)
);

create table record(
	recordId varchar(20) not null,
    BookName varchar(20) not null,
    AcntNum varchar(20) not null,
    FineValue varchar(20) not null,
    LentDate varchar(20) not null,
    ReturnDate varchar(20) not null,
    Status varchar(20) not null, --reserved or lent
    PRIMARY KEY (recordId)
);

create table reader(
	AcntNum varchar(20) not null,
    Password varchar(20) not null,
    Email varchar(20) not null,
    bookNumber int not null,
    PRIMARY KEY(AcntNum)
);

create table librarian(
	AcntNum varchar(20) not null,
    Password varchar(20) not null,
    PRIMARY KEY(AcntNum)
);

create table admin(
	AcntNum varchar(20) not null,
    Password varchar(20) not null,
    PRIMARY KEY(AcntNum)
);

create table announcement(
	TextId varchar(20) not null,
    Text varchar(1024) not null,
    PRIMARY KEY(TextId)
);