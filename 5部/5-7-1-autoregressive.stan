data {
   /* ... declarations ... */
   int T;
   vector[T] y;
}
parameters {
   /* ... declarations ... */
   real<lower=0> s_w;
   real b_ar;
   real Intercept;
   }
   model {
      /* ... declarations ... statements ... */
      for (i in 2:T) {
         y[i] ~ normal(Intercept + y[ i -1] * b_ar, s_w);
      }
   }
