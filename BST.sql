use northwind;

create table BST (
N integer,
P integer
);
insert into BST value (1,2);
insert into BST value (3,2);
insert into BST value (6,8);
insert into BST value (9,8);
insert into BST value (2,5);
insert into BST value (8,5);
insert into BST value (5,null);

select * from BST;


select node from (
	select N, concat(N, ' root') as node from BST where P is null
	union
	select N, concat(N, ' leaf') as node from BST where N not in (select P from BST where P is not null)
	union
	select N, concat(N, ' inner') as node from BST where N in (select P from BST where P is not null) and P is not null
) abc
order by N;
