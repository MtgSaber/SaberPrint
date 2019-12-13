create table User (
    User_ID integer not null unique primary key,
    Username varchar(32) not null unique,
    PasswordHash binary(32) not null
);

create table FileType (
    FileType_ID integer not null unique primary key,
    Name varchar(32) not null,
    Extension varchar(16) not null unique
);

create table File (
    File_ID integer not null unique primary key,
    AbsolutePath varchar(4096) not null unique,
    Size integer not null,

    Owner_ID integer not null,
    FileType_ID integer not null,

    foreign key(Owner_ID) references User(User_ID),
    foreign key(FileType_ID) references FileType(FileType_ID)
);

create table PrintJobStatus (
    PrintJobStatus_ID integer not null unique primary key,
    Name varchar(32) not null unique
);

create table PrintJob (
    PrintJob_ID integer not null unique primary key,
    Is_Color binary not null,
    Num_Copies integer not null,

    File_ID integer not null,
    PrintJobStatus_ID integer not null,

    foreign key(File_ID) references File(File_ID),
    foreign key(PrintJobStatus_ID) references PrintJobStatus(PrintJobStatus_ID)
);

create table PrinterStatus (
    PrinterStatus_ID integer not null unique primary key,
    Name varchar(32) not null unique
);

create table Printer (
    Printer_ID integer not null unique primary key,
    Name varchar(64) not null unique,
    Address varchar(15) not null unique,

    PrinterStatus_ID integer not null,

    foreign key(PrinterStatus_ID) references PrinterStatus(PrinterStatus_ID)
);

create table PrintJob__Printer (
    PrintJob_ID integer not null,
    Printer_ID integer not null,

    foreign key(PrintJob_ID) references PrintJob(PrintJob_ID),
    foreign key(Printer_ID) references Printer(Printer_ID)
);
