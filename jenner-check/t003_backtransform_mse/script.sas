/* Back-transform from the unit square to original units + MSE
   Adapted from the "transform back" block of
   utl-forcasting-and-profiling-cumulative-sales-millions-using-bass-diffusion-non-linear-model-nlin.sas
   The nested PROC SQL that inverts (v-min)/(max-min) to recover TORG / CUMSALESORG / PORG,
   references CALCULATED PORG to build RESID and DIFSQR, and aggregates SUM(difsqr)/obs into
   MSE is the author's, unchanged. The RESULTS input reconstructs the author's own captured
   unit-square predicted column (documented in his RESULTS listing) so the back-transform runs
   standalone. */

data results;
input t cumsales xt yt predicted residual;
cards4;
1   1.00   0.00000  0.00000  0.00000   0.000000
2   1.31   0.08333  0.02022  0.00283   0.017389
3   1.87   0.16667  0.05675  0.03210   0.024648
4   3.16   0.25000  0.14090  0.11736   0.023538
5   5.12   0.33333  0.26875  0.26617   0.002582
6   7.60   0.41667  0.43053  0.45892  -0.028392
7   10.69  0.50000  0.63209  0.65808  -0.025984
8   14.44  0.58333  0.87671  0.82434   0.052373
9   15.23  0.66667  0.92825  0.93305  -0.004802
10  16.13  0.75000  0.98695  0.98410   0.002852
11  16.23  0.83333  0.99348  0.99840  -0.004928
12  16.29  0.91667  0.99739  0.99998  -0.002589
13  16.33  1.00000  1.00000  1.00000   0.000000
;;;;
run;quit;

options ls=255 ps=65;
proc sql;
  create
     table back as
  select
      *
     ,sum(difsqr)/obs as mse

  from
     (select
        *
       ,min(t) + (max(t)-min(t))*xt as torg
       ,min(cumsales)  + (max(cumsales)-min(cumsales))*yt   as cumsalesorg
       ,min(cumsales)  + (max(cumsales)-min(cumsales))*predicted   as porg
       ,(calculated porg - cumsales) as resid
       ,(calculated porg - cumsales)**2 as difsqr
       ,count(*) as obs
     from
        results)
;quit;

proc print data=back;
var t cumsales porg resid mse;
run;quit;
