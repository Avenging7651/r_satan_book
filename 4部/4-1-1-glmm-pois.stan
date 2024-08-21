data {
   /* ... declarations ... */
   int N;
   int fish_num[N];
   vector[N] sunny;
   vector[N] temp;
}

parameters {
   /* ... declarations ... */
   real Intercept;
   real b_temp;
   real b_sunny;
   vector [N] r;
   real<lower=0> sigma_r;
}
transformed parameters {
   /* ... declarations ... statements ... */
   vector[N] lamda = Intercept + b_sunny*sunny + b_temp*temp + r;
}
model {
   /* ... declarations ... statements ... */
   r ~ normal(0, sigma_r);
   fish_num ~ poisson_log(lamda);
}