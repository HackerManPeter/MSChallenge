USE `contososkatelibrary`;
 
/* SQLINES DEMO *** le [dbo].[book_return_record_detail]    Script Date: 9/26/2022 11:51:53 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `book_return_record_detail`(
	`detail_ID` int NOT NULL,
	`return_ID` int NOT NULL,
	`book_ID` int NOT NULL,
	`detail_numberofcopies` int NOT NULL,
 CONSTRAINT `PK_book_return_record_detail` PRIMARY KEY 
(
	`detail_ID` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[book_return_record]    Script Date: 9/26/2022 11:51:53 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `book_return_record`(
	`return_ID` int NOT NULL,
	`borrowers_ID` int NOT NULL,
	`return_datereturned` datetime(3) NULL,
 CONSTRAINT `PK_book_return_record` PRIMARY KEY 
(
	`return_ID` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[book]    Script Date: 9/26/2022 11:51:53 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `book`(
	`book_ID` int NOT NULL,
	`book_title` nvarchar(50) NOT NULL,
	`book_edition` nvarchar(50) NOT NULL,
	`book_author` nvarchar(150) NOT NULL,
	`book_publisher` nvarchar(150) NOT NULL,
	`book_copies` int NOT NULL,
	`book_costs` decimal(18, 2) NULL,
	`book_remarks` nvarchar(350) NULL,
 CONSTRAINT `PK_book` PRIMARY KEY 
(
	`book_ID` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[borrowers_record_detail]    Script Date: 9/26/2022 11:51:53 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `borrowers_record_detail`(
	`details_ID` int NOT NULL,
	`borrowers_ID` int NOT NULL,
	`book_ID` int NOT NULL,
	`detail_numberofcopies` int NOT NULL,
 CONSTRAINT `PK_borrowers_record_detail` PRIMARY KEY 
(
	`details_ID` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[borrowers_record]    Script Date: 9/26/2022 11:51:53 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `borrowers_record`(
	`borrowers_ID` int NOT NULL,
	`member_ID` int NOT NULL,
	`staff_ID` int NOT NULL,
	`borrowers_dateborrowed` datetime(3) NOT NULL,
	`borrowers_duereturndate` datetime(3) NOT NULL,
 CONSTRAINT `PK_borrowers_record` PRIMARY KEY 
(
	`borrowers_ID` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[library_staff]    Script Date: 9/26/2022 11:51:53 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `library_staff`(
	`staff_ID` int NOT NULL,
	`staff_firstname` nvarchar(50) NOT NULL,
	`staff_lastname` nvarchar(50) NOT NULL,
	`staff_mobilenumber` nvarchar(50) NULL,
	`staff_email` nvarchar(150) NULL,
	`staff_authsalt` nvarchar(150) NOT NULL,
	`staff_password` nvarchar(50) NOT NULL,
	`staff_category` nvarchar(50) NULL,
 CONSTRAINT `PK_library_staff` PRIMARY KEY 
(
	`staff_ID` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[member]    Script Date: 9/26/2022 11:51:53 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `member`(
	`member_ID` int NOT NULL,
	`member_firstname` nvarchar(50) NOT NULL,
	`member_lastname` nvarchar(50) NOT NULL,
	`member_dateofbirth` date NOT NULL,
	`member_gender` nvarchar(50) NOT NULL,
	`member_mobile` nvarchar(50) NULL,
	`member_email` nvarchar(50) NULL,
 CONSTRAINT `PK_member` PRIMARY KEY 
(
	`member_ID` ASC
) 
);
ALTER TABLE `book_return_record_detail`  ADD  CONSTRAINT `FK_book_return_record_detail_book_return_record` FOREIGN KEY(`return_ID`)
REFERENCES `book_return_record` (`return_ID`);
 

ALTER TABLE `book_return_record_detail`  ADD  CONSTRAINT `FK_book_return_record_detail_book` FOREIGN KEY(`book_ID`)
REFERENCES `book` (`book_ID`);

ALTER TABLE `book_return_record`  ADD  CONSTRAINT `FK_book_return_records_BorrowersRecord` FOREIGN KEY(`borrowers_ID`)
REFERENCES `borrowers_record` (`borrowers_ID`);

ALTER TABLE `borrowers_record_detail`  ADD  CONSTRAINT `FK_borrowers_record_detail_book` FOREIGN KEY(`book_ID`)
REFERENCES `book` (`book_ID`);
 
ALTER TABLE `borrowers_record_detail`  ADD  CONSTRAINT `FK_borrowers_record_detail_borrowers_record` FOREIGN KEY(`borrowers_ID`)
REFERENCES `borrowers_record` (`borrowers_ID`);
 
ALTER TABLE `borrowers_record`  ADD  CONSTRAINT `FK_borrowers_record_library_staff` FOREIGN KEY(`staff_ID`)
REFERENCES `library_staff` (`staff_ID`);
 
ALTER TABLE `borrowers_record`  ADD  CONSTRAINT `FK_borrowers_record_member` FOREIGN KEY(`member_ID`)
REFERENCES `member` (`member_ID`);
 
