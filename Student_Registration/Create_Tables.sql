 CREATE TABLE [dbo].[loc_city]
  (
     [cityid]       [INT] IDENTITY(1, 1) NOT NULL,
     [cityname]     [VARCHAR](100) NOT NULL,
     [stateid]      [INT] NOT NULL,
     [countryid]    [INT] NOT NULL,
     [citycode]     [VARCHAR](50) NOT NULL,
     [creationdate] [DATETIME] NOT NULL,
     [modified]     [DATETIME] NOT NULL,
     CONSTRAINT [PK_LOC_City] PRIMARY KEY CLUSTERED ( [cityid] ASC )WITH (
     pad_index = OFF, statistics_norecompute = OFF, ignore_dup_key = OFF,
     allow_row_locks = on, allow_page_locks = on) ON [PRIMARY]
  )
ON [PRIMARY]

go

SET ansi_padding OFF

go

/****** Object:  Table [dbo].[LOC_Country]    Script Date: 24-Jul-23 9:49:15 PM ******/
SET ansi_nulls ON

go

SET quoted_identifier ON

go

SET ansi_padding ON

go

CREATE TABLE [dbo].[loc_country]
  (
     [countryid]   [INT] IDENTITY(1, 1) NOT NULL,
     [countryname] [VARCHAR](100) NOT NULL,
     [countrycode] [VARCHAR](50) NOT NULL,
     [created]     [DATETIME] NOT NULL,
     [modified]    [DATETIME] NOT NULL,
     CONSTRAINT [PK_LOC_Country] PRIMARY KEY CLUSTERED ( [countryid] ASC )WITH (
     pad_index = OFF, statistics_norecompute = OFF, ignore_dup_key = OFF,
     allow_row_locks = on, allow_page_locks = on) ON [PRIMARY]
  )
ON [PRIMARY]

go

SET ansi_padding OFF

go

/****** Object:  Table [dbo].[LOC_State]    Script Date: 24-Jul-23 9:49:15 PM ******/
SET ansi_nulls ON

go

SET quoted_identifier ON

go

SET ansi_padding ON

go

CREATE TABLE [dbo].[loc_state]
  (
     [stateid]   [INT] IDENTITY(1, 1) NOT NULL,
     [statename] [VARCHAR](100) NOT NULL,
     [countryid] [INT] NOT NULL,
     [statecode] [VARCHAR](50) NOT NULL,
     [created]   [DATETIME] NOT NULL,
     [modified]  [DATETIME] NOT NULL,
     CONSTRAINT [PK_LOC_State] PRIMARY KEY CLUSTERED ( [stateid] ASC )WITH (
     pad_index = OFF, statistics_norecompute = OFF, ignore_dup_key = OFF,
     allow_row_locks = on, allow_page_locks = on) ON [PRIMARY]
  )
ON [PRIMARY]

go

SET ansi_padding OFF

go

/****** Object:  Table [dbo].[MST_Branch]    Script Date: 24-Jul-23 9:49:15 PM ******/
SET ansi_nulls ON

go

SET quoted_identifier ON

go

SET ansi_padding ON

go

CREATE TABLE [dbo].[mst_branch]
  (
     [branchid]   [INT] IDENTITY(1, 1) NOT NULL,
     [branchname] [VARCHAR](100) NOT NULL,
     [branchcode] [VARCHAR](100) NOT NULL,
     [created]    [DATETIME] NOT NULL,
     [modified]   [DATETIME] NOT NULL,
     CONSTRAINT [PK_MST_Branch] PRIMARY KEY CLUSTERED ( [branchid] ASC )WITH (
     pad_index = OFF, statistics_norecompute = OFF, ignore_dup_key = OFF,
     allow_row_locks = on, allow_page_locks = on) ON [PRIMARY]
  )
ON [PRIMARY]

go

SET ansi_padding OFF

go

/****** Object:  Table [dbo].[MST_Student]    Script Date: 24-Jul-23 9:49:15 PM ******/
SET ansi_nulls ON

go

SET quoted_identifier ON

go

SET ansi_padding ON

go

