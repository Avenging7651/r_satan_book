data {
   int N;
   vector[N] sales;
   vector[N] temperature;
}

parameters {
   real Intercept; //切片
   real beta; //係数
   real<lower=0> sigma; //標準偏差
}

model {
// 次のモデルを作成
// u_i = beta_0 + beta_1 * x_i
//  y ~ normral(u_i, sigma^2)

//    Intercept + beta * temperature
       sales ~ normal(Intercept + beta*temperature, sigma);
}
