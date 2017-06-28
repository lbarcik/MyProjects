USE Library_Management_System;
CREATE TABLE Book (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (0,1),
	Title VARCHAR(60) NOT NULL,
	PublisherName VARCHAR(30)
);

CREATE TABLE Book_Authors (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (0,1),
	AuthorName VARCHAR(30) NOT NULL
);

CREATE TABLE Publisher (
	PublisherName VARCHAR(20) NOT NULL,
	Address VARCHAR(70) NOT NULL, 
	Phone VARCHAR(12) 
);

/* VARCHAR was set to low, needed to expand:*/
ALTER TABLE Publisher
ALTER COLUMN PublisherName VARCHAR(40) NOT NULL

ALTER TABLE Publisher
ALTER COLUMN Address VARCHAR(100) NOT NULL

ALTER TABLE Publisher
ALTER COLUMN Phone VARCHAR(20) NOT NULL
;

CREATE TABLE Book_Copies (
	BookID INT Foreign Key REFERENCES Book(BookID),
	BranchID INT Foreign Key REFERENCES Library_Branch(BranchID) NOT NULL, 
	NumberCopies INT NOT NULL
);

/*DROPPED TABLE BOOK_COPIES TO REMAKE WITH CHANGES*/
/*DELETED ALTER TABLE ALTER COLUMN which was meant to take away primary key for Book_Copies*/

CREATE TABLE Library_Branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	BranchName VARCHAR(12) NOT NULL,
	Address VARCHAR(60) NOT NULL
);

CREATE TABLE Borrower (
	CardNumber INT PRIMARY KEY NOT NULL,
	Name VARCHAR(20) NOT NULL,
	Address VARCHAR(60),
	Phone VARCHAR(12)
);
--Recreated Book_loans to make first 3 columns FKs. 
CREATE TABLE Book_Loans (
	BookID INT FOREIGN KEY REFERENCES Book(BookID) NOT NULL,
	BranchID INT FOREIGN KEY REFERENCES Library_Branch(BranchID) NOT NULL,
	CardNumber INT FOREIGN KEY REFERENCES Borrower(CardNumber) NOT NULL,
	DateOut DATE NOT NULL,
	DueDate DATE NOT NULL
);

INSERT INTO Book
	(Title, PublisherName)
	VALUES
	('The Lost Tribe', 'Picador USA'),
	('Outlander', 'Dell'), 
	('Dragonfly in Amber', 'Dell'),
	('Voyager', 'Dell'),
	('Drums in Autumn', 'Dell'),
	('The Fiery Cross', 'Dell'),
	('A Breath of Snow and Ashes', 'Dell'),
	('An Echo in the Bone', 'Dell'),
	('Written in My Own Hearts Blood', 'Dell'),
	('The Garden of Letters', 'Berkley'),
	('Tiny Beautiful Things', 'Vintage'),
	('The Bookseller', 'Harper'),
	('The Harbinger', 'Frontline'),
	('The Nightingale', 'St. Martins Press'),
	('The Valley of Amazement', 'ECCO'),
	('The Sex Lives of Cannibles', 'Broadway Books'),
	('Misery', 'Viking Press'),
	('Wuthering Heights', 'Norton'),
	('The Glass Castle', 'Scribner'),
	('The Red Queen', 'Touchstone')
	;

INSERT INTO Book_Authors
	(AuthorName)
	VALUES
	('Mark Lee'),
	('Diana Gabaldon'),
	('Diana Gabaldon'),
	('Diana Gabaldon'),
	('Diana Gabaldon'),
	('Diana Gabaldon'),
	('Diana Gabaldon'),
	('Diana Gabaldon'),
	('Diana Gabaldon'),
	('Alyson Richman'),
	('Cheryl Strayed'),
	('Cynthia Swanson'),
	('Jonathan Cahn'),
	('Kristin Hannah'),
	('Amy Tan'),
	('Maarten Troost'),
	('Stephen King'),
	('Emily Bronte'),
	('Jeanette Walls'),
	('Phillipa Gregory')
;

