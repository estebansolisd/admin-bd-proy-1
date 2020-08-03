CREATE TABLE [dbo].[h_users](
	[id] [bigint] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[email_verified_at] [datetime] NULL,
	[password] [nvarchar](255) NOT NULL,
	[remember_token] [nvarchar](100) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedOn] [datetime] NULL,
);



