

-- 1. ÖDÜNÇ ALMA TRIGGER'I
CREATE TRIGGER oparations.tr_AfterBorrow_UpdateStatus
ON oparations.BorrowingTransactions
AFTER INSERT
AS
BEGIN
    UPDATE bc
    SET bc.Status = 'Borrowed'
    FROM inventories.BookCopies bc
    INNER JOIN inserted i ON bc.CopyCode = i.CopyCode;
END;
GO

-- 2. ÝADE ETME TRIGGER'I
CREATE TRIGGER oparations.tr_AfterReturn_UpdateStatus
ON oparations.BorrowingTransactions
AFTER UPDATE
AS
BEGIN
    IF UPDATE(ReturnDate)
    BEGIN
        UPDATE bc
        SET bc.Status = 'On Shelf'
        FROM inventories.BookCopies bc
        INNER JOIN inserted i ON bc.CopyCode = i.CopyCode
        WHERE i.ReturnDate IS NOT NULL;
    END
END;
GO