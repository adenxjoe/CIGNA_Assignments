-- Cigna Week 1 Assignment 1 SQL queries

-- 1. List books with exactly one copy
 
SELECT Title FROM BOOKS
WHERE Available_Copies = 1;

--2. List authors whose name start with a specific letter (J)

SELECT Author_Name
FROM Authors
WHERE Author_Name like "J%";

--3. List Members with no address recorded

SELECT * FROM members 
WHERE Address IS NULL;

-- 4. List borrowings with a specific borrow date

SELECT * FROM Books
WHERE Borrow-Date = TO_DATE("2025-05-23","YYYY-MM-DD");

--5. List books with publication year after 2000

SELECT * FROM Books
WHERE Publication_Date > 2000;

--6 List borrowings with no fines

SELECT * FROM Borrowings
WHERE Fine=0;

-- 7. List Members sorted by membership date in descending order.

SELECT * FROM Members 
ORDER BY Membership_date DESC;

-- 8. Count total numbers of Authors

SELECT COUNT(Author_Id) AS Total
FROM Authors;

-- 9. List books with titles containing a specific word (Potter)

SELECT Title FROM Books
WHERE Title LIKE "%POTTER%";

-- 10. List borrowings returned on a specific date 

SELECT * FROM Borrowings
WHERE TO_CHAR(Return_Date,"YYYY-MM-DD") = "2025-01-21";

-- 11. List members with a specific area code in their phone number(111)

SELECT * FROM Members
WHERE Phone LIKE "111%" OR "+111%";

-- 12 . List books sorted by title alphabetically

SELECT * FROM Books
ORDER BY TITLE ASC;

-- 13. Sum the total available copies across all books

SELECT SUM(Total_Copies) AS Total 
FROM Books;

-- 14. List borrowings with the due date in a specific month (October 2025)

SELECT * FROM Borrowings
WHERE TO_CHAR(Due_Date,"YYYY-MM") = "2025-10";


-- 15. List authors with names longer than 10 characters.

SELECT Author_Name
FROM Authors
WHERE LENGTH(Author_Name)>10;

