-- 1. KATEGORÝLER
INSERT INTO inventories.Categories (CategoryName, ParentCategoryName) VALUES
('Klasik Edebiyat', NULL), ('Bilim Kurgu', NULL), ('Tarih', NULL), ('Felsefe', NULL), ('Psikoloji', NULL),
('Polisiye', NULL), ('Fantastik', NULL), ('Biyografi', NULL), ('Bilim', NULL), ('Sanat', NULL),
('Dünya Klasikleri', 1), ('Modern Klasikler', 1), ('Uzay Operasý', 2), ('Osmanlý Tarihi', 3), ('Antik Felsefe', 4),
('Klinik Psikoloji', 5), ('Gerilim', 6), ('Epik Fantastik', 7), ('Otobiyografi', 8), ('Popüler Bilim', 9);

-- 2. YAYINEVLERÝ
INSERT INTO inventories.Publishers (PublisherName, ContactEmail) VALUES
('Can Yayýnlarý', 'iletisim@canyayinlari.com'), ('Ýþ Bankasý Kültür', 'iletisim@iskultur.com.tr'),
('Yapý Kredi Yayýnlarý', 'yky@ykykultur.com.tr'), ('Metis Yayýnlarý', 'bilgi@metiskitap.com'),
('Ýletiþim Yayýnlarý', 'iletisim@iletisim.com.tr'), ('Doðan Kitap', 'info@dogankitap.com.tr'),
('Alfa Yayýnlarý', 'bilgi@alfakitap.com'), ('Everest Yayýnlarý', 'info@everestyayinlari.com'),
('Timaþ Yayýnlarý', 'bilgi@timas.com.tr'), ('Kýrmýzý Kedi', 'info@kirmizikedi.com'),
('Epsilon Yayýnevi', 'bilgi@epsilon.com'), ('Pegasus Yayýnlarý', 'info@pegasus.com'),
('Say Yayýnlarý', 'say@sayyayincilik.com'), ('April Yayýncýlýk', 'info@april.com'),
('Remzi Kitabevi', 'post@remzi.com.tr'), ('Ayrýntý Yayýnlarý', 'info@ayrintiyayinlari.com.tr'),
('Pusula Yayýncýlýk', 'info@pusula.com'), ('Nobel Akademik', 'bilgi@nobelyayin.com'),
('Palme Yayýnevi', 'info@palme.com'), ('Artemis Yayýnlarý', 'info@artemis.com');

-- 3. YAZARLAR
INSERT INTO inventories.Authors (FirstName, LastName) VALUES
('Orhan', 'Pamuk'), ('Yaþar', 'Kemal'), ('Sabahattin', 'Ali'), ('Elif', 'Þafak'), ('Zülfü', 'Livaneli'),
('Ahmet Hamdi', 'Tanpýnar'), ('Fyodor', 'Dostoyevski'), ('Lev', 'Tolstoy'), ('Franz', 'Kafka'), ('George', 'Orwell'),
('Stefan', 'Zweig'), ('Gabriel Garcia', 'Marquez'), ('Albert', 'Camus'), ('Haruki', 'Murakami'), ('J.K.', 'Rowling'),
('J.R.R.', 'Tolkien'), ('Stephen', 'King'), ('Agatha', 'Christie'), ('Dan', 'Brown'), ('Paulo', 'Coelho');

