/* Unit-square transform (min/max normalization to the (0,1) square)
   Adapted from the "unit square model" block of
   utl-forcasting-and-profiling-cumulative-sales-millions-using-bass-diffusion-non-linear-model-nlin.sas
   Substitution: libname sd1 "d:/sd1" -> WORK. The PROC SQL that maps t and cumsales
   onto [0,1] via (v-min)/(max-min) is the author's, unchanged. This is the step that
   guarantees an exact fit at x=0 and x=1 for the beta-CDF unit-square model. */

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

proc sql;
  create
     table transform as
  select
     t
    ,cumsales
    ,(t-min(t))/(max(t)-min(t)) as xt
    ,(cumsales-min(cumsales))/(max(cumsales)-min(cumsales)) as yt
  from
     have
;quit;

proc print data=transform;
run;quit;
