data {
   /* ... declarations ... */
   int T;
   vector[T] ex;
   int y[T];
}
parameters {
   /* ... declarations ... */
   vector[T] mu;
   vector[T] r;
   real b;
   real<lower=0> s_z;
   real<lower=0> s_r;
}
transformed parameters {
   /* ... declarations ... statements ... */
   vector[T] lambda;
   for (i in 1:T) {
    lambda[i] = mu[i] + b* ex[i] + r[i] ;
   }
}
model {
   r ~ normal(0, s_r);
   for (i in 3:T) {
      mu[i] ~ normal(2 * mu[i-1] - mu[i-2], s_z);
   }
   for (i in 1:T) {
      /* code */
      y[i] ~ poisson_log(lambda[i]);
      }
}

generated quantities {
   //状態推定値
   vector[T] lambda_exp;
   //ランダム効果除外の推定値
   vector[T] lambda_smooth;
   //ランダム効果除外、説明変数固定の状態推定値
   vector[T] lambda_smooth_fix;

   lambda_exp = (lambda);
   lambda_smooth = exp(mu + b * ex);
   lambda_smooth_fix = exp(mu + b * mean(ex));
}

