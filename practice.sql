use piramalemployee


print 'naj'
print replicate('naj',4)
print replicate('*',8 )+ '2450'

go

print'najim'+space(10)+'pinjari' --2023-10-06 14:50:44.627
declare @site 
e
go 

select getdate()----2023-10-06 14:50:44.627
print isdate(getdate())

print getdate()
print day(getdate())
print month(getdate())
print year(getdate())	

--datename --datepart 
print datename(day,getdate ())
print datename(month,getdate())
print datename(year,getdate())
print datename(dayofyear, getdate())
print datename(weekday, getdate())
print datename(tzoffset, sysdatetimeoffset())
print datename(hour, sysdatetimeoffset())
print datename(quarter, sysdatetimeoffset())
print datename(q,'1999-01-23')

print getdate()
print dateadd(day, 4,getdate())
print dateadd(month,2, getdate())
print dateadd(year,2, getdate())
print dateadd(hour,2, getdate())

declare @dob date = '1999-02-12', @today date = getdate()
print datediff(year,@dob, @today)
print datediff(month,@dob,@today)
print datediff(day,@dob,@today)

select getdate()
select CONVERT(date, getdate())
select CONVERT(varchar(50), getdate(), 100)
select CONVERT(varchar(50), getdate(), 101)
select CONVERT(varchar(50), getdate(), 102)
select CONVERT(varchar(50), getdate(), 103)
select CONVERT(varchar(50), getdate(), 104)
go
select cast('10' as int )
select cast('mamma' as int )

print square(25)
print sqrt(25)

declare @start int = 1 
while @start <= 10	
begin 
print floor(rand())* 100
set @start= @start	+1
end

print rand(10)
































