CREATE OR ALTER PROCEDURE reservations.sp_ShowPotentialFines
AS
BEGIN
    SELECT 
        m.FirstName + ' ' + m.LastName AS [Üye],
        mt.TypeName AS [Üyelik Tipi],
        b.Title AS [Kitap],
        bt.DueDate AS [Teslim Tarihi],
        DATEDIFF(DAY, bt.DueDate, GETDATE()) AS [Gecikme Gün],
        mt.FineRatePerDay AS [Günlük Ceza Oraný],
        -- Gecikme günü ile üyenin günlük ceza oranýný çarpýyoruz
        (DATEDIFF(DAY, bt.DueDate, GETDATE()) * mt.FineRatePerDay) AS [Hesaplanan Ceza]
    FROM oparations.BorrowingTransactions bt
    JOIN members.Members m ON bt.MemberID = m.MemberID
    JOIN members.MemberTypes mt ON m.MemberTypeID = mt.MemberTypeID
    JOIN inventories.BookCopies bc ON bt.CopyCode = bc.CopyCode
    JOIN inventories.Books b ON bc.BookID = b.BookID
    WHERE bt.ReturnDate IS NULL 
      AND bt.DueDate < GETDATE();
END;
GO

CREATE PROCEDURE reservations.sp_ListPendingReservations
AS
BEGIN
    SELECT 
        MAX(r.ReservationID) AS ReservationID, -- Ayný kayýtlar varsa en sonuncuyu al
        b.Title AS [Kitap Adý],
        m.FirstName + ' ' + m.LastName AS [Üye Adý],
        MAX(r.ReservationDate) AS [Son Ýstek Tarihi],
        r.Status AS [Durum]
    FROM reservations.Reservations r
    INNER JOIN inventories.Books b ON r.BookID = b.BookID
    INNER JOIN members.Members m ON r.MemberID = m.MemberID
    WHERE r.Status= 'Pending'
    GROUP BY b.Title, m.FirstName, m.LastName, r.Status
    ORDER BY [Son Ýstek Tarihi] ASC;
END;
GO