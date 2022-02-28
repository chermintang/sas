
/*macro function to iterate a string with delimiters*/
%macro iterate_string(varlist, delimiter); 
	%let i=1;
	%do %while (%scan(&varlist, &i, |) ^=%str());
		%let var=%scan(&varlist, &i, &delimiter); 
		%put &var;
		
		%let i=%eval(&i+1);
	%end;
%mend;
