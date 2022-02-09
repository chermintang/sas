libname tmplocal "C:\Users\mylocal";

/*ae*/
data lbae;
	set tmplocal.ae;
run;

/*demographics*/
data lbdemog;
	set tmplocal.dm;
run;
/*forcing html results viewer to show the latest submitted code*/
ods html close;
ods html;
ods html newfile=proc;


/*filter AE=Yes*/
proc print data= ae;	
	title 'SAE';
	where aecat_cod='Y';
run;


/*join tables*/
proc sql;	
	title 'sql Male subjects with SAE';
	/*return total SAEs*/
	select count(ae.aecat_cod) as totalSAE_Male
	from ae inner join dm
	on dm.subject = ae.subject
	where dm.sex_cod='M' and ae.aecat_cod='Y';
	
	/*return Male subjects with SAE results*/
	select dm.sex, ae.* 
	from ae inner join dm
	on dm.subject = ae.subject
	where dm.sex_cod='M' and ae.aecat_cod='Y'
	order by ae.subject;
run;
quit;
