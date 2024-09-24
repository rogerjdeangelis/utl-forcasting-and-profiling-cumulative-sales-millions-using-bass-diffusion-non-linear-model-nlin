# utl-forcasting-and-profiling-cumulative-sales-millions-using-bass-diffusion-non-linear-model-nlin
Forcasting and profiling cumulative sales millions using bass diffusion non linear model nlin 
    %let pgm=utl-forcasting-and-profiling-cumulative-sales-millions-using-bass-diffusion-non-linear-model-nlin;

    %stop_submission;

    Forcasting and profiling cumulative sales millions using bass diffusion non linear model nlin

        SOLUTIONS

            1 r diffusion model
              Unlike th unit square regression the parameters have meaning

              BASS FUSION MODE PARAMETER ESTIMATESL PROVIDES INSIGHTS

              Q-Usually larger than p (often 0.2-0.4)
                Higher stronger imitation effect
                and faster adoption in later stages
              M- Eventual adopters or market size
              P-Typically a small value(often 0.01-0.03)
                Higher p faster initial adoption

            2 unit square model (simpler and better fit fewer parameters)
              (best when dependendent variable is monotonic)
              (since the domain of beta is (0,1) we guarantee an exact fit for x=0 and x=1)
              (work in progress for non-monotonic Y and forecasting)

            3 unit square forecast


    github
    https://tinyurl.com/2fu7sn54
    https://github.com/rogerjdeangelis/utl-forcasting-and-profiling-cumulative-sales-millions-using-bass-diffusion-non-linear-model-nlin

    stackoverflow R
    https://tinyurl.com/4yt75sxj
    https://stackoverflow.com/questions/79014529/can-someone-help-me-with-my-bass-diffusion-model-in-r

    related repo
    https://tinyurl.com/4e335xb9
    
