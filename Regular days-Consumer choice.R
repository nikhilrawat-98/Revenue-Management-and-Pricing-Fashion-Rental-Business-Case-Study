setwd("/Users/nick/Desktop")
data1<-read.csv("Customer Survey.csv")
print(data1)
N=nrow(data1)
total_customers=1500
table(data1$WTP_Regular_4_days)
table(data1$WTP_Premium_4_days)
for (i in 1:N){
  data1$maxwtpregular[i]=max(data1[i,2:3])
}
maxreg=max(data1$maxwtpregular)


# finding the optimal premium price for 4 days given regular price is 82 in order to maximize revenue 
reg_4=70
demandpre_4=rep(0,maxreg)
demandreg_4=rep(0,maxreg)

revenue=rep(0,0)
head(data1)
surplus_reg_4=rep(0,N)
for(i in 1:N)
{ surplus_reg_4[i]=data1[i,2]-reg_4
data1$surplus_reg_4[i]=surplus_reg_4[i]
}
head(data1)
#regular surplus has been found by subtracting the given regular price from willingness to pay (regular)
#finding premium surplus for the potential premium price, making a matrix to find all surpluses for all potential prices
surplus_pre_4=matrix(0,N,maxreg)

for(p in 1:maxreg)
{for(i in 1: N ){
  surplus_pre_4[i,p]=data1[i,3]-p
}
}


head(surplus_pre_4)
head(data1)
for(p in 1:maxreg)
{demandreg_4[p]=sum((surplus_reg_4>surplus_pre_4[,p])*(surplus_reg_4>=0))
demandpre_4[p]=sum((surplus_pre_4[,p]>surplus_reg_4)*(surplus_pre_4[,p]>=0))
revenue[p]=reg_4*demandreg_4[p]/100*1500+p*demandpre_4[p]/100*1500
maxrevenue=max(revenue)
}
print(revenue)
print(demandpre_4)
print(demandreg_4)
premium_price_4=which(revenue==maxrevenue)
print(demandreg_4[premium_price_4])
print(demandpre_4[premium_price_4])
total_pre_customer_4=demandpre_4[premium_price_4]/100*1500
total_reg_customer_4=demandreg_4[premium_price_4]/100*1500
print(total_reg_customer_4)
print(total_pre_customer_4)
print(paste("the best premium price to maximise revenue is ",premium_price_4))
print(maxrevenue)

# Assuming the 'revenue' vector contains the calculated revenue for each potential premium price
# and 'maxreg' contains the maximum willingness to pay for the regular option

# Load the ggplot2 library for plotting
library(ggplot2)

# Create a data frame for plotting
revenue_data <- data.frame(
  Premium_Price = 1:maxreg,
  Revenue = revenue
)

# Plot the revenue against the premium price
ggplot(revenue_data, aes(x = Premium_Price, y = Revenue)) +
  geom_line(color = "blue") +
  geom_vline(xintercept = premium_price_4, color = "red", linetype = "dashed") +
  geom_text(aes(x = premium_price_4, label = paste("Optimal Price:", premium_price_4), y = maxrevenue), 
            vjust = -0.5, hjust = 1.1, color = "red") +
  labs(title = "Revenue vs. Premium Price for 4 Days",
       subtitle = paste("Optimal Premium Price: ", premium_price_4),
       x = "Premium Price (for 4 days)",
       y = "Revenue") +
  theme_minimal()

# Display the plot
ggsave("Revenue_PremiumPrice_4Days.png", width = 8, height = 6)

