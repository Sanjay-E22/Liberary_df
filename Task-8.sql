-- Switch to your database (if needed)
USE LibraryDB;

--  Stored Procedure: Get all books borrowed by a specific member
DELIMITER //

CREATE PROCEDURE GetBooksByMember(IN member_name VARCHAR(100))
BEGIN
    SELECT 
        b.Title, 
        l.LoanDate, 
        l.ReturnDate
    FROM Loans l
    JOIN Members m ON l.MemberID = m.MemberID
    JOIN Books b ON l.BookID = b.BookID
    WHERE m.Name = member_name;
END //

DELIMITER ;

-- Call the procedure
CALL GetBooksByMember('Alice');



-- Function: Count how many books a specific member borrowed
DELIMITER //

CREATE FUNCTION GetLoanCount(member_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE loan_total INT;
    SELECT COUNT(*) INTO loan_total
    FROM Loans
    WHERE MemberID = member_id;

    RETURN loan_total;
END //

DELIMITER ;

--  Use the function in a query
SELECT Name, GetLoanCount(MemberID) AS TotalLoans
FROM Members;
