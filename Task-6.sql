-- 1. Subquery in SELECT: Number of books written by each author
SELECT Name,
    (SELECT COUNT(*) 
     FROM BookAuthors 
     WHERE Authors.AuthorID = BookAuthors.AuthorID) AS BooksWritten
FROM Authors;

-- 2. Subquery in WHERE: List books borrowed by members who joined in 2024
SELECT Title
FROM Books
WHERE BookID IN (
    SELECT BookID
    FROM Loans
    WHERE MemberID IN (
        SELECT MemberID
        FROM Members
        WHERE YEAR(JoinDate) = 2024
    )
);

-- 3. Subquery in FROM: Average loans per member (nested in FROM)
SELECT AVG(MemberLoanCount) AS AvgLoans
FROM (
    SELECT COUNT(*) AS MemberLoanCount
    FROM Loans
    GROUP BY MemberID
) AS LoanCounts;

-- 4. Correlated subquery: Members who borrowed more than 1 book
SELECT Name
FROM Members m
WHERE (
    SELECT COUNT(*) 
    FROM Loans l 
    WHERE l.MemberID = m.MemberID
) > 1;

-- 5. Subquery with EXISTS: Authors who have written at least one book
SELECT Name
FROM Authors a
WHERE EXISTS (
    SELECT 1
    FROM BookAuthors ba
    WHERE ba.AuthorID = a.AuthorID
);

-- 6. Subquery with NOT EXISTS: Members who have never borrowed a book
SELECT Name
FROM Members m
WHERE NOT EXISTS (
    SELECT 1
    FROM Loans l
    WHERE l.MemberID = m.MemberID
);
