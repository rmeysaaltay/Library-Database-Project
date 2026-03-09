CREATE OR ALTER TRIGGER reservations.tr_AfterReservation_UpdateStatus
ON reservations.Reservations
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Rezerve edilen kitaba (BookID) ait, rafta duran (On Shelf) 
    -- sadece BÝR adet kopyayý 'Reserved' durumuna getir.
    UPDATE TOP (1) bc
    SET bc.Status = 'Reserved'
    FROM inventories.BookCopies bc
    INNER JOIN inserted i ON bc.BookID = i.BookID
    WHERE bc.Status = 'On Shelf';
END;
GO

CREATE OR ALTER TRIGGER reservations.tr_AfterReservation_Delete
ON reservations.Reservations
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Rezervasyonu silinen kitaba ait 'Reserved' durumundaki 
    -- bir kopyayý tekrar rafa ('On Shelf') gönder.
    UPDATE TOP (1) bc
    SET bc.Status = 'On Shelf'
    FROM inventories.BookCopies bc
    INNER JOIN deleted d ON bc.BookID = d.BookID
    WHERE bc.Status = 'Reserved';
END;
GO