-- 4. KÝTAPLAR
INSERT INTO inventories.Books (Title, ISBN, PublicationYear, PageCount, AvgReadingHours, Format, CategoryID, PublisherID) VALUES
('Masumiyet Müzesi', '9789750506949', '2008-01-01', 592, 11.8, 'Physical', 12, 1),
('Ýnce Memed', '9789750807144', '1955-01-01', 436, 8.7, 'Physical', 11, 3),
('Kürk Mantolu Madonna', '9789753631617', '1943-01-01', 160, 3.2, 'Physical', 12, 3),
('Aþk', '9786050900132', '2009-01-01', 420, 8.4, 'Digital', 1, 6),
('Serenad', '9786050900224', '2011-01-01', 484, 9.7, 'Physical', 1, 6),
('Saatleri Ayarlama Enstitüsü', '9789753631891', '1961-01-01', 382, 7.6, 'Physical', 12, 2),
('Suç ve Ceza', '9789750719363', '1866-01-01', 687, 13.7, 'Physical', 11, 1),
('Savaþ ve Barýþ', '9789750732805', '1869-01-01', 1225, 24.5, 'Physical', 11, 1),
('Dönüþüm', '9789750719387', '1915-01-01', 80, 1.6, 'Digital', 12, 1),
('1984', '9789750719356', '1949-01-01', 352, 7.0, 'Physical', 2, 1),
('Satranç', '9789750732157', '1942-01-01', 80, 1.6, 'Physical', 12, 1),
('Yüzyýllýk Yalnýzlýk', '9789750719349', '1967-01-01', 464, 9.3, 'Digital', 11, 1),
('Yabancý', '9789750719394', '1942-01-01', 112, 2.2, 'Physical', 12, 1),
('Sahilde Kafka', '9789750503115', '2002-01-01', 656, 13.1, 'Physical', 12, 5),
('Harry Potter ve Felsefe Taþý', '9789750802941', '1997-01-01', 276, 5.5, 'Physical', 18, 3),
('Yüzüklerin Efendisi', '9789753423410', '1954-01-01', 1178, 23.6, 'Physical', 18, 10),
('O', '9789752112469', '1986-01-01', 1104, 22.1, 'Physical', 17, 7),
('Doðu Ekspresinde Cinayet', '9789752101746', '1934-01-01', 256, 5.1, 'Digital', 6, 7),
('Da Vinci Þifresi', '9789752104082', '2003-01-01', 496, 9.9, 'Physical', 6, 7),
('Simyacý', '9789750726439', '1988-01-01', 184, 3.7, 'Physical', 1, 1);

-- 5. KÝTAP-YAZAR EÞLEÞTÝRMESÝ
INSERT INTO inventories.BookAuthors (BookID, AuthorID) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(11, 11), (12, 12), (13, 13), (14, 14), (15, 15), (16, 16), (17, 17), (18, 18), (19, 19), (20, 20);

-- 6. KÝTAP KOPYALARI (FÝZÝKSEL DURUMLAR)
INSERT INTO inventories.BookCopies (CopyCode, BookID, LocationCode, Status) VALUES
('KPY-1000', 1, 'SALON-A-RAF-31', 'In Maintenance'), ('KPY-1001', 2, 'SALON-C-RAF-23', 'Borrowed'),
('KPY-1002', 3, 'SALON-B-RAF-11', 'Borrowed'), ('KPY-1003', 4, 'SALON-A-RAF-39', 'Borrowed'),
('KPY-1004', 5, 'SALON-C-RAF-9', 'On Shelf'), ('KPY-1005', 6, 'SALON-B-RAF-20', 'Reserved'),
('KPY-1006', 7, 'SALON-A-RAF-8', 'On Shelf'), ('KPY-1007', 8, 'SALON-C-RAF-15', 'Borrowed'),
('KPY-1008', 9, 'SALON-B-RAF-4', 'Reserved'), ('KPY-1009', 10, 'SALON-C-RAF-37', 'On Shelf'),
('KPY-1010', 11, 'SALON-C-RAF-41', 'Borrowed'), ('KPY-1011', 12, 'SALON-B-RAF-13', 'In Maintenance'),
('KPY-1012', 13, 'SALON-C-RAF-37', 'In Maintenance'), ('KPY-1013', 14, 'SALON-C-RAF-42', 'On Shelf'),
('KPY-1014', 15, 'SALON-C-RAF-21', 'On Shelf'), ('KPY-1015', 16, 'SALON-B-RAF-32', 'On Shelf'),
('KPY-1016', 17, 'SALON-A-RAF-43', 'Reserved'), ('KPY-1017', 18, 'SALON-C-RAF-28', 'Borrowed'),
('KPY-1018', 19, 'SALON-C-RAF-24', 'In Maintenance'), ('KPY-1019', 20, 'SALON-C-RAF-35', 'Reserved');