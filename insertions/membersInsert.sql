-- 1. ÜYELÝK TÝPLERÝ
INSERT INTO members.MemberTypes (MemberTypeID, TypeName, BookLimit, BorrowingPeriodDays, FineRatePerDay) VALUES 
(1, 'Student', 5, 15, 1.5), (2, 'Academic', 10, 30, 2.0), (3, 'Standart', 3, 14, 1.0);

-- 2. ÜYELER (20 ADET)
INSERT INTO members.Members (MemberTypeID, FirstName, LastName, Email, PhoneNumber, RegistrationDate) VALUES 
(1, 'Can', 'Yýlmaz', 'can.yilmaz1@example.com', '05546413513', '2023-12-15'),
(2, 'Zeynep', 'Demir', 'zeynep.demir2@example.com', '05373099734', '2023-05-07'),
(3, 'Mert', 'Kaya', 'mert.kaya3@example.com', '05342413790', '2023-10-15'),
(1, 'Selin', 'Çelik', 'selin.celik4@example.com', '05449319974', '2023-11-10'),
(2, 'Burak', 'Yýldýz', 'burak.yildiz5@example.com', '05458929529', '2023-07-06'),
(3, 'Elif', 'Öztürk', 'elif.ozturk6@example.com', '05369660828', '2023-01-08'),
(1, 'Emre', 'Arslan', 'emre.arslan7@example.com', '05413477066', '2023-08-04'),
(2, 'Deniz', 'Doðan', 'deniz.dogan8@example.com', '05352492587', '2023-04-19'),
(3, 'Arda', 'Kýlýç', 'arda.kilic9@example.com', '05335719155', '2023-02-08'),
(1, 'Melis', 'Çetin', 'melis.cetin10@example.com', '05345225350', '2023-09-16'),
(2, 'Tuna', 'Aydýn', 'tuna.aydin11@example.com', '05438895198', '2023-01-11'),
(3, 'Ýpek', 'Erdoðan', 'ipek.erdogan12@example.com', '05399621092', '2023-05-18'),
(1, 'Bora', 'Özkan', 'bora.ozkan13@example.com', '05374887768', '2023-10-11'),
(2, 'Gizem', 'Þahin', 'gizem.sahin14@example.com', '05379206540', '2023-12-08'),
(3, 'Kerem', 'Bulut', 'kerem.bulut15@example.com', '05545594059', '2023-01-21'),
(1, 'Seda', 'Güneþ', 'seda.gunes16@example.com', '05424785551', '2023-02-03'),
(2, 'Cem', 'Aksoy', 'cem.aksoy17@example.com', '05504384179', '2023-02-04'),
(3, 'Lara', 'Tekin', 'lara.tekin18@example.com', '05348886109', '2023-04-14'),
(1, 'Onur', 'Uçar', 'onur.ucar19@example.com', '05473557655', '2023-12-26'),
(2, 'Nil', 'Koç', 'nil.koc20@example.com', '05492865171', '2023-09-12');

-- 3. ÜYE DETAYLARI (ÖÐRENCÝLER)
INSERT INTO members.StudentDetails (MemberID, School, Department) VALUES 
(1, 'Boðaziçi Üniversitesi', 'Ýþletme'), (4, 'Boðaziçi Üniversitesi', 'Bilgisayar Mühendisliði'),
(7, 'ÝTÜ', 'Mimarlýk'), (10, 'ÝTÜ', 'Bilgisayar Mühendisliði'), (13, 'ÝTÜ', 'Mimarlýk'),
(16, 'Marmara Üniversitesi', 'Ýþletme'), (19, 'ODTÜ', 'Mimarlýk');

-- 4. ÜYE DETAYLARI (AKADEMÝSYENLER)
INSERT INTO members.AcademicDetails (MemberID, Universtiy, Title) VALUES 
(2, 'ODTÜ', 'Doç. Dr.'), (5, 'ODTÜ', 'Dr. Öðr. Üyesi'), (8, 'ÝTÜ', 'Doç. Dr.'),
(11, 'Boðaziçi Üniversitesi', 'Arþ. Gör.'), (14, 'ODTÜ', 'Prof. Dr.'),
(17, 'Ýstanbul Üniversitesi', 'Arþ. Gör.'), (20, 'Ýstanbul Üniversitesi', 'Doç. Dr.');

-- 5. ÜYE DETAYLARI (STANDART ÜYELER)
INSERT INTO members.StandartMembersDetails (MemberID, Adress) VALUES 
(3, 'Kadýköy, Ýstanbul No: 40'), (6, 'Kadýköy, Ýstanbul No: 54'), (9, 'Konak, Ýzmir No: 33'),
(12, 'Konak, Ýzmir No: 17'), (15, 'Kadýköy, Ýstanbul No: 88'), (18, 'Konak, Ýzmir No: 45');