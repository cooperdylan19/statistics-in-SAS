TITLE "Descriptive stats on cholesterol based on weight";

PROC MEANS DATA=SASHELP.HEART N MEAN STDERR CLM;

	CLASS WEIGHT_STATUS;
	VAR CHOLESTEROL;

RUN;

ODS GRAPHICS ON; /* need for plots */

TITLE "Histogram and probability plot for cholesterol by weight status";

PROC UNIVARIATE DATA=SASHELP.HEART;

	CLASS WEIGHT_STATUS;
	VAR CHOLESTEROL; /* cholesterol info for different weight classes */
	
	HISTOGRAM CHOLESTEROL;
	INSET SKEWNESS KURTOSIS; /* additional stats on top of plot */
	
RUN;


TITLE "Box and whisker plot for cholesterol by weight";

PROC SGPLOT DATA=SASHELP.HEART;

	VBOX CHOLESTEROL / CATEGORY=WEIGHT_STATUS; /* one plot per weight category */
	
RUN;


ODS GRAPHICS OFF;