INSERT INTO Publisher
	(PublisherName, Address, Phone)
	VALUES
	('Touchstone','1230 Avenue of the Americas, New York, NY','800-555-2838'),
	('Scribner','1230 Avenue of the Americas, New York, NY','800-555-4819'),
	('Norton','500 5th Ave #6, New York, NY','800-555-8820'),
	('Viking Press','375 Hudson St, New York, NY','800-555-3847'),
	('Broadway Books','222 Rosewood Dr, Danvers, ME','800-555-3189'),
	('ECCO','10 E. 53rd St, New York, NY','800-555-9902'),
	('St. Martins Press','175 5th Ave 21st Floor, New York, NY','800-555-3488'),
	('Frontline','72 Ranson Ave NE, Grand Rapids, MI','00-555-0010'),
	('Harper','195 Broadway, New York, NY','800-555-1102'),
	('Vintage','1745 Broadway, New York, NY','800-555-9199'),
	('Berkley','375 Hudson St, New York, NY','800-555-3752'),
	('Dell','1745 Broadway, New York, NY','800-555-7765'),
	('Picador USA','175 5th Ave, New York, NY','800-=555-4356')
;
/* Turn Identity Insert ON so BookID can be established*/

SET IDENTITY_INSERT [dbo].[Book_Copies] ON
SET IDENTITY_INSERT dbo.Book_Copies OFF
GO


INSERT INTO Book_Copies
	(BookID, BranchID, NumberCopies)
	VALUES
	(0,100,2),
	(0,101,6),
	(0,102,4),
	(1,101,4),
	(1,102,4),
	(1,103,4),
	(2,101,3),
	(2,103,4),
	(3,100,4),
	(3,103,4),
	(4,102,4),
	(4,103,4),
	(5,101,2),
	(5,103,4),
	(6,100,4),
	(6,103,4),
	(7,102,3),
	(7,103,4),
	(8,100,5),
	(8,102,4),
	(8,103,4),
	(9,100,6),
	(9,101,2),
	(10,102,4),
	(11,100,2),
	(11,101,2),
	(12,100,6),
	(12,101,4),
	(12,102,5),
	(13,103,3),
	(14,100,4),
	(14,101,2),
	(15,103,4),
	(16,100,3),
	(16,101,5),
	(16,102,3),
	(17,102,4),
	(18,101,6),
	(19,100,10),
	(19,101,4),
	(19,102,2)
;


INSERT INTO Library_Branch
	(BranchName, Address)
	VALUES
	('Sharpstown','1980 31st St, Sharpstown, CO'),
	('Central','200 Central Ave, Denver, CO'),
	('Castle Rock','13501 Cut Rock Pass, Castle Rock, CO'),
	('Lone Tree','17051 Lost Cattle Pkwy, Lone Tree, CO')
;

/* Needed to ALTER Borrower Table so that I could enter the CardNUmber value*/

ALTER TABLE Borrower 
ADD UNIQUE (CardNumber);

INSERT INTO Borrower
	(CardNumber, Name, Address, Phone)
	VALUES
	(10101, 'Brian Wood','9456 Sunset Hill Blvd','303-866-8273'),
	(10495, 'Lauren Barcik','9678 Queenscliffe Dr','205-790-0107'),
	(12457, 'Jessica Northrop','10256 Ventana Mesa Dr','303-502-0025'),
	(19856, 'Meredith Smith','97 Miners Dr','303-871-7642'),
	(10007, 'Austin Smith','97 Miners Dr','303-969-1191'),
	(14509, 'Carla Beveridge','20751 Rabbit Run','303-967-7613'),
	(16204, 'Matt Arias','4789 Sunburst Way','303-764-2701'),
	(11131, 'Elizabeth Read','59 Norman Dr','205-516-9900')
;
SELECT * FROM Borrower;

