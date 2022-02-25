%macro sqladdvisit(start, end);
	proc sql;
	
	/*create a new labvisit table*/
	create table labvisit
		(
			foldername char(200)
		);
	/*insert visit name*/
	insert into labvisit
	values('Screening')
	values('Baseline')
	values('Day 1')
	values('Day 2')
	values ('Early Termination')
	values('Unscheduled');

	/*insert the sequence of visit names "Week XX"  based on the parameters*/
	%DO var=&start. %TO &end.;	
		%if &var<41 %then
			%do;
				insert into labvisit(foldername)
				values("Week &var");	
			%end;		
	%END;
	
	/*definie additional visits in a string with pipe delimiters*/
	%let visit_list = 42|44|46|48|50|100|104|110|116|122|174|180|220|226|232|238|244|250|256;
	%let i=1;

	%do %while (%scan(&visit_list, &i, |) ^=%str());
		%let vis =%scan(&visit_list, &i, |); 
		
		/*Insert into labvisit table*/
		insert into labvisit(foldername)
		values("Week &vis");
		
		%let i=%eval(&i+1);
	%end;
		
quit;
%mend;

%sqladdvisit(start=2, end=40)
