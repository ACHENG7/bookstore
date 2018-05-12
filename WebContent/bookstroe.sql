SELECT COUNT(*) FROM t_book

SELECT NOW();

SELECT * FROM t_book WHERE CURDATE()-bookPublicDate<30;



INSERT INTO  t_book (bookId,bookName,bookPrice,bookSpecialPrice,bookPublicDate,bookAuthor)  VALUES(1,"高兴死了",45.88,0,'2018-4-1',"李盼");
INSERT INTO  t_book (bookId,bookName,bookPrice,bookSpecialPrice,bookPublicDate,bookAuthor)  VALUES(2,"余生很长，何必慌张",19.56,'1,2018-4-1',"李盼");
INSERT INTO  t_book (bookId,bookName,bookPrice,bookSpecialPrice,bookPublicDate,bookAuthor)  VALUES(3,"美国人",36.88,0,'2017-12-1',"李盼");
INSERT INTO  t_book (bookId,bookName,bookPrice,bookSpecialPrice,bookPublicDate,bookAuthor)  VALUES(4,"神秘",15.8,1,'2018-1-1',"李盼");
INSERT INTO  t_book (bookId,bookName,bookPrice,bookSpecialPrice,bookPublicDate,bookAuthor)  VALUES(5,"有效管理5大兵法",45,1,'2018-4-1',"李盼");
INSERT INTO  t_book (bookId,bookName,bookPrice,bookSpecialPrice,bookPublicDate,bookAuthor)  VALUES(6,"盘古开天",42,0,'2018-3-1',"李盼");
INSERT INTO  t_book (bookId,bookName,bookPrice,bookSpecialPrice,bookPublicDate,bookAuthor)  VALUES(7,"刚好，你也喜欢我？",12.5,0,'2018-4-1',"李盼");
INSERT INTO  t_book (bookId,bookName,bookPrice,bookSpecialPrice,bookPublicDate,bookAuthor)  VALUES(8,"刺",41.8,1,'2018-2-1',"李盼");
INSERT INTO  t_book (bookId,bookName,bookPrice,bookSpecialPrice,bookPublicDate,bookAuthor)  VALUES(9,"破梦游戏",22,0,'2018-4-1',"李盼");
INSERT INTO  t_book (bookId,bookName,bookPrice,bookSpecialPrice,bookPublicDate,bookbookstoret_bookAuthor)  VALUES(10,"刺杀骑士船长",41,1,'2018-1-1',"李盼");
INSERT INTO  t_book (bookId,bookName,bookPrice,bookSpecialPrice,bookPublicDate,bookAuthor)  VALUES(11,"我爱你妈妈",45,0,'2018-4-1',"李盼");
INSERT INTO  t_book (bookId,bookName,bookPrice,bookSpecialPrice,bookPublicDate,bookAuthor)  VALUES(12,"7分钟理财",48.88,1,'2018-4-7',"李盼");
INSERT INTO  t_book (bookId,bookName,bookPrice,bookSpecialPrice,bookPublicDate,bookAuthor)  VALUES(13,"你好世界",16,0,'2017-4-1',"李盼");


INSERT INTO  t_book (bookName,bookPrice,bookSpecialPrice,bookPublicDate,bookAuthor)  VALUES("数据库原理",32.88,1,2018-4-1,"朱珠");
INSERT INTO  t_book (bookName,bookPrice,bookSpecialPrice,bookPublicDate,bookAuthor)  VALUES("SSH框架",32.88,1,2018-4-1,"朱珠");
INSERT INTO  t_book (bookName,bookPrice,bookSpecialPrice,bookPublicDate,bookAuthor)  VALUES("JAVA",32.88,1,2018-4-1,"朱珠");
INSERT INTO  t_book (bookName,bookPrice,bookSpecialPrice,bookPublicDate,bookAuthor)  VALUES("C/C++",32.88,1,2018-4-1,"朱珠");
INSERT INTO  t_book (bookName,bookPrice,bookSpecialPrice,bookPublicDate,bookAuthor)  VALUES("Oracle",32.88,1,2018-4-1,"朱珠");
INSERT INTO  t_book (bookName,bookPrice,bookSpecialPrice,bookPublicDate,bookAuthor)  VALUES("JavaScript",32.88,1,2018-4-1,"朱珠");
INSERT INTO  t_book (bookName,bookPrice,bookSpecialPrice,bookPublicDate,bookAuthor)  VALUES("HTML5+CSS",32.88,1,2018-4-1,"朱珠");
INSERT INTO  t_book (bookName,bookPrice,bookSpecialPrice,bookPublicDate,bookAuthor)  VALUES("java编程思想",32.88,1,"2018-4-1","朱珠");

DELETE FROM t_book WHERE bookId<14;