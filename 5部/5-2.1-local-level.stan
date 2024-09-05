data {
  int T;
  vector[T] y;
}
parameters {
   /* ... declarations ... */
   vector [T] mu;
   real<lower=0> s_w;
   real<lower=0>s_v;
}
model {
   /* ... declarations ... statements ... */
   for (i in 2:T){
      mu [i] ~ normal( mu[ i - 1], s_w);
   }
   for (i in 1:T) {
      /* code */
      y[i] ~ normal(mu[i], s_v);
   }
}
