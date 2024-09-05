data {
    int T;
    vector[T] ex;
    vector[T] y;
}
parameters {
   /* ... declarations ... */
   vector [T] mu;//水準成分の推定値
   vector[T] b; //事変係数の推定値
   real <lower=0> s_w; //水準成分の仮定誤差の標準偏差
   real<lower=0> s_t;
   real<lower=0> s_v;
}
transformed parameters {
   /* ... declarations ... statements ... */
   vector[T] alpha;
   for (i in 1:T) {
      alpha[i] = mu[i] + b[i] * ex[i];
   }
}
model {
   /* ... declarations ... statements ... */
   //状態方程式に従い、状態が遷移する
   for (i in 2:T) {
      /* code */
      mu[i] ~ normal(mu[i-1], s_w);
      b[i] ~normal(b[i-1], s_t);
   }
   for (i in 1:T) {
      /* code */
      y[i] ~normal(alpha[i], s_v);
   }
}
