CREATE OR ALTER TRIGGER inventories.tr_CheckLocationBeforeShelving
ON inventories.BookCopies
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Eðer durum 'On Shelf' yapýlýyorsa ama LocationCode boþ býrakýlmýþsa hata döndür
    IF EXISTS (
        SELECT 1 
        FROM inserted 
        WHERE Status = 'On Shelf' 
          AND (LocationCode IS NULL OR LTRIM(RTRIM(LocationCode)) = '')
    )
    BEGIN
        RAISERROR ('HATA: Rafta (On Shelf) olan bir kitabýn konum kodu (LocationCode) boþ olamaz!', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO