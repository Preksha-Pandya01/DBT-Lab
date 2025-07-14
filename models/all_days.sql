{{dbt_utils.date_spine(
datepart='day' ,
start_date="to_date('01/06/2025','mm/dd/yyyy')" ,
end_date="dateadd(week,1,current_date)"  
)}}