# Revenue Management and Pricing: Fashion Rental Business Case Study

This project focuses on optimizing pricing strategies and maximizing revenue for a London-based fashion rental company offering designer dresses for rent. The analysis utilizes dynamic programming for peak periods and a price optimization model for regular days. The rental periods include flexible options for 4-day and 8-day rentals, with both regular and premium services available.

## Project Overview

- **Objective**: To design a pricing strategy that maximizes revenue for a fashion rental company, accounting for varying demand during peak and non-peak periods.
- **Key Focus**:
  - Use dynamic programming to determine optimal pricing for peak periods.
  - Optimize pricing based on customer segmentation and willingness to pay during non-peak periods.
  - Conduct a customer survey to refine pricing strategies.
- **Tech Stack**: R, Customer Survey, Dynamic Programming Models, Price Optimization

## Dataset

The dataset includes a simulated customer survey conducted among 100 individuals and extrapolated to represent 1500 potential customers. The survey results inform pricing strategies based on customer willingness to pay for regular and premium services. Additionally, demand data for both peak and non-peak periods is used to apply dynamic pricing.

### Dataset Features:
- **Customer Survey Data**: Willingness to pay (WTP), rental duration preference (4-day or 8-day), and service type (regular or premium).
- **Demand Data**: Simulated demand probabilities for different time segments and rental durations.

### File Structure:
- **`Customer Survey.csv`**: CSV file containing the results of the customer survey.
- **`Holidays Dynamic_8days.R`**: R script for dynamic pricing during peak times for 8-day rentals.
- **`Holidays Dynamic_4days.R`**: R script for dynamic pricing during peak times for 4-day rentals.
- **`Regular days -Consumer choice_8.R`**: R script for price optimization during regular periods for 8-day rentals.
- **`Regular days -Consumer choice.R`**: R script for price optimization during regular periods for 4-day rentals.
- **`Report.pdf`**: Detailed report discussing the pricing strategy, revenue maximization, and model outputs.
- **`requirements.txt`**: R package dependencies required to run the analysis.

## Analysis Workflow

### 1. Dynamic Pricing for Peak Periods
- **Dynamic Programming Models**: For peak times (e.g., holidays), dynamic programming is used to optimize pricing decisions based on limited inventory and fluctuating demand.
- **Demand Segmentation**: Customers are segmented based on rental duration (4-day or 8-day) and service preference (regular or premium).
- **Optimization Strategy**: The model iterates over time periods, adjusting pricing decisions to maximize total revenue by renting to customers at different price points.

### 2. Price Optimization for Non-Peak Periods
- **Price Differentiation**: A price optimization strategy based on customer choice modeling is used during non-peak periods to maximize revenue.
- **Consumer Surplus Calculation**: Customer willingness to pay is estimated, and the model calculates the optimal price for both premium and regular services based on maximizing consumer surplus and revenue.

### 3. Customer Survey Insights
- **Survey Results**: A simulated customer survey informs the demand function and helps refine pricing strategies by incorporating customer preferences for service type and rental duration.
- **Market Size Estimation**: The survey data, extrapolated to a market segment of 1500 potential customers, provides precise data for more informed pricing decisions.

## Key Findings

### 1. Peak Period Pricing
- **4-Day Rental**: Dynamic programming for 4-day rentals during peak periods yielded an optimal revenue of £156,600, with premium services priced at £120 and regular services at £90.
- **8-Day Rental**: For 8-day rentals, the optimal revenue was £320,000, with premium services priced at £200 and regular services at £150.

### 2. Non-Peak Period Pricing
- **4-Day Rental**: During non-peak periods, the optimal price for premium services was found to be £90, with regular services priced at £70. This strategy maximized revenue at £122,850.
- **8-Day Rental**: For 8-day rentals during non-peak periods, the premium price was set at £145, and regular service at £125, resulting in total revenue of £192,900.

### 3. Customer Segmentation Insights
- Customers showed a strong preference for premium services, especially during non-peak periods, with a higher willingness to pay for longer rental durations.

## Usage

The R scripts demonstrate the following:
1. **Dynamic Pricing**: Models for peak period pricing using dynamic programming for both 4-day and 8-day rental durations.
2. **Price Optimization**: Price optimization strategy for non-peak periods, based on customer segmentation and willingness to pay.
3. **Customer Survey Analysis**: Analysis of customer preferences to inform pricing decisions and refine demand estimation.

## Installation

To run the project locally:

1. Clone the repository:
    ```bash
    git clone https://github.com/your-username/Fashion-Rental-Pricing.git
    cd Fashion-Rental-Pricing
    ```

2. Install the required R packages:
    ```r
    install.packages(c("dplyr", "ggplot2", "lpSolve"))
    ```

3. Run the R scripts:
    ```r
    source("Holidays Dynamic_8days.R")
    source("Regular days -Consumer choice_8.R")
    ```

## Acknowledgements

This project was developed as part of the MSc in Business Analytics at Bayes Business School, under the module **Revenue Management and Pricing**.

## License

MIT License
