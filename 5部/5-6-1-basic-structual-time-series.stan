data {
   /* ... declarations ... */
   int T; //データ取得期間の長さ
   vector [T] y; //観測値
}
parameters {
   /* ... declarations ... */
   vector [T] mu;
   vector [T] gamma;
   real<lower=0> s_z;
   real<lower=0> s_v;
   real<lower=0> s_s;
}
transformed parameters {
   /* ... declarations ... statements ... */
   vector [T] alpha;
   for (i in 1:T) {
      /* code */
      alpha[i] = mu[i] + gamma[i];
   }
}
model {
   /* ... declarations ... statements ... */
   for (i in 3:T) {
      /* code */
   mu[i] ~ normal(2 * mu[i -1] - mu[i-2], s_z);
   }
   for (i in 7:T) {
      /* code */
      gamma[i] ~normal(-sum(gamma[(i-6):(i-1)]), s_s);
   }
   for (i in 1:T) {
      /* code */
      y[i] ~ normal(alpha[i], s_v);
   }
}
