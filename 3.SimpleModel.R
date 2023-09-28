
# Simplified model testing

x = credit_maturity_data$Remaining_of_Maturity
y = credit_maturity_data$YLD_YTM_MID

plot(x, y)


# simple models
model_x <- lm(y ~ x)
model_x <- lm(y ~ log(x))
model_x <- lm(y ~ poly(x, 2, raw=TRUE))
# model_x <- lm(y ~ poly(x, 3, raw=TRUE))
# model_x =  lm(y ~ bs(x, knots = as.numeric(quantile(x, c(0.50,0.75,0.9)))))

summary(model_x)

res_data <- data.frame(x = seq(from = 1, to = 11, by = 0.25),
                       y = predict(model_x,
                                   newdata = list(x = seq(from = 1, to = 11, by = 0.25)),
                                   interval = "confidence")) %>% 
  rename(FittedCurve = y.fit, UpperCI = y.upr, LowerCI = y.lwr)

View(res_data)

res_data %>% 
  pivot_longer(-x) %>% 
  ggplot() + 
  theme_minimal() + 
  geom_line(aes(x = x, y = value, color = name)) + 
  geom_point(data = credit_maturity_data, 
             mapping = aes(x = Remaining_of_Maturity, y = YLD_YTM_MID)) + 
  xlab('Maturity') + 
  ylab('Yield') + 
  theme(legend.position = c(0.5, 0.1)) + 
  theme(legend.title=element_blank()) + 
  theme(legend.background=element_rect(fill = alpha("white", 0)),
        legend.key = element_rect(colour = "transparent", fill = alpha("white", 0))) + 
  guides(colour = guide_legend(nrow = 1)) + 
  ggplot2::ggtitle(paste0("Fitted Curves")) +
  theme(axis.text.x = element_text(size = 12)) + 
  guides(linetype='non') +
  scale_x_continuous(breaks = seq(0, 11, by = 1),
                     limits = c(0, 11)) 
