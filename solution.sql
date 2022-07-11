-- Query 1
select client_id from client
where district_id = '1'
limit 5;

-- Query 2
select client_id from client
where district_id = '72'
order by client_id desc
limit 1;

-- Query 3
select amount from loan
order by amount asc
limit 3;

-- Query 4
select distinct status from loan
order by status asc;

-- Query 5
select loan_id from loan
order by payments asc
limit 1;

-- Query 6
select account_id, amount from loan
order by account_id asc
limit 5;

-- Query 7
select account_id from loan
where duration like 60
order by amount asc
limit 5;

-- Query 8
select distinct k_symbol from bank.order
order by k_symbol asc;

-- Query 9
select order_id from bank.order
where account_id like 34;

-- Query 10
select distinct account_id from bank.order
where order_id between 29540 and 29560;

-- Query 11
select amount from bank.order
where account_to like 30067122;

-- Query 12 ____ not sure why the values are different from the given ones
select account_id, trans_id, date, type, amount from trans
where account_id = '793'
order by date
limit 10;

-- Query 13
select district_id, count(distinct(client_id)) from client
where district_id < 10
group by district_id
order by district_id;

-- Query 14
select type, count(card_id) from card
group by type
order by type;

-- Query 15
select account_id, sum(amount) from loan
group by account_id
order by amount desc
limit 10;

-- Query 16
select date, count(loan_id) from loan
where date < 930907
group by date
order by date desc;

-- Query 17
select date,duration,count(loan_id) from loan
where date between 971201 and 971231
group by date,duration
order by date,duration;

-- Query 18
select*from trans;
select account_id, type, sum(amount) as total_amount from trans
where account_id = '396'
group by account_id, type
order by account_id, type;


-- Query 19
select account_id, replace(replace(type, "PRIJEM","INCOMING"), "VYDAJ","OUTGOING"), round(sum(amount),0) as total_amount from trans
where account_id = '396'
group by account_id, type
order by account_id, type;

-- Query 20
select
	round(sum(case when type = 'vydaj' then amount else 0 end)) as outgoing,
	round(sum(case when type = 'prijem' then amount else 0 end)) as incoming,
    round(sum(case when type = 'vydaj' then amount else 0 end)) - round(sum(case when type = 'prijem' then amount else 0 end)) as balance
    from bank.trans
    where account_id = 396;

-- Query 21 
select account_id,
    round(sum(case when type = 'prijem' then amount else 0 end)) - round(sum(case when type = 'vydaj' then amount else 0 end)) as balance
    from bank.trans
    group by account_id
    order by balance DESC
    limit 10;
    