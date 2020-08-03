CREATE trigger tgTblRolesAudit on roles
after INSERT, UPDATE, DELETE
as
begin
	if exists(Select * from inserted) 
	begin
	  insert into h_roles
		(IdRol, Descripcion, UpdatedBy, UpdatedOn )
	  select 
		IdRol, Descripcion, SUSER_SNAME(), getdate()
	  from  
		inserted 
	end
	else
	begin
	  insert into h_roles
		(IdRol, Descripcion, UpdatedBy, UpdatedOn )
	  select 
		IdRol, Descripcion, SUSER_SNAME(), getdate()
	  from   
		deleted 
	end
end