https://github.com/rogerjdeangelis/utl-general-framework-for-fitting-non-linear-equation-with-transcendental-functions-on-a-unit-square/blob/main/pltgrf.pdf

    /*               _     _
     _ __  _ __ ___ | |__ | | ___ _ __ ___
    | `_ \| `__/ _ \| `_ \| |/ _ \ `_ ` _ \
    | |_) | | | (_) | |_) | |  __/ | | | | |
    | .__/|_|  \___/|_.__/|_|\___|_| |_| |_|
    |_|

     CREATE THIS OUTPUT
    */                            TIME                                                     TIME
              1   2   3   4   5   6   7   8   9  10  11  12  13          1   2   3   4   5   6   7   8   9  10  11  12  13
           ---+---+---+---+---+---+---+---+---+---+---+---+---+---   ---+---+---+---+---+---+---+---+---+---+---+---+---+-
      PORG |                                                     |   |                                                    |
           | UNIT SQUARE MODEL y =sqrt(CDF('BETA',t,7.28,7.10))  |   |  BASS DIFFUSION MODEL  p=0.009  q=0.720 m=16.77    |
           |                                                     |   |                                                    |
           | ONLY TWO PARAMETERS (MORE STABLE MODEL)             |   | MODEL y=m*(1-exp(-(p+q)*t))/(1+(q/p)*exp(-(p+q)*t))|
           |                                                     |   |                                                    |
           |  IN ORIGIAL UNITS              BETTER FIT           |   | THREE PARAMETER                                    |
           |                ^                                    |   |                ^                                   |
           |  T  CUMSALES   Y   RESID                            |   |   T CUMSALES   Y   RESID                           |
        18 +                                                     +18 +                                                    + 18
           |  1   1.00    1.00    0.00                           |   |   1   1.00   0.21  -0.78 **                        |
           |  2   1.31    1.04   -0.27                           |   |   2   1.31   0.64  -0.66                           |
           |  3   1.87    1.49   -0.38                           |   |   3   1.87   1.47  -0.39                        p  |
           |  4   3.16    2.79   -0.37                p   p   p  |   |   4   3.16   2.93  -0.22                p   p   o  |
        16 +  5   5.12    5.08   -0.04            p              +16 +   5   5.12   5.22   0.10            p              + 16
           |  6   7.60    8.03    0.43                           |   |   6   7.60   8.17   0.57                           |
           |  7  10.69   11.08    0.39        p                  |   |   7  10.69  11.15   0.46        p                  |
           |  8  14.44   13.63   -0.81 **                        |   |   8  14.44  13.50  -0.93 **                        |
           |  9  15.23   15.30    0.07    o                      |   |   9  15.23  15.01  -0.21    o                      |
        14 + 10  16.13   16.08   -0.05                           +14 +  10  16.13  15.87  -0.25                           + 14
           | 11  16.23   16.30    0.07    p                      |   |  11  16.23  16.32   0.09    p                      |
           | 12  16.29   16.32    0.03                           |   |  12  16.29  16.54   0.25                           |
           | 13  16.33   16.33    0.00                           |   |  13  16.33  16.66   0.33                           |
           |                                                     |   |                                                    |
        12 +                                                     +12 +                                                    + 12
           |  Original Units                                     |   |  ORIGINAL UNITS                                    |
           |  MSE = 0.107             p 11.08 Predicted          |   |  MSE = 9.6              p                          |
           |  ===========             o 10.69 Observed           |   |  =========              o                          |
           |                                                     |   |                                                    |
        10 +                                                     +10 +                                                    + 10
           |                                                     |   |                                                    |
           |                                                     |   |                                                    |
           |                                                     |   |                                                    |
           |                                                     |   |                                                    |
         8 +                      p                              + 8 +                     p                              +  8
           |                      o                              |   |                     o                              |
           |                                                     |   |                                                    |
           |                                                     |   |                                                    |
           |                                                     |   |                                                    |
         6 +                                                     + 6 +                                                    +  6
           |                                                     |   |                                                    |
           |                  p                                  |   |                 p                                  |
           |                                                     |   |                                                    |
           |                      FORECAST YEARS 14 & 15         |   |                     FORECAST YEARS 14 & 15         |
         4 +                                                     + 4 +                                                    +  4
           |                     Year  100s of units             |   |                    Year  100s of units             |
           |              o       14   16.33                     |   |             o       14   16.71                     |
           |              p       15   16.33                     |   |             p       15   16.74                     |
           |                                                     |   |                                                    |
         2 +          o                                          + 2 +         o                                          +  2
           |          p                                          |   |         p                                          |
           |  p   p                                              |   | o   o                                              |
           |                                                     |   |     p     BASS MODEL PROVIDES INSIGHTS             |
           |                                                     |   | p                                                  |
         0 +                                                     + 0 +      Q-Usually larger than p (often 0.2-0.4)       +  0
           |                                                     |   |        Higher stronger imitation effect            |
           |                                                     |   |        and faster adoption in later stages         |
           |                                                     |   |      M- Eventual adopters or market size           |
           |                                                     |   |      P-Typically a small value(often 0.01-0.03)    |
           |                                                     |   |        Higher p faster initial adoption            |
           |                                                     |   |                                                    |
           ---+---+---+---+---+---+---+---+---+---+---+---+---+---   --+---+---+---+---+---+---+---+---+---+---+---+---+---
              1   2   3   4   5   6   7   8   9  10  11  12  13        1   2   3   4   5   6   7   8   9  10  11  12  13
                               time                                                       time
    /*                   _
    (_)_ __  _ __  _   _| |_
    | | `_ \| `_ \| | | | __|
    | | | | | |_) | |_| | |_
    |_|_| |_| .__/ \__,_|\__|
            |_|
    */
    options validvarname=upcase;
    libname sd1 "d:/sd1";
    data sd1.have;
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


    /**************************************************************************************************************************/
    /*                                                                                                                        */
    /* SD1.HAVE total obs=13                                                                                                  */
    /*                                                                                                                        */
    /* Obs     T    CUMSALES                                                                                                  */
    /*                                                                                                                        */
    /*   1     1       1.00                                                                                                   */
    /*   2     2       1.31                                                                                                   */
    /*   3     3       1.87                                                                                                   */
    /*   4     4       3.16                                                                                                   */
    /*   5     5       5.12                                                                                                   */
    /*   6     6       7.60                                                                                                   */
    /*   7     7      10.69                                                                                                   */
    /*   8     8      14.44                                                                                                   */
    /*   9     9      15.23                                                                                                   */
    /*  10    10      16.13                                                                                                   */
    /*  11    11      16.23                                                                                                   */
    /*  12    12      16.29                                                                                                   */
    /*  13    13      16.33                                                                                                   */
    /*                                                                                                                        */
    /**************************************************************************************************************************/

    /*              _        __  __           _
    / |  _ __    __| |_   _ / _|/ _|_   _ ___(_) ___  _ __
    | | | `__|  / _` | | | | |_| |_| | | / __| |/ _ \| `_ \
    | | | |    | (_| | |_| |  _|  _| |_| \__ \ | (_) | | | |
    |_| |_|     \__,_|\__,_|_| |_|  \__,_|___/_|\___/|_| |_|

    */

    %utl_rbeginx;
    parmcards4;
    library(ggplot2)
    library(minpack.lm)
    library(haven)
    source("c:/oto/fn_tosas9x.R")
    have<-read_sas("d:/sd1/have.sas7bdat")
    print(have)
    # Define the Bass model function
    bass_model <- function(t, p, q, m) {
      (1 - exp(-(p + q) * t)) / (1 + (q/p) * exp(-(p + q) * t))
    }
    # Fit the Bass model to the data
    fit <- nlsLM(CUMSALES ~ m * bass_model(T, p, q),
                 data = have,
                 start = list(p = 0.01, q = 0.3, m = max(have$CUMSALES)),
                 lower = c(0, 0, max(have$CUMSALES)))
    str(fit)
    # Extract the fitted parameters
    p <- coef(fit)["p"]
    q <- coef(fit)["q"]
    m <- coef(fit)["m"]
    cat("Innovation coefficient (p):", p, "\n")
    cat("Imitation coefficient (q):", q, "\n")
    cat("Market potential (m):", m, "\n")
    p
    q
    m;
    res<-paste(p,q,m)
    writeClipboard(res)
    ;;;;
    %utl_rendx(return=res)

    %put &=res;

    %let _p=%scan(&res,1,$%str( ));
    %let _q=%scan(&res,2,$%str( ));
    %let _m=%scan(&res,3,$%str( ));

    %put &=_p;
    %put &=_q;
    %put &=_m;

    /**************************************************************************************************************************/
    /*                                                                                                                        */
    /*  %put &=res;                                                                                                           */
    /*                                                                                                                        */
    /*  RES=0.00885831886072091 0.720236624882788 16.7653244363548                                                            */
    /*                                                                                                                        */
    /*  %put &=res;                                                                                                           */
    /*                                                                                                                        */
    /*  %let _p=%scan(&res,1,$%str( ));                                                                                       */
    /*  %let _q=%scan(&res,2,$%str( ));                                                                                       */
    /*  %let _m=%scan(&res,3,$%str( ));                                                                                       */
    /*                                                                                                                        */
    /*  %put &=_p;                                                                                                            */
    /*  %put &=_q;                                                                                                            */
    /*  %put &=_m;                                                                                                            */
    /*                                                                                                                        */
    /*  _P=0.0088583188607209                                                                                                 */
    /*                                                                                                                        */
    /*  _Q=0.720236624882788                                                                                                  */
    /*                                                                                                                        */
    /*  _M=16.7653244363548                                                                                                   */
    /*                                                                                                                        */
    /**************************************************************************************************************************/

    data pred;

      %dosubl('proc sql; select avg(cumsales) into :_avg from sd1.have; quit;');

      retain mse 0;

      set sd1.have nobs=obs;

      p = &_p;
      q = &_q;
      m = &_m;

      predicted=m*(1 - exp(-(p + q) * t)) / (1 + (q/p) * exp(-(p + q) * t));

      mse= mse + (predicted-cumsales)**2/obs;
      put mse=;
      resid=predicted-cumsales;
    run;quit;

    options ps=32 ls=64;
    proc plot data=pred;
      plot predicted*t='p' cumsales*t='o'/overlay box;
    run;quit;

    /**************************************************************************************************************************/
    /*                                                                                                                        */
    /*                                                                                                                        */
    /*    --+---+---+---+---+---+---+---+---+---+---+---+---+---                                                              */
    /* ED |                                                    |                                                              */
    /* 20 +                                                    +                                                              */
    /*    |  Y=m*(1-exp(-(p+q)*t))/(1+(q/p)*exp(-(p+q)*t))     |                                                              */
    /*    |                                                    |                                                              */
    /*    |  _P=0.0088583188607209                      p   p  |                                                              */
    /*    |                                     p   p   o   o  |                                                              */
    /* 15 +  _Q=0.720236624882788           p                  +                                                              */
    /*    |                             p                      |                                                              */
    /*    |  _M=16.7653244363548                               |                                                              */
    /*    |                                                    |                                                              */
    /*    |                         p                          |                                                              */
    /* 10 +                                                    +                                                              */
    /*    |                                                    |                                                              */
    /*    |                     p                              |                                                              */
    /*    |                                                    |                                                              */
    /*    |                                                    |                                                              */
    /*  5 +                 p                                  +                                                              */
    /*    |                                                    |                                                              */
    /*    |             p                                      |                                                              */
    /*    |         o                                          |                                                              */
    /*    | o   p   p                                          |                                                              */
    /*  0 + p                                                  +                                                              */
    /*    --+---+---+---+---+---+---+---+---+---+---+---+---+---                                                              */
    /*      1   2   3   4   5   6   7   8   9  10  11  12  13                                                                 */
    /*                                                                                                                        */
    /*                                                                                                                        */
    /**************************************************************************************************************************/
    /*___                _ _
    |___ \   _   _ _ __ (_) |_   ___  __ _ _   _  __ _ _ __ ___
      __) | | | | | `_ \| | __| / __|/ _` | | | |/ _` | `__/ _ \
     / __/  | |_| | | | | | |_  \__ \ (_| | |_| | (_| | | |  __/
    |_____|  \__,_|_| |_|_|\__| |___/\__, |\__,_|\__,_|_|  \___|
     _                        __        |_|
    | |_ _ __ __ _ _ __  ___ / _| ___  _ __ _ __ ___
    | __| `__/ _` | `_ \/ __| |_ / _ \| `__| `_ ` _ \
    | |_| | | (_| | | | \__ \  _| (_) | |  | | | | | |
     \__|_|  \__,_|_| |_|___/_|  \___/|_|  |_| |_| |_|

    */

    proc sql;
      create
         table transform as
      select
         t
        ,cumsales
        ,(t-min(t))/(max(t)-min(t)) as xt
        ,(cumsales-min(cumsales))/(max(cumsales)-min(cumsales)) as yt
      from
         sd1.have
    ;quit;

    /**************************************************************************************************************************/
    /*                                                                                                                        */
    /*  WORK.TRANSFORM total obs=13                                                                                           */
    /*                                                                                                                        */
    /*     T    CUMSALES       XT         YT                                                                                  */
    /*                                                                                                                        */
    /*     1       1.00     0.00000    0.00000                                                                                */
    /*     2       1.31     0.08333    0.02022                                                                                */
    /*     3       1.87     0.16667    0.05675                                                                                */
    /*     4       3.16     0.25000    0.14090                                                                                */
    /*     5       5.12     0.33333    0.26875                                                                                */
    /*     6       7.60     0.41667    0.43053                                                                                */
    /*     7      10.69     0.50000    0.63209                                                                                */
    /*     8      14.44     0.58333    0.87671                                                                                */
    /*     9      15.23     0.66667    0.92825                                                                                */
    /*    10      16.13     0.75000    0.98695                                                                                */
    /*    11      16.23     0.83333    0.99348                                                                                */
    /*    12      16.29     0.91667    0.99739                                                                                */
    /*    13      16.33     1.00000    1.00000                                                                                */
    /*                                                                                                                        */
    /**************************************************************************************************************************/

    ods output parameterestimates=est;
    proc nlin data=transform method=MARQUARDT CONVERGE=0.000001;;
      parms A = 8
            B = 5;
      model yt = sqrt(CDF('BETA', xt, a, b)) ;
      output out=results p=predicted r=residual;
    run;quit;

    proc print data=results;
    run;quit;

    /**************************************************************************************************************************/
    /*                                                                                                                        */
    /*   T   CUMSALES      XT        YT     PREDICTED    RESIDUAL                                                             */
    /*                                                                                                                        */
    /*   1      1.00    0.00000   0.00000    0.00000     0.000000                                                             */
    /*   2      1.31    0.08333   0.02022    0.00283     0.017389                                                             */
    /*   3      1.87    0.16667   0.05675    0.03210     0.024648                                                             */
    /*   4      3.16    0.25000   0.14090    0.11736     0.023538                                                             */
    /*   5      5.12    0.33333   0.26875    0.26617     0.002582                                                             */
    /*   6      7.60    0.41667   0.43053    0.45892    -0.028392                                                             */
    /*   7     10.69    0.50000   0.63209    0.65808    -0.025984                                                             */
    /*   8     14.44    0.58333   0.87671    0.82434     0.052373                                                             */
    /*   9     15.23    0.66667   0.92825    0.93305    -0.004802                                                             */
    /*  10     16.13    0.75000   0.98695    0.98410     0.002852                                                             */
    /*  11     16.23    0.83333   0.99348    0.99840    -0.004928                                                             */
    /*  12     16.29    0.91667   0.99739    0.99998    -0.002589                                                             */
    /*  13     16.33    1.00000   1.00000    1.00000     0.000000                                                             */
    /*                                                                                                                        */
    /**************************************************************************************************************************/
    /*                        __                        _                _
    | |_ _ __ __ _ _ __  ___ / _| ___  _ __ _ __ ___   | |__   __ _  ___| | __
    | __| `__/ _` | `_ \/ __| |_ / _ \| `__| `_ ` _ \  | `_ \ / _` |/ __| |/ /
    | |_| | | (_| | | | \__ \  _| (_) | |  | | | | | | | |_) | (_| | (__|   <
     \__|_|  \__,_|_| |_|___/_|  \___/|_|  |_| |_| |_| |_.__/ \__,_|\___|_|\_\

    */

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

    options ps=32 ls=64;
    proc plot data=back;
      plot porg*t='p' cumsales*t='o' /box overlay;
    run;quit;


    /**************************************************************************************************************************/
    /*                                                                                                                        */
    /*                                                                                                                        */
    /*       ---+---+---+---+---+---+---+---+---+---+---+---+---+---        T    CUMSALES    PORG       RESID                 */
    /*  PORG |                                                     |                                                          */
    /*    20 +  T CUMSALES  PORG                                   +        1       1.00    1.0000     0.00000                */
    /*       |                                                     |        2       1.31    1.0434    -0.26657                */
    /*       |  1    1.00  1.0000                                  |        3       1.87    1.4921    -0.37785                */
    /*       |  2    1.31  1.0434                                  |        4       3.16    2.7992    -0.36083                */
    /*       |  3    1.87  1.4921                p   p   p   p     |        5       5.12    5.0804    -0.03958                */
    /*    15 +  4    3.16  2.7992              p                   +        6       7.60    8.0352     0.43524                */
    /*       |                              p                      |        7      10.69   11.0883     0.39834                */
    /*       |                                                     |        8      14.44   13.6371    -0.80288                */
    /*       |                                                     |        9      15.23   15.3036     0.07362                */
    /*       |                          p                          |       10      16.13   16.0863    -0.04372                */
    /*    10 +                                                     +       11      16.23   16.3055     0.07555                */
    /*       |                                                     |       12      16.29   16.3297     0.03969                */
    /*       |                      p                              |       13      16.33   16.3300     0.00000                */
    /*       |                                                     |                                                          */
    /*       |                                                     |                                                          */
    /*     5 +                  p                                  +                                                          */
    /*       |                                                     |                                                          */
    /*       |              p                                      |                                                          */
    /*       |          o                                          |                                                          */
    /*       |  p   p   p                                          |                                                          */
    /*     0 +                                                     +                                                          */
    /*       ---+---+---+---+---+---+---+---+---+---+---+---+---+---                                                          */
    /*          1   2   3   4   5   6   7   8   9  10  11  12  13                                                             */
    /*                                                                                                                        */
    /**************************************************************************************************************************/

    /*____               _ _                     __                         _
    |___ /   _   _ _ __ (_) |_ ___  __ _ _ __   / _| ___  _ __ ___ __ _ ___| |_
      |_ \  | | | | `_ \| | __/ __|/ _` | `__| | |_ / _ \| `__/ __/ _` / __| __|
     ___) | | |_| | | | | | |_\__ \ (_| | |    |  _| (_) | | | (_| (_| \__ \ |_
    |____/   \__,_|_| |_|_|\__|___/\__, |_|    |_|  \___/|_|  \___\__,_|___/\__|
                                      |_|
    */

    options validvarname=upcase;
    libname sd1 "d:/sd1";
    data sd1.have;
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
    14   .
    15   .
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
         sd1.have
    ;quit;

    ods trace on;
    ods output parameterestimates=est;
    proc nlin data=transform method=MARQUARDT CONVERGE=0.000001;;
      parms A = 8
            B = 5;
      model yt = sqrt(CDF('BETA', xt, a, b)) ;
      output out=results p=predicted r=residual;
    run;quit;
    ods trace off;

    proc print data=results;
    run;quit;

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

    options ls=255 ps=32;
    proc print data=back;
    run;quit;

    options ls=64 ps=32;
    proc plot data=back;
      plot porg*t='p' cumsales*t='o' /box overlay;
    run;quit;

    /**************************************************************************************************************************/
    /*                                                                                                                        */
    /*     -+---+---+---+---+---+---+---+---+---+---+---+---+---+---+-      T    CUMSALES    PREDICTED                        */
    /* ORG |                                                         |                                                        */
    /*     |                                                         |      1       1.00     1.0000                           */
    /*  20 +                                                         +      2       1.31     1.0309                           */
    /*     |                                                         |      3       1.87     1.4322                           */
    /*     |                                                         |      4       3.16     2.7253                           */
    /*     |                                    p   p   p   p   p   p|      5       5.12     5.0626                           */
    /*  15 +                            o   p                        +      6       7.60     8.0858                           */
    /*     |                            p                            |      7      10.69    11.1421                           */
    /*     |                                                         |      8      14.44    13.6218                           */
    /*     |                        p                                |      9      15.23    15.2195                           */
    /*  10 +                                                         +     10      16.13    16.0018                           */
    /*     |                                                         |     11      16.23    16.2693                           */
    /*     |                    p                                    |     12      16.29    16.3245                           */
    /*     |                                                         |     13      16.33    16.3299                           */
    /*   5 +                p                                        +                                                        */
    /*     |            o                                            |                                                        */
    /*     |            p                                            |     14        .      16.3300  Estimates                */
    /*     |p   p   p                                                |     15        .      16.3300                           */
    /*   0 +                                                         +                                                        */
    /*     |                                                         |                                                        */
    /*     -+---+---+---+---+---+---+---+---+---+---+---+---+---+---+-                                                        */
    /*      1   2   3   4   5   6   7   8   9  10  11  12  13  14  15                                                         */
    /*                                                                                                                        */
    /**************************************************************************************************************************/

    /*              _        __  __           _
    / |  _ __    __| |_   _ / _|/ _|_   _ ___(_) ___  _ __
    | | | `__|  / _` | | | | |_| |_| | | / __| |/ _ \| `_ \
    | | | |    | (_| | |_| |  _|  _| |_| \__ \ | (_) | | | |
    |_| |_|     \__,_|\__,_|_| |_|  \__,_|___/_|\___/|_| |_|

    */
    %utl_rbeginx;
    parmcards4;
    library(ggplot2)
    library(minpack.lm)
    library(haven)
    source("c:/oto/fn_tosas9x.R")
    have<-read_sas("d:/sd1/have.sas7bdat")
    print(have)
    # Define the Bass model function
    bass_model <- function(t, p, q, m) {
      (1 - exp(-(p + q) * t)) / (1 + (q/p) * exp(-(p + q) * t))
    }
    # Fit the Bass model to the data
    fit <- nlsLM(CUMSALES ~ m * bass_model(T, p, q),
                 data = have,
                 start = list(p = 0.01, q = 0.3, m = max(have$CUMSALES)),
                 lower = c(0, 0, max(have$CUMSALES)))
    str(fit)
    # Extract the fitted parameters
    p <- coef(fit)["p"]
    q <- coef(fit)["q"]
    m <- coef(fit)["m"]
    cat("Innovation coefficient (p):", p, "\n")
    cat("Imitation coefficient (q):", q, "\n")
    cat("Market potential (m):", m, "\n")
    p
    q
    m;
    ;;;;
    %utl_rendx;


    data pred;

      %dosubl('proc sql; select avg(cumsales) into :_avg from sd1.have; quit;');

      retain mse 0;

      set sd1.have nobs=obs;

      p=0.008858319;
      q=0.7202366  ;
      m=16.76532   ;

      predicted=m*(1 - exp(-(p + q) * t)) / (1 + (q/p) * exp(-(p + q) * t));

      mse= mse + (predicted-cumsales)**2/obs;
      put mse=;
      resid=predicted-cumsales;
    run;quit;

    proc print data=pred;
    var t cumsales predicted;
    run;quit;

    /**************************************************************************************************************************/
    /*                                                                                                                        */
    /*    BACK total obs=15                                                                                                   */
    /*                                                                                                                        */
    /*      T    CUMSALES    PREDICTED                                                                                        */
    /*                                                                                                                        */
    /*      1       1.00       0.2158                                                                                         */
    /*      2       1.31       0.6459                                                                                         */
    /*      3       1.87       1.4701                                                                                         */
    /*      4       3.16       2.9361                                                                                         */
    /*      5       5.12       5.2285                                                                                         */
    /*      6       7.60       8.1792                                                                                         */
    /*      7      10.69      11.1544                                                                                         */
    /*      8      14.44      13.5001                                                                                         */
    /*      9      15.23      15.0162                                                                                         */
    /*     10      16.13      15.8741                                                                                         */
    /*     11      16.23      16.3234                                                                                         */
    /*     12      16.29      16.5493                                                                                         */
    /*     13      16.33      16.6604                                                                                         */
    /*                                                                                                                        */
    /*                                                                                                                        */
    /*     14        .        16.7146   Estimates                                                                             */
    /*     15        .        16.7408                                                                                         */
    /*                                                                                                                        */
    /**************************************************************************************************************************/

    options ps=64 ls=64;
    proc plot data=pred;
      plot predicted*t='p' cumsales*t='o'/overlay box;
    run;quit;

    /*              _
      ___ _ __   __| |
     / _ \ `_ \ / _` |
    |  __/ | | | (_| |
     \___|_| |_|\__,_|

    */
