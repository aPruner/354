use apershic354
/****** Object:  Table [dbo].[ActedIn]    Script Date: 3/8/2016 1:36:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ActedIn](
	[name] [varchar](255) NOT NULL,
	[title] [varchar](255) NOT NULL,
 CONSTRAINT [PK_ActedIn] PRIMARY KEY CLUSTERED 
(
	[name] ASC,
	[title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Actors]    Script Date: 3/8/2016 1:36:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Actors](
	[name] [varchar](255) NOT NULL,
	[salary] [money] NULL,
 CONSTRAINT [PK_Actors] PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Keywords]    Script Date: 3/8/2016 1:36:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Keywords](
	[keyword] [varchar](50) NULL,
	[title] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 3/8/2016 1:36:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Movie](
	[title] [varchar](255) NOT NULL,
	[year] [int] NULL,
	[genre] [varchar](50) NULL,
	[studioID] [int] NULL,
 CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED 
(
	[title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Soundtrack]    Script Date: 3/8/2016 1:36:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Soundtrack](
	[songID] [varchar](10) NOT NULL,
	[duration(sec)] [int] NULL,
	[rank] [real] NULL,
	[title] [varchar](255) NULL,
 CONSTRAINT [PK_Soundtrack] PRIMARY KEY CLUSTERED 
(
	[songID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Studio]    Script Date: 3/8/2016 1:36:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Studio](
	[studioID] [int] NOT NULL,
	[studioName] [varchar](50) NOT NULL,
	[employees] [int] NULL,
	[budget] [money] NULL,
	[est] [int] NULL,
 CONSTRAINT [PK_MovStudios] PRIMARY KEY CLUSTERED 
(
	[studioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TechStaff]    Script Date: 3/8/2016 1:36:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TechStaff](
	[sin] [int] NOT NULL,
	[fname] [varchar](255) NULL,
	[lname] [varchar](255) NOT NULL,
	[age] [int] NULL,
	[salary] [money] NULL,
	[studioID] [int] NULL,
 CONSTRAINT [PK_TechStaff] PRIMARY KEY CLUSTERED 
(
	[sin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[ActedIn]  WITH CHECK ADD  CONSTRAINT [FK_ActedIn_Actors] FOREIGN KEY([name])
REFERENCES [dbo].[Actors] ([name])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActedIn] CHECK CONSTRAINT [FK_ActedIn_Actors]
GO
ALTER TABLE [dbo].[ActedIn]  WITH CHECK ADD  CONSTRAINT [FK_ActedIn_Movie] FOREIGN KEY([title])
REFERENCES [dbo].[Movie] ([title])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActedIn] CHECK CONSTRAINT [FK_ActedIn_Movie]
GO
ALTER TABLE [dbo].[Keywords]  WITH CHECK ADD  CONSTRAINT [fk_keyword_movie] FOREIGN KEY([title])
REFERENCES [dbo].[Movie] ([title])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Keywords] CHECK CONSTRAINT [fk_keyword_movie]
GO
ALTER TABLE [dbo].[Movie]  WITH CHECK ADD  CONSTRAINT [FK_Movie_MovStudios] FOREIGN KEY([studioID])
REFERENCES [dbo].[Studio] ([studioID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Movie] CHECK CONSTRAINT [FK_Movie_MovStudios]
GO
ALTER TABLE [dbo].[Soundtrack]  WITH CHECK ADD  CONSTRAINT [FK_Soundtrack_Movie] FOREIGN KEY([title])
REFERENCES [dbo].[Movie] ([title])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Soundtrack] CHECK CONSTRAINT [FK_Soundtrack_Movie]
GO
ALTER TABLE [dbo].[TechStaff]  WITH CHECK ADD  CONSTRAINT [FK_TechStaff_MovStudios] FOREIGN KEY([studioID])
REFERENCES [dbo].[Studio] ([studioID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[TechStaff] CHECK CONSTRAINT [FK_TechStaff_MovStudios]
GO
