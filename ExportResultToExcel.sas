
/*Export SQL result to Excel*/
libname myfile xlsx "C:\Users\Desktop\myfile.xlsx";
proc sql;	
	/*save in worksheet 'overall'*/
	create table myfile.overall as 
		select *
		from table1;

	/*new worksheet 'detail*/
	create table myfile.detail as 
		select col1, col2
		from table1
		where col1>100;

	libname myfile clear
run;
quit;
