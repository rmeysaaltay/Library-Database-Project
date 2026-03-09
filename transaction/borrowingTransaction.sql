CREATE PROCEDURE oparations.sp_AddBorrowingTransaction
    @CopyCode VARCHAR(50),
    @MemberID INT,
    @StaffID INT,
    @DueDate DATE
AS
BEGIN
    -- Hata oluþtuðunda transaction'ý otomatik olarak güvenli moda alýr
    SET XACT_ABORT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- 1. ADIM: Kitap müsait mi kontrol et
        -- inventories.BookCopies tablosuna bakar
        IF NOT EXISTS (SELECT 1 FROM inventories.BookCopies WHERE CopyCode = @CopyCode AND Status = 'On Shelf')
        BEGIN
            THROW 50005, 'Kitap rafta deðil, ödünç verilemez.', 1;
        END

        -- 2. ADIM: Ýþlemi kaydet
        -- oparations.BorrowingTransactions tablosuna ekler
        INSERT INTO oparations.BorrowingTransactions (CopyCode, MemberID, BorrowingStaffID, BorrowDate, DueDate)
        VALUES (@CopyCode, @MemberID, @StaffID, GETDATE(), @DueDate);

        -- 3. ADIM: Kitap durumunu güncelle
        UPDATE inventories.BookCopies 
        SET Status = 'Borrowed' 
        WHERE CopyCode = @CopyCode;

        -- Her þey tamamsa kalýcý hale getir
        COMMIT TRANSACTION;
        PRINT 'Ýþlem baþarýyla tamamlandý.';

    END TRY
    BEGIN CATCH
        -- Hata varsa tüm adýmlarý geri al (ROLLBACK)
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END

        -- Hatanýn nedenini fýrlat
        DECLARE @ErrMsg NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrMsg, 16, 1);
    END CATCH
END;