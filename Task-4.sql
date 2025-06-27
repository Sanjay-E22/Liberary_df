-- 1. Count total number of books
SELECT COUNT(*) AS TotalBooks FROM Books;

-- 2. Count total number of authors
SELECT COUNT(*) AS TotalAuthors FROM Authors;

-- 3. Count number of books per genre
SELECT Genre, COUNT(*) AS BooksInGenre
FROM Books
GROUP BY Genre;

-- 4. Count number of books written by each author
SELECT Authors.Name, COUNT(BookAuthors.BookID) AS BooksWritten
FROM Authors
JOIN BookAuthors ON Authors.AuthorID = BookAuthors.AuthorID
GROUP BY Authors.Name;

-- 5. Count number of loans per member
SELECT Members.Name, COUNT(Loans.LoanID) AS LoansCount
FROM Members
JOIN Loans ON Members.MemberID = Loans.MemberID
GROUP BY Members.Name;

-- 6. Average number of loans per member
SELECT AVG(LoanCount) AS AvgLoansPerMember
FROM (
  SELECT COUNT(*) AS LoanCount
  FROM Loans
  GROUP BY MemberID
) AS LoanCounts;

-- 7. Members who borrowed more than 1 book
SELECT Members.Name, COUNT(Loans.LoanID) AS TotalLoans
FROM Members
JOIN Loans ON Members.MemberID = Loans.MemberID
GROUP BY Members.Name
HAVING COUNT(Loans.LoanID) > 1;

-- 8. Genre with more than 1 book
SELECT Genre, COUNT(*) AS BookCount
FROM Books
GROUP BY Genre
HAVING COUNT(*) > 1;
