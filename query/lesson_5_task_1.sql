--pgsql
create function main.fn_method
(
  account_id int,
  session_id int
)
returns int
language plpgsql
as $body$
begin
 return 1::int;
end;
$body$;


--tsql
create function dbo.fn_method
(
  @account_id int,
  @session_id int
)
returns int as
begin
 return cast(1 as int);
end;

