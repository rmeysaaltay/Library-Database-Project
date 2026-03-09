CREATE PROCEDURE oparations.sp_GetOverdueMembers
AS
BEGIN
    SELECT 
        m.FirstName + ' ' + m.LastName AS [Üye Adý],
        b.Title AS [Kitap Adý],
        bt.CopyCode AS [Kopya Kodu],
        bt.BorrowDate AS [Verme Tarihi],
        bt.DueDate AS [Teslim Tarihi],
        DATEDIFF(DAY, bt.DueDate, GETDATE()) AS [Gecikme Gün Sayýsý]
    FROM oparations.BorrowingTransactions bt
    JOIN members.Members m ON bt.MemberID = m.MemberID
    JOIN inventories.BookCopies bc ON bt.CopyCode = bc.CopyCode
    JOIN inventories.Books b ON bc.BookID = b.BookID
    WHERE bt.ReturnDate IS NULL -- Henüz iade edilmemiþ
      AND bt.DueDate < GETDATE(); -- Teslim tarihi bugünden eski
END;

CREATE PROCEDURE oparations.sp_CurrentBorrowedBooks
AS
BEGIN
    SELECT 
        bt.CopyCode AS [Kopya No],
        b.Title AS [Kitap],
        m.FirstName + ' ' + m.LastName AS [Alan Üye],
        bt.BorrowDate AS [Ödünç Tarihi],
        bt.DueDate AS [Beklenen Ýade]
    FROM oparations.BorrowingTransactions bt
    JOIN members.Members m ON bt.MemberID = m.MemberID
    JOIN inventories.BookCopies bc ON bt.CopyCode = bc.CopyCode
    JOIN inventories.Books b ON bc.BookID = b.BookID
    WHERE bt.ReturnDate IS NULL;
END;