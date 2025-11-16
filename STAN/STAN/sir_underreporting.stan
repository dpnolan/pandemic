functions {
  array[] real sir(real t, array[] real y, array[] real theta, 
              array[] real x_r, array[] int x_i) {

      real S = y[1];
      real I = y[2];
      real R = y[3];
      int N = x_i[1];
      
      real beta = theta[1];
      real gamma = theta[2];
      
      real dS_dt = -beta * I * S / N;
      real dI_dt = beta * I * S / N - gamma * I;
      real dR_dt =  gamma * I;
      
      return {dS_dt, dI_dt, dR_dt};
  }
}
data {
  int<lower=1> n_days;
  real t0;
  array[3] real y0;
  array[n_days] real ts;
  int N;
  array[n_days] int cases;
}
transformed data {
  array[0] real x_r;
  array[1] int x_i = { N };
}
parameters {
  real<lower=0> gamma;
  real<lower=0> beta;
  real<lower=0> phi_inv;
  real<lower=0, upper=1> p_reported; // proportion of infected (symptomatic) people reported
}
transformed parameters{
  array[n_days, 3] real y;
  array [n_days - 1] real incidence;
  real phi = 1. / phi_inv;
  // initial compartement values
  array[2] real theta = {beta, gamma};
  y = integrate_ode_rk45(sir, y0, t0, ts, theta, x_r, x_i);
  for (i in 1:n_days-1){
    incidence[i] =  (y[i, 1] - y[i+1, 1]) * p_reported;
  }
}
model {
  //priors
  beta ~ normal(2, 1);
  gamma ~ normal(0.4, 0.5);
  phi_inv ~ exponential(5);
  //p_reported ~ beta(2, 3);//normal(0, 0.5);
  p_reported ~ beta(1, 2);
  //sampling distribution
  //col(matrix x, int n) - The n-th column of matrix x. Here the number of infected people 
  cases[1:(n_days-1)] ~ neg_binomial_2(incidence, phi);
}
generated quantities {
  real R0 = beta / gamma;
  real recovery_time = 1 / gamma;
  //real incubation_time = 1 / a;
  array[n_days-1] real pred_cases;
  pred_cases = neg_binomial_2_rng(incidence, phi);

  vector[n_days - 1] log_lik; // Declare a vector for log-likelihood values
  for (i in 1:(n_days - 1)) {
    // Calculate the log-likelihood for each observation
    log_lik[i] = neg_binomial_2_lpmf(cases[i] | incidence[i], phi);
  }
}