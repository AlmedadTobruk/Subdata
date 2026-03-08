USE [master]
GO
/****** Object:  Database [USER_DATA]    Script Date: 08/03/2026 11:20:50 ص ******/
CREATE DATABASE [USER_DATA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'USER_DATA', FILENAME = N'D:\SYSTEMS\ALMEDADSOFT_GOLDENSYSTEM\SYSTEM_SALES\DATA\USER_DATA.mdf' , SIZE = 3392KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'USER_DATA_log', FILENAME = N'D:\SYSTEMS\ALMEDADSOFT_GOLDENSYSTEM\SYSTEM_SALES\DATA\USER_DATA_log.ldf' , SIZE = 38016KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [USER_DATA] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [USER_DATA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [USER_DATA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [USER_DATA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [USER_DATA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [USER_DATA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [USER_DATA] SET ARITHABORT OFF 
GO
ALTER DATABASE [USER_DATA] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [USER_DATA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [USER_DATA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [USER_DATA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [USER_DATA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [USER_DATA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [USER_DATA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [USER_DATA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [USER_DATA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [USER_DATA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [USER_DATA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [USER_DATA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [USER_DATA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [USER_DATA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [USER_DATA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [USER_DATA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [USER_DATA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [USER_DATA] SET RECOVERY FULL 
GO
ALTER DATABASE [USER_DATA] SET  MULTI_USER 
GO
ALTER DATABASE [USER_DATA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [USER_DATA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [USER_DATA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [USER_DATA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [USER_DATA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [USER_DATA] COLLATE Arabic_CI_AS 
GO
USE [USER_DATA]
GO
/****** Object:  User [wesam]    Script Date: 08/03/2026 11:20:50 ص ******/
CREATE USER [wesam] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[send_to_net]    Script Date: 08/03/2026 11:20:50 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[send_to_net](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_s] [int] NULL,
	[point_id] [int] NULL,
	[statement] [nvarchar](4000) NULL,
	[read_date] [smalldatetime] NULL,
	[typ] [int] NULL,
	[Done] [int] NULL,
 CONSTRAINT [PK_send_to_net] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[send_to_net] ADD  CONSTRAINT [DF_send_to_net_read_date]  DEFAULT (getdate()) FOR [read_date]
GO
ALTER TABLE [dbo].[send_to_net] ADD  CONSTRAINT [DF_send_to_net_typ]  DEFAULT ((0)) FOR [typ]
GO
ALTER TABLE [dbo].[send_to_net] ADD  CONSTRAINT [DF_send_to_net_Done]  DEFAULT ((0)) FOR [Done]
GO
/****** Object:  StoredProcedure [dbo].[ard_details]    Script Date: 08/03/2026 11:20:51 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ard_details]   @state int,@id int,@exequte nvarchar(50),@point_num int,@user_id int,@file_name nvarchar(50), @typ_file nvarchar(50), 
@srch_item nvarchar(50), @srch_cust nvarchar(50), @srch_file nvarchar(50)
as

if @point_num=-1 set @point_num=null
if @id=-1 set @id=null
if @user_id=-1 set @user_id=null
if @id=-1 set @id=null

if @state=0
   begin
       SELECT     id, exequte, point_num, read_date, user_id, file_name, typ_file, srch_item, srch_cust, srch_file
       FROM         send_to_net
       where  (exequte  like '%'+@exequte+'%') and  (id=isnull(@id,id)) and  (point_num=isnull(@point_num,point_num))  and  (user_id=isnull(@user_id,user_id)) and  (file_name=isnull(@file_name,file_name))
	 and  (typ_file=isnull(@typ_file,typ_file))
       ORDER BY read_date DESC
    end


if @state=1
   begin
       SELECT     id, exequte, point_num, read_date, user_id, file_name, typ_file, srch_item, srch_cust, srch_file
       FROM         send_to_net
       where  (exequte  like '%'+@exequte+'%') and  (id=isnull(@id,id)) and  (point_num=isnull(@point_num,point_num))  and  (user_id=isnull(@user_id,user_id)) and  (file_name=isnull(@file_name,file_name))
	 and  (typ_file=isnull(@typ_file,typ_file))
       ORDER BY read_date
    end




if @state=2
   begin
       SELECT     id, exequte, point_num, read_date, user_id, file_name, typ_file, srch_item, srch_cust, srch_file
       FROM         send_to_net
       where  (exequte  like '%'+@exequte+'%') and  (id=isnull(@id,id)) and  (point_num=isnull(@point_num,point_num))  and  (user_id=isnull(@user_id,user_id)) and  (file_name=isnull(@file_name,file_name))
	 and  (typ_file=isnull(@typ_file,typ_file))
       ORDER BY id DESC
    end


if @state=3
   begin
       SELECT     id, exequte, point_num, read_date, user_id, file_name, typ_file, srch_item, srch_cust, srch_file
       FROM         send_to_net
       where  (exequte  like '%'+@exequte+'%') and  (id=isnull(@id,id)) and  (point_num=isnull(@point_num,point_num))  and  (user_id=isnull(@user_id,user_id)) and  (file_name=isnull(@file_name,file_name))
	 and  (typ_file=isnull(@typ_file,typ_file))
       ORDER BY id
    end
GO
/****** Object:  StoredProcedure [dbo].[backup_db]    Script Date: 08/03/2026 11:20:51 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[backup_db] (@Name varchar(100),@dbName varchar(100))
as
backup database @dbName to disk=@name with init
GO
/****** Object:  StoredProcedure [dbo].[CREATE_data_base]    Script Date: 08/03/2026 11:20:51 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CREATE_data_base] @db_name nvarchar(50),@name nvarchar(100)  AS
declare  @mysql1 nvarchar(50)
declare  @mysql2 nvarchar(50)
declare  @mysql3 nvarchar(50)
declare  @mysql4 nvarchar(50)
declare  @mysql5 nvarchar(50)
declare  @mysql6 nvarchar(50)
declare  @mysql7 nvarchar(50)
declare  @mysql8 nvarchar(50)
declare  @mysql9 nvarchar(50)
declare  @mysql10 nvarchar(50)
declare  @mysql11 nvarchar(50)
declare  @mysql12 nvarchar(50)
declare  @mysql13 nvarchar(50)


set @mysql1='CREATE DATABASE '+@db_name+''
set @mysql2='ON'
set @mysql3='( NAME = '+@db_name+'_data,'
set @mysql4='(FILENAME = '+@name+@db_name+'_data.mdf,'
set @mysql5=' SIZE = 10,'
set @mysql6='MAXSIZE = 50,'
set @mysql7='   FILEGROWTH = 5 )'
set @mysql8='LOG ON'
set @mysql9='( NAME = '+@db_name+'_log,'
set @mysql10='   FILENAME = '+@name+@db_name+'_log.ldf,'
set @mysql11='   SIZE = 5MB,'
set @mysql12='   MAXSIZE = 25MB,'
set @mysql13='   FILEGROWTH = 5MB )'
	execute sp_executesql @mysql1
	execute sp_executesql @mysql2
	execute sp_executesql @mysql3
	execute sp_executesql @mysql4
	execute sp_executesql @mysql5
	execute sp_executesql @mysql6
	execute sp_executesql @mysql7
	execute sp_executesql @mysql8
	execute sp_executesql @mysql9
	execute sp_executesql @mysql10
	execute sp_executesql @mysql11
	execute sp_executesql @mysql12
	execute sp_executesql @mysql13
GO
/****** Object:  StoredProcedure [dbo].[CreateTables]    Script Date: 08/03/2026 11:20:51 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[CreateTables] (@TypeCode integer)  AS BEGIN  declare @sql table(s nvarchar(Max), id int identity)  insert into  @sql(s) select Script from ActivitySystem.dbo.Users_Scripts order by Script_Num  declare @Rows integer  set @Rows=( Select Count(*) From @sql)  declare @int integer  set @int =0  declare @CreateStatement nvarchar(max)  while @int< @Rows  Begin  set  @int= @int+1  set @CreateStatement=( Select s From @sql where id=@int)  BEGIN TRY  EXEC (@CreateStatement)  END TRY  begin Catch  End Catch  end  end
GO
/****** Object:  StoredProcedure [dbo].[db_backup]    Script Date: 08/03/2026 11:20:51 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[db_backup]
(@db nvarchar(50),@Name varchar(200)output)
as
select @name=@name+CONVERT(char(8), GETDATE(), 10)+'.bak'
backup database @db to disk=@name with init
GO
/****** Object:  StoredProcedure [dbo].[db_Restore]    Script Date: 08/03/2026 11:20:51 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[db_Restore]
(@db nvarchar(50),@name nvarchar(max)) as 

exec Kill_Users @db
execute sp_executesql @name

--restore database @db from disk = @name
GO
/****** Object:  StoredProcedure [dbo].[Kill_Users]    Script Date: 08/03/2026 11:20:51 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Kill_Users]
@DB Sysname = Null
AS

if @DB Is Null 
begin
print 'you must provide the db name'
return
end
else if @DB = 'master'
begin
print 'cann not run this PROCEDURE against the master DB'
return 
end

Set NoCount On

-- Declare Variables

Declare @spid int , @q Nvarchar(1000)

Declare C_Users Cursor FAST_FORWARD FOR
Select spid From master..sysprocesses NoLock
Where dbid = db_id(@DB)


Open C_Users

Fetch Next From C_Users Into @spid

While @@Fetch_Status = 0
Begin 
Set @q = 'Kill ' + Cast( @spid AS Nvarchar(50) )
Exec(@q)

Fetch Next From C_Users Into @spid
End

Close C_Users
DeAllocate C_Users
GO
/****** Object:  StoredProcedure [dbo].[max_bass]    Script Date: 08/03/2026 11:20:51 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[max_bass] @point_num int   AS

select max(id) from send_to_net where  point_num=@point_num
GO
/****** Object:  StoredProcedure [dbo].[resive_data]    Script Date: 08/03/2026 11:20:51 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[resive_data] @id int,@point_num int   AS
select  *  from send_to_net
 where  point_num=@point_num and id>@id
 order by read_date,id
GO
/****** Object:  StoredProcedure [dbo].[restore_db]    Script Date: 08/03/2026 11:20:51 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[restore_db] (@name varchar(100), @dbName varchar(100)) as 

restore database @dbName  from disk = @name
GO
/****** Object:  StoredProcedure [dbo].[tran_send_to_net]    Script Date: 08/03/2026 11:20:51 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tran_send_to_net]  
@id0 int,@exequte0 nvarchar(4000),@point_num0 int,@user_id0 int,@file_name0 nvarchar(50),@typ_file0 nvarchar(50),@srch_item0  nvarchar(50),@srch_cust0  nvarchar(50),@srch_file0  nvarchar(50),
@id1 int,@exequte1 nvarchar(4000),@point_num1 int,@user_id1 int,@file_name1 nvarchar(50),@typ_file1 nvarchar(50),@srch_item1  nvarchar(50),@srch_cust1  nvarchar(50),@srch_file1  nvarchar(50),
@id2 int,@exequte2 nvarchar(4000),@point_num2 int,@user_id2 int,@file_name2 nvarchar(50),@typ_file2 nvarchar(50),@srch_item2  nvarchar(50),@srch_cust2  nvarchar(50),@srch_file2  nvarchar(50),
@id3 int,@exequte3 nvarchar(4000),@point_num3 int,@user_id3 int,@file_name3 nvarchar(50),@typ_file3 nvarchar(50),@srch_item3  nvarchar(50),@srch_cust3  nvarchar(50),@srch_file3  nvarchar(50),
@id4 int,@exequte4 nvarchar(4000),@point_num4 int,@user_id4 int,@file_name4 nvarchar(50),@typ_file4 nvarchar(50),@srch_item4  nvarchar(50),@srch_cust4  nvarchar(50),@srch_file4  nvarchar(50),
@id5 int,@exequte5 nvarchar(4000),@point_num5 int,@user_id5 int,@file_name5 nvarchar(50),@typ_file5 nvarchar(50),@srch_item5  nvarchar(50),@srch_cust5  nvarchar(50),@srch_file5  nvarchar(50),
@id6 int,@exequte6 nvarchar(4000),@point_num6 int,@user_id6 int,@file_name6 nvarchar(50),@typ_file6 nvarchar(50),@srch_item6  nvarchar(50),@srch_cust6  nvarchar(50),@srch_file6  nvarchar(50),
@id7 int,@exequte7 nvarchar(4000),@point_num7 int,@user_id7 int,@file_name7 nvarchar(50),@typ_file7 nvarchar(50),@srch_item7  nvarchar(50),@srch_cust7  nvarchar(50),@srch_file7  nvarchar(50),
@id8 int,@exequte8 nvarchar(4000),@point_num8 int,@user_id8 int,@file_name8 nvarchar(50),@typ_file8 nvarchar(50),@srch_item8  nvarchar(50),@srch_cust8  nvarchar(50),@srch_file8  nvarchar(50),
@id9 int,@exequte9 nvarchar(4000),@point_num9 int,@user_id9 int,@file_name9 nvarchar(50),@typ_file9 nvarchar(50),@srch_item9  nvarchar(50),@srch_cust9  nvarchar(50),@srch_file9  nvarchar(50)
 AS

if @id0<>0
begin
 INSERT  send_to_net  (id,exequte,point_num,user_id,file_name,typ_file,srch_item,srch_cust,srch_file) 
		values (@id0,@exequte0,@point_num0,@user_id0,@file_name0,@typ_file0,@srch_item0,@srch_cust0,@srch_file0)
end

if @id1<>0
begin
 INSERT  send_to_net  (id,exequte,point_num,user_id,file_name,typ_file,srch_item,srch_cust,srch_file) 
		values (@id1,@exequte1,@point_num1,@user_id1,@file_name1,@typ_file1,@srch_item1,@srch_cust1,@srch_file1)
end

if @id2<>0
begin
 INSERT  send_to_net  (id,exequte,point_num,user_id,file_name,typ_file,srch_item,srch_cust,srch_file) 
		values (@id2,@exequte2,@point_num2,@user_id2,@file_name2,@typ_file2,@srch_item2,@srch_cust2,@srch_file2)
end

if @id3<>0
begin
 INSERT  send_to_net  (id,exequte,point_num,user_id,file_name,typ_file,srch_item,srch_cust,srch_file) 
		values (@id3,@exequte3,@point_num3,@user_id3,@file_name3,@typ_file3,@srch_item3,@srch_cust3,@srch_file3)
end

if @id4<>0
begin
 INSERT  send_to_net  (id,exequte,point_num,user_id,file_name,typ_file,srch_item,srch_cust,srch_file) 
		values (@id4,@exequte4,@point_num4,@user_id4,@file_name4,@typ_file4,@srch_item4,@srch_cust4,@srch_file4)
end

if @id5<>0
begin
 INSERT  send_to_net  (id,exequte,point_num,user_id,file_name,typ_file,srch_item,srch_cust,srch_file) 
		values (@id5,@exequte5,@point_num5,@user_id5,@file_name5,@typ_file5,@srch_item5,@srch_cust5,@srch_file5)
end

if @id6<>0
begin
 INSERT  send_to_net  (id,exequte,point_num,user_id,file_name,typ_file,srch_item,srch_cust,srch_file) 
		values (@id6,@exequte6,@point_num6,@user_id6,@file_name6,@typ_file6,@srch_item6,@srch_cust6,@srch_file6)
end

if @id7<>0
begin
 INSERT  send_to_net  (id,exequte,point_num,user_id,file_name,typ_file,srch_item,srch_cust,srch_file) 
		values (@id7,@exequte7,@point_num7,@user_id7,@file_name7,@typ_file7,@srch_item7,@srch_cust7,@srch_file7)
end

if @id8<>0
begin
 INSERT  send_to_net  (id,exequte,point_num,user_id,file_name,typ_file,srch_item,srch_cust,srch_file) 
		values (@id8,@exequte8,@point_num8,@user_id8,@file_name8,@typ_file8,@srch_item8,@srch_cust8,@srch_file8)
end

if @id9<>0
begin
 INSERT  send_to_net  (id,exequte,point_num,user_id,file_name,typ_file,srch_item,srch_cust,srch_file) 
		values (@id9,@exequte9,@point_num9,@user_id9,@file_name9,@typ_file9,@srch_item9,@srch_cust9,@srch_file9)
end
GO
/****** Object:  StoredProcedure [dbo].[tran_send_to_net_s]    Script Date: 08/03/2026 11:20:51 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tran_send_to_net_s]  
@id0 int,@exequte0 nvarchar(4000),@point_num0 int,@user_id0 int,@file_name0 nvarchar(50),@typ_file0 nvarchar(50),@srch_item0  nvarchar(50),@srch_cust0  nvarchar(50),@srch_file0  nvarchar(50)
AS

set @id0=isnull((select max(id) from send_to_net where point_num=100),0)+1
 INSERT  send_to_net  (id,exequte,point_num,user_id,file_name,typ_file,srch_item,srch_cust,srch_file) 
values (@id0,@exequte0,100,@user_id0,@file_name0,@typ_file0,@srch_item0,@srch_cust0,@srch_file0)
GO
USE [master]
GO
ALTER DATABASE [USER_DATA] SET  READ_WRITE 
GO