INSERT INTO Book_Loans
	(BookID, BranchID, CardNumber, DateOut, DueDate)
	VALUES
	(1,103,10101,'2015/12/20','2016/01/20'),
	(2,103,10101,'2016/01/25','2016/02/25'),
	(3,103,10101,'2016/03/01','2016/04/01'),
	(4,103,10101,'2016/05/01','2016/06/01'),
	(5,103,10101,'2016/08/31','2016/10/01'),
	(0,101,10495,'2015/07/05','2015/08/05'),
	(1,103,10495,'2015/08/10','2015/09/10'),
	(2,103,10495,'2016/11/12','2016/12/12'),
	(3,103,10495,'2016/12/20','2017/01/20'),
	(4,103,10495,'2017/02/13','2017/03/15'),
	(0,102,12457,'2014/06/27','2014/07/27'),
	(1,102,12457,'2015/04/01','2015/05/03'),
	(10,102,12457,'2016/10/14','2016/11/14'),
	(12,102,12457,'2017/01/21','2017/02/21'),
	(14,102,12457,'2017/04/15','2017/05/17'),
	(19,102,12457,'2017/06/20','2017/07/20'),
	(11,101,19856,'2013/09/22','2013/10/22'),
	(12,101,19856,'2013/10/30','2013/11/29'),
	(14,101,19856,'2016/05/12','2016/06/12'),
	(19,101,19856,'2017/04/17','2017/05/19'),
	(16,101,19856,'2017/05/30','2017/06/30'),
	(0,101,10007,'2017/06/25','2017/07/25'),
	(1,101,10007,'2017/06/25','2017/07/25'),
	(2,101,10007,'2017/06/25','2017/07/25'),
	(19,101,10007,'2017/06/25','2017/07/25'),
	(11,101,10007,'2017/06/25','2017/07/25'),
	(3,101,10007,'2017/06/25','2017/07/25'),
	(11,100,14509,'2014/02/14','2014/03/16'),
	(12,100,14509,'2015/07/17','2015/08/17'),
	(14,100,14509,'2015/10/01','2015/10/31'),
	(16,100,14509,'2015/11/01','2015/11/30'),
	(18,101,14509,'2015/12/01','2015/12/30'),
	(18,101,14509,'2015/12/30','2016/01/29'),
	(5,103,16204,'2017/06/18','2017/07/18'),
	(13,103,16204,'2017/06/18','2017/07/18'),
	(6,103,16204,'2017/06/18','2017/07/18'),
	(7,103,16204,'2017/06/18','2017/07/18'),
	(8,103,16204,'2017/06/18','2017/07/18'),
	(9,103,16204,'2017/06/18','2017/07/18'),
	(13,103,11131,'2015/08/21','2015/09/20'),
	(1,103,11131,'2016/09/14','2016/10/14'),
	(2,103,11131,'2016/09/14','2016/10/14'),
	(3,103,11131,'2016/09/14','2016/10/14'),
	(4,103,11131,'2016/10/28','2016/11/27'),
	(5,103,11131,'2016/10/28','2016/11/27'),
	(6,103,11131,'2016/10/28','2016/11/27'),
	(7,103,11131,'2017/01/22','2017/02/21'),
	(8,103,11131,'2017/01/22','2017/02/21'),
	(9,103,11131,'2017/01/22','2017/02/21'),
	(15,103,10101,'2017/05/14','2017/06/14'),
	(13,103,10101,'2017/06/26','2017/07/26'),
	(10,102,10101,'2017/04/04','2017/05/04'),
	(16,101,10495,'2017/03/27','2017/04/26')
	;
	
INSERT INTO Book_Loans
	(BookID, BranchID, CardNumber, DateOut, DueDate)
	VALUES
	(19,100,10101,'2017/05/27','2017/06/27'),
	(12,100,10495,'2017/05/27','2017/06/27')
	;

/*How many copies of the book titled "The Lost Tribe" are owned by Library Branch named Sharpstown?*/

	USE Library_Management_System
	GO

	CREATE PROCEDURE dbo.spFindTitle @Title NVARCHAR(30), @BranchName NVARCHAR(30)
	AS
	SELECT Title, BranchName
	FROM Book_Copies
	INNER JOIN Book ON Book.BookID = Book_Copies.BookID
	INNER JOIN Library_Branch ON Library_Branch.BranchID = Book_Copies.BranchID
	WHERE Title = @Title AND BranchName = @BranchName
	GO

	DECLARE @Title NVARCHAR(30), @BranchName NVARCHAR(30)
	EXEC dbo.spFindTitle @Title = 'The Lost Tribe', @BranchName = 'Sharpstown' 
	

