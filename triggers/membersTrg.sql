CREATE TABLE members.MemberAuditLog (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    MemberID INT,
    ChangedColumn NVARCHAR(50),
    OldValue NVARCHAR(MAX),
    NewValue NVARCHAR(MAX),
    ChangeDate DATETIME DEFAULT GETDATE(),
    ChangedBy NVARCHAR(100) DEFAULT System_User
);

CREATE OR ALTER TRIGGER members.tr_Member_AuditTrail
ON members.Members
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Sadece E-posta adresi deðiþtiyse kaydet
    IF UPDATE(Email)
    BEGIN
        INSERT INTO members.MemberAuditLog (MemberID, ChangedColumn, OldValue, NewValue)
        SELECT 
            i.MemberID, 
            'Email', 
            d.Email, -- Eski Deðer
            i.Email  -- Yeni Deðer
        FROM inserted i
        INNER JOIN deleted d ON i.MemberID = d.MemberID
        WHERE i.Email <> d.Email; -- Gerçekten bir deðiþim varsa
    END

    -- Ýstersen buraya telefon veya isim soyisim takibi de ekleyebilirsin
END;
GO