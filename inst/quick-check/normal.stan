data {
  int N;
  int P;

  vector[N] y;

  int N_NZE;
  int NZE[N_NZE];
  int starts[N];
  int stops[N];
  vector[N_NZE] X_vec;
}

parameters {
  vector[P] betas;
  vector[2] alphas;
  real<lower = 0> sigma;
}

model { 
  betas ~ normal(0, 1);
  sigma ~ normal(0, 1);

  for (i in 1:N) {
    y ~ normal(sum(X_vec[starts[i]:stops[i]] .* betas[NZE[starts[i]:stops[i]]]), sigma);
  }
}


