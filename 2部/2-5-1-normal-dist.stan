data {
   int N;
   vector[N] animal_num;
}

parameters {
   real<lower=0> mu;
   real<lower=0> sigma;
}

model {
   animal_num ~ normal(mu, sigma);
}

generated quantities {
   //事後予測分布を得る
   vector[N] pred;
   for ( i in 1:N){
    pred[i] = normal_rng(mu, sigma);
   }
}
