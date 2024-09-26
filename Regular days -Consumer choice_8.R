setwd("/Users/nick/Desktop")
data1<-read.csv("Customer Survey.csv")
print(data1)

N=nrow(data1)
total_customers=1500


for (i in 1:N){
  data1$maxwtpremium[i]=max(data1[i,4:5])
}
maxpre=max(data1$maxwtpremium)
head(data1)
table(data1$WTP_Premium_8_days)
table(data1$WTP_Regular_8_days)


# finding the optimal premium price for 8 days given regular price is 140 in order to maximize revenue 
reg_8=125

demandpre_8=rep(0,maxpre)
demandreg_8=rep(0,maxpre)
revenue=rep(0,0)
head(data1)
surplus_reg_8=rep(0,N)
for(i in 1:N)
{ surplus_reg_8[i]=data1[i,4]-reg_8
data1$surplus_reg_8[i]=surplus_reg_8[i]
}
head(data1)
#regular surplus has been found by subtracting the given regular price from willingness to pay (Regular)
#finding Premium surplus for the potential premium price, making a matrix to find all surpluses for all potential prices
surplus_pre_8=matrix(0,N,maxpre)

for(p in 1:maxpre)
{for(i in 1: N ){
  surplus_pre_8[i,p]=data1[i,5]-p
}
}


head(surplus_pre_8)
head(data1)
for(p in 1:maxpre)
{demandreg_8[p]=sum((surplus_reg_8>surplus_pre_8[,p])*(surplus_reg_8>=0))
demandpre_8[p]=sum((surplus_pre_8[,p]>surplus_reg_8)*(surplus_pre_8[,p]>=0))
revenue[p]=reg_8*demandreg_8[p]/100*1500+p*demandpre_8[p]/100*1500
maxrevenue=max(revenue)
}

print(revenue)
print(demandpre_8)
print(demandreg_8)
premium_price_8=which(revenue==maxrevenue)
print(demandreg_8[premium_price_8])
print(demandpre_8[premium_price_8])

total_pre_customer_8=demandpre_8[premium_price_8]/100*1500
total_reg_customer_8=demandreg_8[premium_price_8]/100*1500
print(total_reg_customer_8)
print(total_pre_customer_8)
print(paste("the best premium price to maximise revenue is ",premium_price_8))
print(maxrevenue)

# Assuming your revenue data is calculated correctly and is stored in the 'revenue' variable
# and the range of premium prices is from 1 to 'maxpre'

# Installing necessary package if not already installed
if (!require("ggplot2")) install.packages("ggplot2")

# Load ggplot2 for plotting
library(ggplot2)

# Create a data frame for plotting
plot_data <- data.frame(
  Premium_Price = 1:maxpre,
  Revenue = revenue
)

# Create the line plot
ggplot(plot_data, aes(x = Premium_Price, y = Revenue)) +
  geom_line(color = "blue") +
  labs(title = "Revenue vs. Premium Price",
       x = "Premium Price",
       y = "Revenue") +
  theme_minimal()

# Alternatively, if you want to highlight the premium price that maximizes revenue:
max_revenue_point <- data.frame(
  Premium_Price = premium_price_8,
  Revenue = maxrevenue
)
ggplot(plot_data, aes(x = Premium_Price, y = Revenue)) +
  geom_line(color = "blue") +
  geom_vline(xintercept = premium_price_8, color = "red", linetype = "dashed") +
  geom_point(data = max_revenue_point, aes(x = Premium_Price, y = Revenue), color = "red", size = 4) +
  geom_text(aes(x = premium_price_8, label = paste("Optimal Price:", premium_price_8), y = maxrevenue), 
            vjust = -0.5, hjust = 1.1, color = "red") +
  labs(title = "Revenue vs. Premium Price",
       subtitle = paste("Optimal Premium Price: ", premium_price_8),
       x = "Premium Price(for 8 days)",
       y = "Revenue") +
  theme_minimal()