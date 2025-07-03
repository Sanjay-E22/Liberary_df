-- 1. View: Book Loan Summary
-- Shows each loan with member name, book title, and loan dates
CREATE VIEW BookLoanSummary AS
SELECT 
    Loans.LoanID,
    Members.Name AS MemberName,
    Books.Title AS BookTitle,
    Loans.LoanDate,
    Loans.ReturnDate
FROM Loans
JOIN Members ON Loans.MemberID = Members.MemberID
JOIN Books ON Loans.BookID = Books.BookID;

-- Usage
SELECT * FROM BookLoanSummary;


-- 2. View: Books and their Authors
CREATE VIEW BookAuthorView AS
SELECT 
    Books.Title,
    Authors.Name AS AuthorName
FROM Books
JOIN BookAuthors ON Books.BookID = BookAuthors.BookID
JOIN Authors ON BookAuthors.AuthorID = Authors.AuthorID;

-- Usage
SELECT * FROM BookAuthorView
ORDER BY Title;


-- 3. View: Members with Number of Loans
CREATE VIEW MemberLoanCount AS
SELECT 
    Members.MemberID,
    Members.Name,
    COUNT(Loans.LoanID) AS TotalLoans
FROM Members
LEFT JOIN Loans ON Members.MemberID = Loans.MemberID
GROUP BY Members.MemberID, Members.Name;

-- Usage: Get members who borrowed more than 2 books
SELECT * FROM MemberLoanCount
WHERE TotalLoans > 2;


-- 4. View: Unreturned Books
CREATE VIEW UnreturnedBooks AS
SELECT 
    Members.Name AS MemberName,
    Books.Title AS BookTitle,
    Loans.LoanDate
FROM Loans
JOIN Members ON Loans.MemberID = Members.MemberID
JOIN Books ON Loans.BookID = Books.BookID
WHERE Loans.ReturnDate IS NULL;

-- Usage
SELECT * FROM UnreturnedBooks;
