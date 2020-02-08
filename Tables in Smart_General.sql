--Smart General

--1
create table roles
(
rid int primary key identity(1,1),
rname varchar(50)
)

--2
create table users
(
uid int primary key identity(1,1),
uname varchar(70),
username varchar(70) unique,
upassword varchar(70),
uemail varchar(100),
rid int foreign key(rid) references Roles(rid),
ugender varchar(2),
uvalid bit,
ujoindate datetime 
)

--3
create table userCards
(
ucid int primary key identity(1,1),
uid int foreign key(uid) references users(uid),
ucbank varchar(100),
accountnumber varchar(30),
ctid int foreign key(ctid) references CardType(ctid),
cardnumber varchar(30),
cvvcode int,
ucvalid bit 
)

--4
create table Bank
(
bid int primary key identity(1,1),
bname varchar(100)
)

--5
create table CardType
(
ctid int primary key identity(1,1),
cardtype varchar(100)
)

--6
create table transactions
(
tid int primary key identity(1,1),
uid int foreign key(uid) references Users(uid),
ucid int foreign key(ucid) references userCards(ucid),
totalamount money,
tdate datetime
)

--7
create table transactionProducts
(
tpid int primary key identity(1,1),
tid int foreign key(tid) references transactions(tid),
productid int foreign key(productid) references Products(pid),
pquantity int,
amount money 
)

--8
create table userPreferences
(
upid int primary key identity(1,1),
uid int foreign key(uid) references users(uid),
productid int foreign key(productid) references Products(pid),
upProductCount int  
)

--9
create table Products
(
pid int primary key identity(1,1),
pname varchar(70),
pdescription text,
pcategoryid int foreign key(pcategoryid) references ProductCategory(pcid),
producttypeid int foreign key(producttypeid) references ProductType(ptid),
productimgurl varchar(200),
pprice money,
pquantity int,
pvalid bit,
)

--10
create table ProductType --Related with Products
(
ptid int primary key identity(1,1),
ptname varchar(100)
)

--11
create table ProductCategory  --Phones, Headsets, etc.
(
pcid int primary key identity(1,1),
pcname varchar(100)
)