CREATE TABLE [dbo].[mst_student]
  (
     [studentid]       [INT] NOT NULL,
     [branchid]        [INT] NOT NULL,
     [cityid]          [INT] NOT NULL,
     [studentname]     [VARCHAR](100) NOT NULL,
     [mobilenostudent] [VARCHAR](100) NOT NULL,
     [email]           [VARCHAR](100) NOT NULL,
     [mobilenofather]  [VARCHAR](100) NULL,
     [address]         [VARCHAR](500) NULL,
     [birthdate]       [DATETIME] NULL,
     [age]             [INT] NULL,
     [isactive]        [BIT] NULL,
     [gender]          [VARCHAR](50) NULL,
     [password]        [VARCHAR](100) NULL,
     [created]         [DATETIME] NOT NULL,
     [modified]        [DATETIME] NOT NULL
     CONSTRAINT [PK_MST_Student] PRIMARY KEY CLUSTERED ( [studentid] ASC )WITH (
     pad_index = OFF, statistics_norecompute = OFF, ignore_dup_key = OFF,
     allow_row_locks = on, allow_page_locks = on) ON [PRIMARY]
  )
ON [PRIMARY]

go

SET ansi_padding OFF

go

ALTER TABLE [dbo].[loc_city]
  ADD CONSTRAINT [DF_LOC_City_CreationDate] DEFAULT (Getdate()) FOR
  [CreationDate]

go

ALTER TABLE [dbo].[loc_city]
  ADD CONSTRAINT [DF_LOC_City_Modified] DEFAULT (Getdate()) FOR [Modified]

go

ALTER TABLE [dbo].[loc_country]
  ADD CONSTRAINT [DF_LOC_Country_Created] DEFAULT (Getdate()) FOR [Created]

go

ALTER TABLE [dbo].[loc_country]
  ADD CONSTRAINT [DF_LOC_Country_Modified] DEFAULT (Getdate()) FOR [Modified]

go

ALTER TABLE [dbo].[loc_state]
  ADD CONSTRAINT [DF_LOC_State_Created] DEFAULT (Getdate()) FOR [Created]

go

ALTER TABLE [dbo].[loc_state]
  ADD CONSTRAINT [DF_LOC_State_Modified] DEFAULT (Getdate()) FOR [Modified]

go

ALTER TABLE [dbo].[mst_branch]
  ADD CONSTRAINT [DF_MST_Branch_Created] DEFAULT (Getdate()) FOR [Created]

go

ALTER TABLE [dbo].[mst_branch]
  ADD CONSTRAINT [DF_MST_Branch_Modified] DEFAULT (Getdate()) FOR [Modified]

go

ALTER TABLE [dbo].[mst_student]
  ADD CONSTRAINT [DF_MST_Student_Created] DEFAULT (Getdate()) FOR [Created]

go

ALTER TABLE [dbo].[mst_student]
  ADD CONSTRAINT [DF_MST_Student_Modified] DEFAULT (Getdate()) FOR [Modified]

go

ALTER TABLE [dbo].[loc_city]
  WITH CHECK ADD CONSTRAINT [FK_LOC_City_LOC_Country] FOREIGN KEY([countryid])
  REFERENCES [dbo].[loc_country] ([countryid])

go

ALTER TABLE [dbo].[loc_city]
  CHECK CONSTRAINT [FK_LOC_City_LOC_Country]

go

ALTER TABLE [dbo].[loc_city]
  WITH CHECK ADD CONSTRAINT [FK_LOC_City_LOC_State] FOREIGN KEY([stateid])
  REFERENCES [dbo].[loc_state] ([stateid])

go

ALTER TABLE [dbo].[loc_city]
  CHECK CONSTRAINT [FK_LOC_City_LOC_State]

go

ALTER TABLE [dbo].[loc_state]
  WITH CHECK ADD CONSTRAINT [FK_LOC_State_LOC_Country] FOREIGN KEY([countryid])
  REFERENCES [dbo].[loc_country] ([countryid])

go

ALTER TABLE [dbo].[loc_state]
  CHECK CONSTRAINT [FK_LOC_State_LOC_Country]

go

ALTER TABLE [dbo].[mst_student]
  WITH CHECK ADD CONSTRAINT [FK_MST_Student_LOC_City] FOREIGN KEY([cityid])
  REFERENCES [dbo].[loc_city] ([cityid])

go

ALTER TABLE [dbo].[mst_student]
  CHECK CONSTRAINT [FK_MST_Student_LOC_City]

go

ALTER TABLE [dbo].[mst_student]
  WITH CHECK ADD CONSTRAINT [FK_MST_Student_MST_Branch] FOREIGN KEY([branchid])
  REFERENCES [dbo].[mst_branch] ([branchid])

go

ALTER TABLE [dbo].[mst_student]
  CHECK CONSTRAINT [FK_MST_Student_MST_Branch]  
