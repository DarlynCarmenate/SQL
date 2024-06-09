--pgsql
create function main.fn_method
(
  account_id int,
  session_id int,
  product_name varchar
)
returns table
(
	first_query json,
	secound_query json
)
language plpgsql
as $body$
declare
l_first_query json;
l_secound_query json;
begin
	select json_agg(t)
	from
	(
		select t.user_id,
			t.product_type,
			t.user_type
		from
		(
		values (1,'prod_type', 'user-type'),
			     (2,'prod_type_2', 'user-type_2')
		) as t (user_id, product_type, user_type)
	) as t
	into l_first_query;
	select json_agg(t)
	from
	(
		select t.session_id,
			     t.status
		from
		(
			values (1,'approved'),
			       (2,'finished')
		) as t (session_id, status)
	) as t
	into l_secound_query;
end;
$body$;

--tsql
create procedure dbo.fn_method
	@account_id int,
	@session_id int,
	@product_name varchar
as
begin
	select t.user_id,
		     t.product_type,
		     t.user_type
		from
		(
		values (1,'prod_type', 'user-type'),
			     (2,'prod_type_2', 'user-type_2')
		) as t (user_id, product_type, user_type)

	select t.session_id,
		     t.status
		from
		(
			values (1,'approved'),
			       (2,'finished')
		) as t (session_id, status)
end;

