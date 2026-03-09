CREATE OR ALTER PROCEDURE inventories.sp_GetCategoryInventoryReport
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        c.CategoryName AS [Kategori],
        COUNT(DISTINCT b.BookID) AS [Farklý Kitap Sayýsý],
        COUNT(bc.CopyCode) AS [Toplam Kopya Sayýsý],
        SUM(CASE WHEN bc.Status = 'On Shelf' THEN 1 ELSE 0 END) AS [Raftaki Müsait Kitap],
        -- Doluluk Oraný Hesaplama: Ödünçteki kitaplarýn toplam kopyaya oraný
        CAST(
            (SUM(CASE WHEN bc.Status = 'Borrowed' THEN 1 ELSE 0 END) * 100.0) / 
            NULLIF(COUNT(bc.CopyCode), 0) AS DECIMAL(5,2)
        ) AS [Ödünç Verilme Oraný (%)]
    FROM inventories.Categories c
    LEFT JOIN inventories.Books b ON c.CategoryID = b.CategoryID
    LEFT JOIN inventories.BookCopies bc ON b.BookID = bc.BookID
    GROUP BY c.CategoryName
    ORDER BY [Toplam Kopya Sayýsý] DESC;
END;
GO