CREATE trigger tgTblUsersAudit on users
after INSERT, UPDATE, DELETE
as
begin
	if exists(Select * from inserted) 
	begin
	  insert into h_users
		(id, name, email, email_verified_at, password, remember_token, UpdatedBy, UpdatedOn )
	  select 
		id, name, email, email_verified_at, password, remember_token, SUSER_SNAME(), getdate()
	  from  
		inserted 
	end
	else
	begin
	  insert into h_users
		(id, name, email, email_verified_at, password, remember_token, UpdatedBy, UpdatedOn )
	  select 
		id, name, email, email_verified_at, password, remember_token, SUSER_SNAME(), getdate()
	  from  
		deleted 
	end
end
