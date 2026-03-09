-- 1. PERSONEL ROLLERÝ
INSERT INTO oparations.StaffRoles (RoleID, RoleName) VALUES (1, 'Admin'), (2, 'Librarian'), (3, 'Assistant');

-- 2. KÜTÜPHANE PERSONELÝ (20 ADET)
INSERT INTO oparations.LibraryStaff (RoleID, FirstName, LastName, UserName, PasswordHash) VALUES 
(1, 'Murat', 'Yýlmaz', 'murat1', 'pass_5979'), (3, 'Selin', 'Kaya', 'selin2', 'pass_7805'), (1, 'Hakan', 'Demir', 'hakan3', 'pass_5886'),
(3, 'Aylin', 'Öztürk', 'aylin4', 'pass_6405'), (3, 'Oðuz', 'Çelik', 'oguz5', 'pass_4888'), (1, 'Buse', 'Yýldýz', 'buse6', 'pass_6883'),
(3, 'Mert', 'Arslan', 'mert7', 'pass_8415'), (1, 'Deniz', 'Doðan', 'deniz8', 'pass_5411'), (1, 'Kaan', 'Kýlýç', 'kaan9', 'pass_2888'),
(1, 'Melis', 'Çetin', 'melis10', 'pass_9720'), (1, 'Tuna', 'Aydýn', 'tuna11', 'pass_1421'), (3, 'Ýpek', 'Erdoðan', 'ipek12', 'pass_3717'),
(1, 'Bora', 'Özkan', 'bora13', 'pass_2579'), (1, 'Gizem', 'Þahin', 'gizem14', 'pass_7662'), (1, 'Emir', 'Bulut', 'emir15', 'pass_3220'),
(2, 'Seda', 'Güneþ', 'seda16', 'pass_2459'), (1, 'Cem', 'Aksoy', 'cem17', 'pass_7478'), (2, 'Lara', 'Tekin', 'lara18', 'pass_6790'),
(2, 'Arda', 'Uçar', 'arda19', 'pass_6493'), (3, 'Nil', 'Koç', 'nil20', 'pass_2149');

-- 3. ÖDÜNÇ ALMA ÝÞLEMLERÝ (20 ADET)
-- CopyCode: KPY-1000'den KPY-1019'a kadar referans verilmiþtir.
-- MemberID ve StaffID: 1-20 arasý referans verilmiþtir.
INSERT INTO oparations.BorrowingTransactions (CopyCode, MemberID, BorrowingStaffID, ReturnStaffID, BorrowDate, DueDate, ReturnDate) VALUES 
('KPY-1000', 13, 18, 11, '2023-02-28', '2023-03-15', '2023-03-20'), ('KPY-1001', 15, 13, 16, '2023-05-04', '2023-05-19', '2023-05-11'),
('KPY-1002', 16, 1, NULL, '2023-09-05', '2023-09-20', NULL), ('KPY-1003', 11, 16, 11, '2023-02-13', '2023-02-28', '2023-02-24'),
('KPY-1004', 15, 16, 5, '2023-05-06', '2023-05-21', '2023-05-19'), ('KPY-1005', 12, 16, 14, '2023-06-14', '2023-06-29', '2023-06-30'),
('KPY-1006', 4, 17, NULL, '2023-04-30', '2023-05-15', NULL), ('KPY-1007', 17, 17, NULL, '2023-10-07', '2023-10-22', NULL),
('KPY-1008', 20, 1, NULL, '2023-03-01', '2023-03-16', NULL), ('KPY-1009', 11, 1, NULL, '2023-06-25', '2023-07-10', NULL),
('KPY-1010', 1, 5, 16, '2023-03-27', '2023-04-11', '2023-04-04'), ('KPY-1011', 8, 12, 4, '2023-09-22', '2023-10-07', '2023-10-08'),
('KPY-1012', 12, 17, NULL, '2023-05-14', '2023-05-29', NULL), ('KPY-1013', 13, 19, 17, '2023-03-03', '2023-03-18', '2023-03-14'),
('KPY-1014', 9, 5, 13, '2023-06-09', '2023-06-24', '2023-06-15'), ('KPY-1015', 12, 20, NULL, '2023-01-26', '2023-02-10', NULL),
('KPY-1016', 20, 16, 2, '2023-01-03', '2023-01-18', '2023-01-09'), ('KPY-1017', 8, 9, 17, '2023-08-11', '2023-08-26', '2023-08-28'),
('KPY-1018', 18, 10, 9, '2023-03-03', '2023-03-18', '2023-03-20'), ('KPY-1019', 6, 4, 20, '2023-03-28', '2023-04-12', '2023-04-09');

-- 4. KÝTAP YORUMLARI VE PUANLAMA (20 ADET)
INSERT INTO oparations.Reviews (BookID, MemberID, ReviewText, Rating, ReviewDate) VALUES 
(9, 14, 'Güzel bir çeviri, çok beðendim.', 5, '2024-01-11'), (1, 16, 'Dönemini çok iyi yansýtýyor.', 4, '2024-02-22'), (8, 15, 'Düþündürücü bir eser.', 5, '2024-02-08'),
(19, 16, 'Çok etkileyici bir kurgu.', 5, '2024-02-04'), (7, 4, 'Okunmasý gereken bir klasik.', 4, '2024-01-07'), (14, 3, 'Harika bir kitap, herkese öneririm.', 5, '2024-01-19'),
(3, 4, 'Beklentimin altýndaydý biraz.', 3, '2024-02-14'), (13, 7, 'Yazarýn dili çok baþarýlý.', 4, '2024-02-03'), (5, 1, 'Klasiklerin en iyilerinden biri.', 5, '2024-01-19'),
(2, 12, 'Sürükleyici bir hikaye.', 4, '2024-02-13'), (6, 18, 'Biraz aðýr ilerliyor.', 3, '2024-01-31'), (10, 11, 'Karakter tahlilleri muazzam.', 5, '2024-02-10'),
(11, 12, 'Etkileyici bir anlatým.', 4, '2024-02-23'), (12, 5, 'Mutlaka kütüphanede bulunmalý.', 5, '2024-01-09'), (15, 16, 'Keyifle okudum.', 4, '2024-03-01'),
(16, 18, 'Sýradýþý bir konu.', 4, '2024-01-05'), (17, 10, 'Yazar ufkumu açtý.', 5, '2024-01-16'), (18, 15, 'Baþucu kitabým oldu.', 5, '2024-02-15'),
(20, 15, 'Etkisi uzun süre geçmedi.', 5, '2024-01-20'), (4, 4, 'Dili biraz sade kalmýþ.', 3, '2024-02-05');