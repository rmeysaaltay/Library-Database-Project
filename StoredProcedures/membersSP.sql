CREATE PROCEDURE members.sp_GetMemberSummary
    @MemberID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. Önce ceza ve kitap sayýlarýný hesaplayalým
    ;WITH MemberStats AS (
        SELECT 
            MemberID,
            COUNT(*) AS TotalBorrowed,
            SUM(CASE WHEN ReturnDate IS NULL THEN 1 ELSE 0 END) AS CurrentlyHeld,
            SUM(CASE 
                WHEN ReturnDate IS NULL AND DueDate < GETDATE() 
                THEN DATEDIFF(DAY, DueDate, GETDATE()) 
                ELSE 0 
            END) AS TotalDelayDays
        FROM oparations.BorrowingTransactions
        WHERE MemberID = @MemberID
        GROUP BY MemberID
    )
    -- 2. Sonra üye bilgileriyle birleþtirelim
    SELECT 
        m.FirstName + ' ' + m.LastName AS [Üye Adý],
        mt.TypeName AS [Üyelik Tipi],
        ISNULL(s.TotalBorrowed, 0) AS [Toplam Alýnan],
        ISNULL(s.CurrentlyHeld, 0) AS [Þu An Elinde Olan],
        ISNULL(s.TotalDelayDays * mt.FineRatePerDay, 0) AS [Toplam Gecikme Cezasý (TL)]
    FROM members.Members m
    INNER JOIN members.MemberTypes mt ON m.MemberTypeID = mt.MemberTypeID
    LEFT JOIN MemberStats s ON m.MemberID = s.MemberID
    WHERE m.MemberID = @MemberID;
END;
GO
CREATE PROCEDURE members.sp_GetTopBorrowers
    @TopCount INT = 10 -- Varsayýlan olarak ilk 10 üyeyi getirir
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP (@TopCount)
        m.MemberID,
        m.FirstName + ' ' + m.LastName AS [Üye Adý],
        mt.TypeName AS [Üyelik Tipi],
        COUNT(bt.TransactionID) AS [Toplam Okunan Kitap],
        -- Üyenin en son ne zaman kitap aldýðýný da görelim
        MAX(bt.BorrowDate) AS [Son Ýþlem Tarihi]
    FROM members.Members m
    INNER JOIN members.MemberTypes mt ON m.MemberTypeID = mt.MemberTypeID
    LEFT JOIN oparations.BorrowingTransactions bt ON m.MemberID = bt.MemberID
    GROUP BY m.MemberID, m.FirstName, m.LastName, mt.TypeName
    HAVING COUNT(bt.TransactionID) > 0 -- Hiç kitap almayanlarý listede gösterme
    ORDER BY [Toplam Okunan Kitap] DESC;
END;
GO