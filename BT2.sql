create database Quanlibanhang;
use Quanlibanhang;
CREATE TABLE Customer (
    cID INT PRIMARY KEY AUTO_INCREMENT,
    CName VARCHAR(255),
    cAge INT
);
CREATE TABLE Orders (
    oID INT PRIMARY KEY AUTO_INCREMENT,
    cID INT,
    oDate DATE,
    TotalPrice DECIMAL(10 , 2 ),
    FOREIGN KEY (cID)
        REFERENCES Customer (cID)
);
CREATE TABLE Product (
    pID INT PRIMARY KEY auto_increment,
    pName VARCHAR(255),
    Price int
);
CREATE TABLE OrderDetail (
    odID INT PRIMARY KEY auto_increment,
    oID INT,
    pID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    Subtotal DECIMAL(10, 2),
    FOREIGN KEY (oID) REFERENCES Orders(oID),
    FOREIGN KEY (pID) REFERENCES Product(pID)
);

insert into Customer values(1,'Minh Quân',10);
insert into customer values(2,'Ngoc Oanh',20);
insert into customer values(3,'Hong ha',50);


INSERT INTO Orders (cID, oDate, TotalPrice) VALUES (1, '2023-10-31', null);
insert into Orders (cID, oDate, TotalPrice) values (2,'2006-3-23',null);
insert into Orders (cID, oDate, TotalPrice) values (1,'2006-3-16',null);

insert into Product (pName,Price) values ('Máy giặt' ,3);
insert into Product (pName,Price)  values ('Tủ Lạnh' ,5);
insert into Product (pName,Price)  values ('Điều Hòa ' ,7);
insert into Product (pName,Price)  values ('Quạt' ,1);
insert into Product (pName,Price)  values ('Bếp Điện' ,2);

insert into orderDetail (oId,pId,Quantity) values(1,1,3);
insert into orderDetail (oId,pId,Quantity) values(1,3,7);
insert into orderDetail (oId,pId,Quantity) values(1,4,2);
insert into orderDetail (oId,pId,Quantity) values(2,1,1);
insert into orderDetail (oId,pId,Quantity) values(3,1,8);
insert into orderDetail (oId,pId,Quantity) values(2,5,4);
insert into orderDetail (oId,pId,Quantity) values(2,3,3);

select * from orders;

SELECT C.cID, C.CName, P.pID, P.pName
FROM Customer C
LEFT JOIN Orders O ON C.cID = O.cID
LEFT JOIN OrderDetail OD ON O.oID = OD.oID
LEFT JOIN Product P ON OD.pID = P.pID;

SELECT C.cID, C.CName
FROM Customer C
LEFT JOIN Orders O ON C.cID = O.cID
WHERE O.oID IS NULL;

SELECT O.oID, O.oDate, SUM(OD.Quantity * P.Price) as TotalPrice
FROM Orders O
JOIN OrderDetail OD ON O.oID = OD.oID
JOIN Product P ON OD.pID = P.pID
GROUP BY O.oID, O.oDate;