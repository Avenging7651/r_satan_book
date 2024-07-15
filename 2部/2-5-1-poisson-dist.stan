data {
   int N;
   int animal_num[N];
}

parameters {
   real<lower=0> lambda;
}

model {
    //
   animal_num ~ poisson(lambda);
}

generated quantities {
   //事後予測分布を得る
   vector[N] pred;
   for ( i in 1:N){
    pred[i] = poisson_rng(lambda);
   }
}
