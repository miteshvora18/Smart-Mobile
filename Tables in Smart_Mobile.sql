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
upProductCount int,
viewTime datetime  
)

--9
create table Products
(
pid int primary key identity(1,1),
pname varchar(70),
pdescription text,
pcategoryid int foreign key(pcategoryid) references ProductCategory(pcid),
producttypeid int foreign key(producttypeid) references ProductType(ptid),
pcompany int foreign key(pcompany) references Company(coid),
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
create table Company
(
coid int primary key identity(1,1),
cname varchar(100)
)

--12
create table ProductCategory  --Phones, Headsets, etc.
(
pcid int primary key identity(1,1),
pcname varchar(100)
)

--13
create table AdminData
(
adid int identity(1,1) primary key,
uid int foreign key(uid) references Users(uid),
upid int foreign key(upid) references userPreferences(upid),
loginTime datetime,
logoutTime datetime
)


--Roles
insert into roles values('Admin')
insert into roles values('User')

--Users
insert into users values('Amish Vora','amishvora','amish.vora','amish_vora7018@rediffmail.com',2,'M',1,'08/24/2013 13:20:00')
insert into users values('Mitesh Vora','miteshvora','mitesh.vora','miteshvora18@gmail.com',1,'M',1,'08/24/2013 13:20:00')
select * from users


Select rname from users u join roles r on u.rid=r.rid where username='amishvora' and upassword='amish.vora'

--ProductCategory
INSERT INTO PRODUCTCATEGORY VALUES('Mobile')
insert into productcategory values('Headset')
insert into productcategory values('Charger')

--ProductType
insert into producttype values('Nokia 500')

--Products
insert into products values('Nokia 500','Curved and comfortable to use, with colourful swappable covers so you can customise your smartphone to suit your style. Feels great and looks great.',1,1,'~/Includes/Mobile/Nokia 500.png',10000,20,1,1)

--Company
insert into company values('Nokia'),('Samsung'),('Apple'),('Micromax')