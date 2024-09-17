data {
   /* ... declarations ... */
   int T; //データ期間の長さ
   int len_obs; //観測から得られた個数
   int y[len_obs]; //観測値
   int obs_no[len_obs]; //観測値から得られた時点
}
parameters {
   /* ... declarations ... */
   vector [T] mu;
   real<lower=0> s_w;
}
model {
   /* ... declarations ... statements ... */
   //弱情報事前分布
   s_w ~ student_t(3, 0, 10);
   //状態方程式
   for (i in 2:T) {
      /* code */
      mu[i] ~ normal(mu[i -1], s_w );
   }
   //観測方程式
   for (i in 1:len_obs) {
      /* code */
      y[i] ~ bernoulli_logit(mu[obs_no[i]]);
   }
}

generated quantities {
   vector[T] probs;
   probs = inv_logit(mu);
}
