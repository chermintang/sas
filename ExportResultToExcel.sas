
/*Export SQL result to Excel*/
libname myfile xlsx "C:\Users\Desktop\myfile.xlsx";
proc sql;	
	create table myfile.class as 
		select *
		from table1;
run;
quit;
