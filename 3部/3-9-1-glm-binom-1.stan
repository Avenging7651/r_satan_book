data {
   int N;
   int germination[N];
   int bionm_size[N];
   vector[N] solar;
   vector[N] nutrition;
}

parameters {
    real Intercept;
    real b_solar;
    real b_nutrition;
}

model {
   vector[N] prob = Intercept + b_solar*solar + b_nutrition*nutrition;
   germination ~ binomial_logit(bionm_size, prob)
}