/*How many copIes of the book titled "The Lost Tribe" are owned by each library?*/

	USE Library_Management_System
	GO
	CREATE PROCEDURE dbo.spLostTribe @Title NVARCHAR(30)
	AS
	SELECT DISTINCT Book.Title, Library_Branch.BranchName, Book_Copies.NumberCopies
	FROM Book_Copies
	INNER JOIN Book ON Book.BookID = Book_Copies.BookID
	INNER JOIN Library_Branch ON Library_Branch.BranchID = Book_Copies.BranchID
	WHERE Title = @Title

	DECLARE @Title NVARCHAR(30)
	EXEC dbo.spLostTribe @Title = 'The Lost Tribe'

/* Retrieve the names of all borrowers who do not have any books checked out */
	
	USE Library_Management_System
	GO

	CREATE PROCEDURE dbo.spBooksOut @DueDate DATE 
	AS
	SELECT DISTINCT Borrower.Name, Book_Loans.DateOut, Book_Loans.DueDate, Book.Title
	FROM Book_Loans
	INNER JOIN Borrower ON Borrower.CardNumber = Book_Loans.CardNumber
	INNER JOIN Book ON Book.BookID = Book_Loans.BookID
	WHERE DueDate BETWEEN '2017/06/27' AND '2017/07/27'

/*For each book that is loaned out from Sharpstown branch and whose Due Date is today, retrieve 
	the book title, the borrower's name, and the borrowers address*/

	CREATE PROCEDURE dbo.spSharpstownBorrower @DueDate DATE , @BranchID INT
	AS
	SELECT Book_Loans.DueDate,Book_Loans.BranchID,Book.Title,Borrower.Name,Borrower.Address
	FROM Book_Loans
	INNER JOIN Borrower ON Borrower.CardNumber = Book_Loans.CardNumber
	INNER JOIN Book ON Book.BookID = Book_Loans.BookID
	WHERE DueDate = @DueDate AND BranchID = @BranchID
	GO
	
	DECLARE @DueDate Date, @BranchID INT
	EXEC dbo.spSharpstownBorrower @DueDate = '2017/06/27', @BranchID = 100
	 
/*For each library branch, retrieve the branch name and the total number of books loaned out from that branch*/

	USE Library_Management_System
	GO

	CREATE PROCEDURE dbo.spCountBooks @DateOut DATE 
	AS
	SELECT COUNT(Book_Loans.CardNumber) AS Books_Out ,Library_Branch.BranchName
	FROM Book_Loans
	INNER JOIN Library_Branch ON Library_Branch.BranchID = Book_Loans.BranchID
	WHERE DateOut = @DateOut
	GROUP BY BranchName

	EXEC dbo.spCountBooks @DateOut = '2017-06-18'

 /*Retrieve the names, addresses, and number of books checked our for all borrowers who have more than five books checked out*/

	USE Library_Management_System
	GO
	CREATE PROCEDURE dbo.spNameList 
	AS
	BEGIN
		SELECT COUNT(DateOut) AS NumBooksOut,Borrower.Name, Borrower.Address, Book_Loans.DateOut
		FROM Borrower
		INNER JOIN Book_Loans ON Book_Loans.CardNumber = Borrower.CardNumber
		GROUP BY Name,Address,DateOut
		HAVING COUNT(DateOut) >5
	END ;
	
	EXEC dbo.spNameList
	GO

/*For each book authored by Stephen Kin, retrieve the title and number of copies owned by the library branch whose name is
 Central */
	USE Library_Management_System
	GO
	CREATE PROCEDURE dbo.spAuthorSearch  @AuthorName NVARCHAR(30), @BranchName NVARCHAR(30)
	AS
	SELECT DISTINCT Book_Authors.AuthorName, Book.Title, Library_Branch.BranchName, Book_Copies.NumberCopies
	FROM Book_Authors
	INNER JOIN Book ON Book.BookID = Book_Authors.BookID
	INNER JOIN Book_Copies ON Book_Copies.BookID = Book.BookID
	INNER JOIN Library_Branch on Library_Branch.BranchID = Book_Copies.BranchID
	WHERE AuthorName = @AuthorName AND BranchName = @BranchName
	
	EXEC dbo.spAuthorSearch	@AuthorName = 'Stephen King' , @BranchName = 'Central'
	
	
	





	