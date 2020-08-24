--Single data source in report server.


declare @DSName varchar(max) = 'targe data source name' --target data source Name
declare @DSID varchar(max) -- targe ds ID
select @DSID= ItemID  from Catalog where Name = @DSName and Type =5 



update DataSource 
set UserName = null, Password = null, ConnectionString=null, Prompt = null, CredentialRetrieval = 1, Extension = null,
Link = @DSID,
flags = (select top 1 Flags from DataSource where  ItemID = @DSID )
where ItemID <> @DSID and ItemID in (select ItemID FROM [ReportServer].[dbo].[Catalog] where Type = 2)
