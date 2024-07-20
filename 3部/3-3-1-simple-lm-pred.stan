data {
   int N;
   vector[N] sales;
   vector[N] temperature;

   int N_pred; //測対象のデータの大きさ
   vector[N_pred] temperature_pred; //予測対象となる気温
}

parameters {
   real Intercept; //切片
   real beta; //係数
   real<lower=0> sigma;
}

model {
   for (i in 1:N) {
      sales[i] ~ normal(Intercept + beta*temperature[i], sigma);
   }
}

generated quantities {
    vector[N_pred] mu_pred; //ビールの売上の期待値
    vector[N_pred] sales_pred; //ビールの売上の予測値

    for (i in 1:N_pred) {
       mu_pred[i] = Intercept + beta*temperature_pred[i];
       sales_pred[i] = normal_rng(mu_pred[i], sigma);
    }
}
