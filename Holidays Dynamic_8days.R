N=2500; # the number of dresses available
TT=2000; # Length of time horizon
prob0=0.1; # No customer
prob1=0.5; # Premium customer
prob2=0.4; # Regular customer
price1=200; # the price for Premium customer
price2=150; # the price for Regular customer

v=matrix(rep( 0, len=(N+1)*(TT+1)), nrow=N+1);
accept2=matrix(rep( 0, len=(N+1)*(TT+1)), nrow=N+1); 

# Terminal Values
for(i in 1:(N+1)){
  v[i,1]=0;
}

# Dynamic Programming Recursion
for(t in 2:(TT+1)){
  for(i in 1:(N+1)){
    
    # For no customer:
    vtogo0=v[i,t-1]; #Value to go if no customer arrives.
    
    # For Premium customer:
    vtogo1=v[i,t-1]; # Value to go if a premium customer arrives and buys a dress
    if(i>1){
      vtogo1=price1+v[i-1,t-1];
    }
    
    # For Regular customer:
    vtogo2=v[i,t-1]; #Value to go if a regular customer arrives. 
    accept2[i,t]=0;
    if(i>1){
      vtogo2=max(price2+v[i-1,t-1],v[i,t-1]);
      
      # the decision in the accept2 variable:
      if(price2+v[i-1,t-1]>v[i,t-1]){
        accept2[i,t]=1;
      }
    }
    
    # Obtaining the overall value function from its parts:
    v[i,t]=prob0*vtogo0+prob1*vtogo1+prob2*vtogo2;
  }
}
# Optimal Total Expected Revenue
OptimalTotalExpectedRevenue=v[N+1,TT+1]
print(OptimalTotalExpectedRevenue)

# Install and load ggplot2 if not already installed
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}
library(ggplot2)

# Plot the optimal total expected revenue over time
time_steps <- 2:(TT+1)
revenue_data <- data.frame(Time = time_steps, Revenue = v[N+1, time_steps])

ggplot(revenue_data, aes(x = Time, y = Revenue)) +
  geom_line() +
  labs(title = "Optimal Total Expected Revenue over Time",
       x = "Time",
       y = "Optimal Total Expected Revenue") +
  theme_minimal()

# Plot the decisions for regular customers over time
decision_data <- data.frame(Time = rep(time_steps, each = (N+1)),
                            Quantity = rep(0:N, times = TT),
                            Acceptance = as.logical(accept2[, time_steps]))

ggplot(decision_data, aes(x = Time, y = Quantity, color = Acceptance)) +
  geom_point() +
  labs(title = "Decision for Regular Customers over Time",
       x = "Time",
       y = "Quantity",
       color = "Accepted") +
  theme_minimal()

# Visualizing the Optimal Policy Structure
acceptance <- t(accept2[2:(N + 1), 2:(TT + 1)])  # transpose of accept2 (horizontal:time)
xaxis <- 1:TT
yaxis <- 1:N

filled.contour(x = xaxis, y = yaxis, z = acceptance, 
               xaxt = "n", yaxt = "n",
               key.axes = axis(4, at = seq(0, 1, by = 1)),
               nlevels = 2,
               color.palette = rainbow,
               xlab = "Remaining Time", ylab = "Remaining Number of dresses")
