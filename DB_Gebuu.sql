USE [DB_Gebuu]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 9/1/2024 09:18:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[Appointment_ID] [int] NOT NULL,
	[Appointment_Name] [varchar](50) NULL,
	[Appointment_Date] [date] NULL,
	[Appointment_Time] [time](7) NULL,
 CONSTRAINT [PK__Appointm__FD01B503C85A1155] PRIMARY KEY CLUSTERED 
(
	[Appointment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Batch]    Script Date: 1/7/2023 10:07:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batch](
	[Batch_ID] [varchar](50) NOT NULL,
	[Batch_ExpDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Batch_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vet]    Script Date: 1/7/2023 10:07:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vet](
	[Vet_ID] [int] NOT NULL,
	[Room_ID] [int] NULL,
	[Vet_Name] [varchar](50) NULL,
	[Vet_PhoneNo] [varchar](20) NULL,
	[Vet_Address] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Vet_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 1/7/2023 10:07:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[ID] [int] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalRecord]    Script Date: 1/7/2023 10:07:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalRecord](
	[Record_ID] [int] NOT NULL,
	[PetOwner_ID] [int] NULL,
	[Vet_ID] [int] NULL,
	[Record_Date] [date] NULL,
	[Record_Time] [time](7) NULL,
	[Record_Reason] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Record_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicine]    Script Date: 1/7/2023 10:07:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicine](
	[Med_ID] [int] NOT NULL,
	[Med_Name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Med_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 1/7/2023 10:07:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Order_ID] [int] NOT NULL,
	[PetOwner_ID] [int] NULL,
	[Room_ID] [int] NULL,
	[Appointment_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PetOwner]    Script Date: 1/7/2023 10:07:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PetOwner](
	[PetOwner_ID] [int] NOT NULL,
	[PetOwner_Name] [varchar](50) NULL,
	[PetOwner_Gender] [varchar](10) NULL,
	[PetOwner_Address] [varchar](100) NULL,
	[PetOwner_PhoneNo] [varchar](20) NULL,
	[PetOwner_EmergencyContact] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[PetOwner_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 1/7/2023 10:07:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[Room_ID] [int] NOT NULL,
	[Room_Number] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Room_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 1/7/2023 10:07:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[Stock_ID] [int] IDENTITY(1,1) NOT NULL,
	[Med_ID] [int] NULL,
	[Batch_ID] [varchar](50) NULL,
	[Stock] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Stock_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Appointment] ([Appointment_ID], [Appointment_Name], [Appointment_Date], [Appointment_Time]) VALUES (101, N'Irfan', CAST(N'2023-06-17' AS Date), CAST(N'13:00:00' AS Time))
INSERT [dbo].[Appointment] ([Appointment_ID], [Appointment_Name], [Appointment_Date], [Appointment_Time]) VALUES (102, N'Wan', CAST(N'2023-06-18' AS Date), CAST(N'13:30:00' AS Time))
GO
INSERT [dbo].[Batch] ([Batch_ID], [Batch_ExpDate]) VALUES (N'INV10001', CAST(N'2023-06-20' AS Date))
INSERT [dbo].[Batch] ([Batch_ID], [Batch_ExpDate]) VALUES (N'INV100010', CAST(N'2023-06-20' AS Date))
GO
INSERT [dbo].[Vet] ([Vet_ID], [Room_ID], [Vet_Name], [Vet_PhoneNo], [Vet_Address]) VALUES (1, 1, N'Ismadi', N'018-7891004', N'Bukit Soga')
INSERT [dbo].[Vet] ([Vet_ID], [Room_ID], [Vet_Name], [Vet_PhoneNo], [Vet_Address]) VALUES (2, 2, N'Lisa', N'015-765820', N'Taman Indah')
GO
INSERT [dbo].[Login] ([ID], [Username], [Password]) VALUES (1, N'arif', N'arif123')
GO
INSERT [dbo].[MedicalRecord] ([Record_ID], [PetOwner_ID], [Vet_ID], [Record_Date], [Record_Time], [Record_Reason]) VALUES (5, 100, 2, CAST(N'2023-06-21' AS Date), CAST(N'13:00:00' AS Time), N'Cataract')
INSERT [dbo].[MedicalRecord] ([Record_ID], [PetOwner_ID], [Vet_ID], [Record_Date], [Record_Time], [Record_Reason]) VALUES (8, 100, 2, CAST(N'2023-06-30' AS Date), CAST(N'12:00:00' AS Time), N'Wormtape')
GO
INSERT [dbo].[Medicine] ([Med_ID], [Med_Name]) VALUES (1, N'Albendazole')
GO
INSERT [dbo].[Order] ([Order_ID], [PetOwner_ID], [Room_ID], [Appointment_ID]) VALUES (1, 100, 1, NULL)
INSERT [dbo].[Order] ([Order_ID], [PetOwner_ID], [Room_ID], [Appointment_ID]) VALUES (2, 102, 2, NULL)
GO
INSERT [dbo].[PetOwner] ([PetOwner], [PetOwner_Name], [PetOwner_Gender], [PetOwner_Address], [PetOwner_PhoneNo], [PetOwner_EmergencyContact]) VALUES (100, N'Putri', N'Female', N'Jalan British Short Hair', N'016-9353444', N'016-9353333')
INSERT [dbo].[PetOwner] ([PetOwner_ID], [PetOwner_Name], [PetOwner_Gender], [PetOwner_Address], [PetOwner_PhoneNo], [PetOwner_EmergencyContact]) VALUES (101, N'Irfan', N'Male', N'C01-087, Taman Universiti', N'011-1020789', N'011-1020789')-
GO
INSERT [dbo].[Room] ([Room_ID], [Room_Number]) VALUES (1, 101)
INSERT [dbo].[Room] ([Room_ID], [Room_Number]) VALUES (2, 102)
GO
SET IDENTITY_INSERT [dbo].[Stock] ON 

INSERT [dbo].[Stock] ([Stock_ID], [Med_ID], [Batch_ID], [Stock]) VALUES (1, 1, N'INV10001', 50)
INSERT [dbo].[Stock] ([Stock_ID], [Med_ID], [Batch_ID], [Stock]) VALUES (2, 1, N'INV100010', 54)
GO
INSERT [dbo].[Stock] ([Stock_ID], [Med_ID], [Batch_ID], [Stock]) VALUES (113, 7, N'INV10003', 65)
INSERT [dbo].[Stock] ([Stock_ID], [Med_ID], [Batch_ID], [Stock]) VALUES (116, 7, N'INV10006', 65)
GO
INSERT [dbo].[Stock] ([Stock_ID], [Med_ID], [Batch_ID], [Stock]) VALUES (227, 14, N'INV100014', 62)

SET IDENTITY_INSERT [dbo].[Stock] OFF
GO
ALTER TABLE [dbo].[Vet]  WITH CHECK ADD FOREIGN KEY([Room_ID])
REFERENCES [dbo].[Room] ([Room_ID])
GO
ALTER TABLE [dbo].[MedicalRecord]  WITH CHECK ADD FOREIGN KEY([Vet_ID])
REFERENCES [dbo].[Vet] ([Vet_ID])
GO
ALTER TABLE [dbo].[MedicalRecord]  WITH CHECK ADD FOREIGN KEY([PetOwner_ID])
REFERENCES [dbo].[PetOwner] ([PetOwner_ID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([Appointment_ID])
REFERENCES [dbo].[Appointment] ([Appointment_ID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([PetOwner_ID])
REFERENCES [dbo].[PetOwner] ([PetOwner_ID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([Room_ID])
REFERENCES [dbo].[Room] ([Room_ID])
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD FOREIGN KEY([Batch_ID])
REFERENCES [dbo].[Batch] ([Batch_ID])
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD FOREIGN KEY([Med_ID])
REFERENCES [dbo].[Medicine] ([Med_ID])
GO
