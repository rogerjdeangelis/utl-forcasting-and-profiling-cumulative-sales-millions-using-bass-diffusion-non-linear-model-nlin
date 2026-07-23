/* Bass diffusion model prediction (three-parameter form)
   Adapted from the "3 unit square forecast" / Bass block of
   utl-forcasting-and-profiling-cumulative-sales-millions-using-bass-diffusion-non-linear-model-nlin.sas
   Substitution: libname sd1 "d:/sd1" -> WORK; the fitted p/q/m are the author's
   own captured coefficients (RES=0.00885831886072091 0.720236624882788 16.7653244363548),
   hardcoded exactly as the author does in his own DATA PRED step. The Bass model
   arithmetic and the DATA-step MSE/resid accumulation are unchanged. */

data have;
input t cumsales;
cards4;
1   1.00
2   1.31
3   1.87
4   3.16
5   5.12
6   7.60
7   10.69
8   14.44
9   15.23
10  16.13
11  16.23
12  16.29
13  16.33
;;;;
run;quit;

data pred;

  retain mse 0;

  set have nobs=obs;

  p=0.008858319;
  q=0.7202366  ;
  m=16.76532   ;

  predicted=m*(1 - exp(-(p + q) * t)) / (1 + (q/p) * exp(-(p + q) * t));

  mse= mse + (predicted-cumsales)**2/obs;
  put mse=;
  resid=predicted-cumsales;
run;quit;

proc print data=pred;
var t cumsales predicted resid;
run;quit;
