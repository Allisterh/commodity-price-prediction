rm(list = ls())

library(tidyverse)
library(viridis)
library(ggpubr)
library(plotly)

load("results/ml models/APSP_log_returns_forked_2.RData")
load("results/ml models/Brent_log_returns_forked_2.RData")
load("results/ml models/Dubai_log_returns_forked_2.RData")
load("results/ml models/LNG_log_returns_forked_2.RData")
load("results/ml models/NatGas_log_returns_forked_2.RData")
load("results/ml models/WTI_log_returns_forked_2.RData")


### APSP
# Prepare data to plot
apsp.plot.data <- select(tuning.results.apsp.log.returns.forked, -mae)
apsp.plot.data$n_hl <- sapply(apsp.plot.data$hidden_config, function(x){length(unlist(str_split(x, ",")))})
apsp.plot.data$n_nodes <- sapply(apsp.plot.data$hidden_config, function(x){sum(as.numeric(unlist(str_split(x, ","))))})
apsp.plot.data$nodes_category[apsp.plot.data$n_nodes < 5] <- "<5"
apsp.plot.data$nodes_category[apsp.plot.data$n_nodes >= 5 & apsp.plot.data$n_nodes <= 10] <- "5-10"
apsp.plot.data$nodes_category[apsp.plot.data$n_nodes > 10 & apsp.plot.data$n_nodes <= 20] <- "11-20"
apsp.plot.data$nodes_category[apsp.plot.data$n_nodes > 20 & apsp.plot.data$n_nodes <= 30] <- "21-30"
apsp.plot.data$nodes_category[apsp.plot.data$n_nodes > 30 & apsp.plot.data$n_nodes <= 40] <- "31-40"
apsp.plot.data$nodes_category[apsp.plot.data$n_nodes > 40 & apsp.plot.data$n_nodes <= 50] <- "41-50"
apsp.plot.data$nodes_category[apsp.plot.data$n_nodes > 50 & apsp.plot.data$n_nodes <= 60] <- "51-60"
apsp.plot.data$hl_category <- ifelse(apsp.plot.data$n_hl > 1, paste0(apsp.plot.data$n_hl, " layers, ", apsp.plot.data$nodes_category, " nodes"), paste0(apsp.plot.data$n_hl, " layer, ", apsp.plot.data$nodes_category, " nodes"))

apsp.plot.data <- aggregate(mape ~ n_lags + hl_category, apsp.plot.data, median)
apsp.plot.data$hl_category <- factor(apsp.plot.data$hl_category, levels = c("1 layer, <5 nodes", "1 layer, 5-10 nodes", "1 layer, 11-20 nodes", "2 layers, <5 nodes", "2 layers, 5-10 nodes",
                                                                            "2 layers, 11-20 nodes", "2 layers, 21-30 nodes", "2 layers, 31-40 nodes", "3 layers, <5 nodes", "3 layers, 5-10 nodes",
                                                                            "3 layers, 11-20 nodes", "3 layers, 21-30 nodes", "3 layers, 31-40 nodes", "3 layers, 41-50 nodes", "3 layers, 51-60 nodes"))

# Plot
apsp.mape.heatmap <- ggplot(data = apsp.plot.data, aes(x = hl_category, y = n_lags, fill = mape)) + 
  geom_tile() +
  scale_fill_viridis(name = "median\nMAPE", option = "magma", discrete = FALSE, direction = -1) +
  labs(title = "ANN error heatmap", subtitle = "APSP log returns", x = "hidden layer configuration", y = "nr. of lags used") +
  theme_bw() +
  theme(axis.text.x = element_text(family = "Arial", color = "#000000", angle = 45, hjust = 1, vjust = 1.2),
        axis.line = element_blank(),
        panel.border = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank(),
        plot.background = element_blank(),
        plot.margin = unit(c(0.5, 0.5, 0.5, 0.5), "in"))

apsp.mape.heatmap

ggsave(filename = "plots/3 ANN APSP error heatmap.pdf", plot = apsp.mape.heatmap, device = cairo_pdf)


### Brent
# Prepare data to plot
brent.plot.data <- select(tuning.results.brent.log.returns.forked, -mae)
brent.plot.data$n_hl <- sapply(brent.plot.data$hidden_config, function(x){length(unlist(str_split(x, ",")))})
brent.plot.data$n_nodes <- sapply(brent.plot.data$hidden_config, function(x){sum(as.numeric(unlist(str_split(x, ","))))})
brent.plot.data$nodes_category[brent.plot.data$n_nodes < 5] <- "<5"
brent.plot.data$nodes_category[brent.plot.data$n_nodes >= 5 & brent.plot.data$n_nodes <= 10] <- "5-10"
brent.plot.data$nodes_category[brent.plot.data$n_nodes > 10 & brent.plot.data$n_nodes <= 20] <- "11-20"
brent.plot.data$nodes_category[brent.plot.data$n_nodes > 20 & brent.plot.data$n_nodes <= 30] <- "21-30"
brent.plot.data$nodes_category[brent.plot.data$n_nodes > 30 & brent.plot.data$n_nodes <= 40] <- "31-40"
brent.plot.data$nodes_category[brent.plot.data$n_nodes > 40 & brent.plot.data$n_nodes <= 50] <- "41-50"
brent.plot.data$nodes_category[brent.plot.data$n_nodes > 50 & brent.plot.data$n_nodes <= 60] <- "51-60"
brent.plot.data$hl_category <- ifelse(brent.plot.data$n_hl > 1, paste0(brent.plot.data$n_hl, " layers, ", brent.plot.data$nodes_category, " nodes"), paste0(brent.plot.data$n_hl, " layer, ", brent.plot.data$nodes_category, " nodes"))

brent.plot.data <- aggregate(mape ~ n_lags + hl_category, brent.plot.data, median)
brent.plot.data$hl_category <- factor(brent.plot.data$hl_category, levels = c("1 layer, <5 nodes", "1 layer, 5-10 nodes", "1 layer, 11-20 nodes", "2 layers, <5 nodes", "2 layers, 5-10 nodes",
                                                                              "2 layers, 11-20 nodes", "2 layers, 21-30 nodes", "2 layers, 31-40 nodes", "3 layers, <5 nodes", "3 layers, 5-10 nodes",
                                                                              "3 layers, 11-20 nodes", "3 layers, 21-30 nodes", "3 layers, 31-40 nodes", "3 layers, 41-50 nodes", "3 layers, 51-60 nodes"))

# Plot
brent.mape.heatmap <- ggplot(data = brent.plot.data, aes(x = hl_category, y = n_lags, fill = mape)) + 
  geom_tile() +
  scale_fill_viridis(name = "median\nMAPE", option = "magma", discrete = FALSE, direction = -1) +
  labs(title = "ANN error heatmap", subtitle = "Brent log returns", x = "hidden layer configuration", y = "nr. of lags used") +
  theme_bw() +
  theme(axis.text.x = element_text(family = "Arial", color = "#000000", angle = 45, hjust = 1, vjust = 1.2),
        axis.line = element_blank(),
        panel.border = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank(),
        plot.background = element_blank(),
        plot.margin = unit(c(0.5, 0.5, 0.5, 0.5), "in"))

brent.mape.heatmap

ggsave(filename = "plots/3 ANN Brent error heatmap.pdf", plot = brent.mape.heatmap, device = cairo_pdf)


### Dubai
# Prepare data to plot
dubai.plot.data <- select(tuning.results.dubai.log.returns.forked, -mae)
dubai.plot.data$n_hl <- sapply(dubai.plot.data$hidden_config, function(x){length(unlist(str_split(x, ",")))})
dubai.plot.data$n_nodes <- sapply(dubai.plot.data$hidden_config, function(x){sum(as.numeric(unlist(str_split(x, ","))))})
dubai.plot.data$nodes_category[dubai.plot.data$n_nodes < 5] <- "<5"
dubai.plot.data$nodes_category[dubai.plot.data$n_nodes >= 5 & dubai.plot.data$n_nodes <= 10] <- "5-10"
dubai.plot.data$nodes_category[dubai.plot.data$n_nodes > 10 & dubai.plot.data$n_nodes <= 20] <- "11-20"
dubai.plot.data$nodes_category[dubai.plot.data$n_nodes > 20 & dubai.plot.data$n_nodes <= 30] <- "21-30"
dubai.plot.data$nodes_category[dubai.plot.data$n_nodes > 30 & dubai.plot.data$n_nodes <= 40] <- "31-40"
dubai.plot.data$nodes_category[dubai.plot.data$n_nodes > 40 & dubai.plot.data$n_nodes <= 50] <- "41-50"
dubai.plot.data$nodes_category[dubai.plot.data$n_nodes > 50 & dubai.plot.data$n_nodes <= 60] <- "51-60"
dubai.plot.data$hl_category <- ifelse(dubai.plot.data$n_hl > 1, paste0(dubai.plot.data$n_hl, " layers, ", dubai.plot.data$nodes_category, " nodes"), paste0(dubai.plot.data$n_hl, " layer, ", dubai.plot.data$nodes_category, " nodes"))

dubai.plot.data <- aggregate(mape ~ n_lags + hl_category, dubai.plot.data, median)
dubai.plot.data$hl_category <- factor(dubai.plot.data$hl_category, levels = c("1 layer, <5 nodes", "1 layer, 5-10 nodes", "1 layer, 11-20 nodes", "2 layers, <5 nodes", "2 layers, 5-10 nodes",
                                                                              "2 layers, 11-20 nodes", "2 layers, 21-30 nodes", "2 layers, 31-40 nodes", "3 layers, <5 nodes", "3 layers, 5-10 nodes",
                                                                              "3 layers, 11-20 nodes", "3 layers, 21-30 nodes", "3 layers, 31-40 nodes", "3 layers, 41-50 nodes", "3 layers, 51-60 nodes"))

# Plot
dubai.mape.heatmap <- ggplot(data = dubai.plot.data, aes(x = hl_category, y = n_lags, fill = mape)) + 
  geom_tile() +
  scale_fill_viridis(name = "median\nMAPE", option = "magma", discrete = FALSE, direction = -1) +
  labs(title = "ANN error heatmap", subtitle = "Dubai Fateh log returns", x = "hidden layer configuration", y = "nr. of lags used") +
  theme_bw() +
  theme(axis.text.x = element_text(family = "Arial", color = "#000000", angle = 45, hjust = 1, vjust = 1.2),
        axis.line = element_blank(),
        panel.border = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank(),
        plot.background = element_blank(),
        plot.margin = unit(c(0.5, 0.5, 0.5, 0.5), "in"))

dubai.mape.heatmap

ggsave(filename = "plots/3 ANN Dubai error heatmap.pdf", plot = dubai.mape.heatmap, device = cairo_pdf)


### LNG
# Prepare data to plot
lng.plot.data <- select(tuning.results.lng.log.returns.forked, -mae)
lng.plot.data$n_hl <- sapply(lng.plot.data$hidden_config, function(x){length(unlist(str_split(x, ",")))})
lng.plot.data$n_nodes <- sapply(lng.plot.data$hidden_config, function(x){sum(as.numeric(unlist(str_split(x, ","))))})
lng.plot.data$nodes_category[lng.plot.data$n_nodes < 5] <- "<5"
lng.plot.data$nodes_category[lng.plot.data$n_nodes >= 5 & lng.plot.data$n_nodes <= 10] <- "5-10"
lng.plot.data$nodes_category[lng.plot.data$n_nodes > 10 & lng.plot.data$n_nodes <= 20] <- "11-20"
lng.plot.data$nodes_category[lng.plot.data$n_nodes > 20 & lng.plot.data$n_nodes <= 30] <- "21-30"
lng.plot.data$nodes_category[lng.plot.data$n_nodes > 30 & lng.plot.data$n_nodes <= 40] <- "31-40"
lng.plot.data$nodes_category[lng.plot.data$n_nodes > 40 & lng.plot.data$n_nodes <= 50] <- "41-50"
lng.plot.data$nodes_category[lng.plot.data$n_nodes > 50 & lng.plot.data$n_nodes <= 60] <- "51-60"
lng.plot.data$hl_category <- ifelse(lng.plot.data$n_hl > 1, paste0(lng.plot.data$n_hl, " layers, ", lng.plot.data$nodes_category, " nodes"), paste0(lng.plot.data$n_hl, " layer, ", lng.plot.data$nodes_category, " nodes"))

lng.plot.data <- aggregate(mape ~ n_lags + hl_category, lng.plot.data, median)
lng.plot.data$hl_category <- factor(lng.plot.data$hl_category, levels = c("1 layer, <5 nodes", "1 layer, 5-10 nodes", "1 layer, 11-20 nodes", "2 layers, <5 nodes", "2 layers, 5-10 nodes",
                                                                          "2 layers, 11-20 nodes", "2 layers, 21-30 nodes", "2 layers, 31-40 nodes", "3 layers, <5 nodes", "3 layers, 5-10 nodes",
                                                                          "3 layers, 11-20 nodes", "3 layers, 21-30 nodes", "3 layers, 31-40 nodes", "3 layers, 41-50 nodes", "3 layers, 51-60 nodes"))

# Plot
lng.mape.heatmap <- ggplot(data = lng.plot.data, aes(x = hl_category, y = n_lags, fill = mape)) + 
  geom_tile() +
  scale_fill_viridis(name = "median\nMAPE", option = "magma", discrete = FALSE, direction = -1) +
  labs(title = "ANN error heatmap", subtitle = "LNG Asia log returns", x = "hidden layer configuration", y = "nr. of lags used") +
  theme_bw() +
  theme(axis.text.x = element_text(family = "Arial", color = "#000000", angle = 45, hjust = 1, vjust = 1.2),
        axis.line = element_blank(),
        panel.border = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank(),
        plot.background = element_blank(),
        plot.margin = unit(c(0.5, 0.5, 0.5, 0.5), "in"))

lng.mape.heatmap

ggsave(filename = "plots/3 ANN LNG error heatmap.pdf", plot = lng.mape.heatmap, device = cairo_pdf)


### NatGas
# Prepare data to plot
natgas.us.plot.data <- select(tuning.results.natgas.us.log.returns.forked, -mae)
natgas.us.plot.data$n_hl <- sapply(natgas.us.plot.data$hidden_config, function(x){length(unlist(str_split(x, ",")))})
natgas.us.plot.data$n_nodes <- sapply(natgas.us.plot.data$hidden_config, function(x){sum(as.numeric(unlist(str_split(x, ","))))})
natgas.us.plot.data$nodes_category[natgas.us.plot.data$n_nodes < 5] <- "<5"
natgas.us.plot.data$nodes_category[natgas.us.plot.data$n_nodes >= 5 & natgas.us.plot.data$n_nodes <= 10] <- "5-10"
natgas.us.plot.data$nodes_category[natgas.us.plot.data$n_nodes > 10 & natgas.us.plot.data$n_nodes <= 20] <- "11-20"
natgas.us.plot.data$nodes_category[natgas.us.plot.data$n_nodes > 20 & natgas.us.plot.data$n_nodes <= 30] <- "21-30"
natgas.us.plot.data$nodes_category[natgas.us.plot.data$n_nodes > 30 & natgas.us.plot.data$n_nodes <= 40] <- "31-40"
natgas.us.plot.data$nodes_category[natgas.us.plot.data$n_nodes > 40 & natgas.us.plot.data$n_nodes <= 50] <- "41-50"
natgas.us.plot.data$nodes_category[natgas.us.plot.data$n_nodes > 50 & natgas.us.plot.data$n_nodes <= 60] <- "51-60"
natgas.us.plot.data$hl_category <- ifelse(natgas.us.plot.data$n_hl > 1, paste0(natgas.us.plot.data$n_hl, " layers, ", natgas.us.plot.data$nodes_category, " nodes"), paste0(natgas.us.plot.data$n_hl, " layer, ", natgas.us.plot.data$nodes_category, " nodes"))

natgas.us.plot.data <- aggregate(mape ~ n_lags + hl_category, natgas.us.plot.data, median)
natgas.us.plot.data$hl_category <- factor(natgas.us.plot.data$hl_category, levels = c("1 layer, <5 nodes", "1 layer, 5-10 nodes", "1 layer, 11-20 nodes", "2 layers, <5 nodes", "2 layers, 5-10 nodes",
                                                                                      "2 layers, 11-20 nodes", "2 layers, 21-30 nodes", "2 layers, 31-40 nodes", "3 layers, <5 nodes", "3 layers, 5-10 nodes",
                                                                                      "3 layers, 11-20 nodes", "3 layers, 21-30 nodes", "3 layers, 31-40 nodes", "3 layers, 41-50 nodes", "3 layers, 51-60 nodes"))

# Plot
natgas.us.mape.heatmap <- ggplot(data = natgas.us.plot.data, aes(x = hl_category, y = n_lags, fill = mape)) + 
  geom_tile() +
  scale_fill_viridis(name = "median\nMAPE", option = "magma", discrete = FALSE, direction = -1) +
  labs(title = "ANN error heatmap", subtitle = "NatGas US log returns", x = "hidden layer configuration", y = "nr. of lags used") +
  theme_bw() +
  theme(axis.text.x = element_text(family = "Arial", color = "#000000", angle = 45, hjust = 1, vjust = 1.2),
        axis.line = element_blank(),
        panel.border = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank(),
        plot.background = element_blank(),
        plot.margin = unit(c(0.5, 0.5, 0.5, 0.5), "in"))

natgas.us.mape.heatmap

ggsave(filename = "plots/3 ANN NatGas error heatmap.pdf", plot = natgas.us.mape.heatmap, device = cairo_pdf)


### WTI
# Prepare data to plot
wti.plot.data <- select(tuning.results.wti.log.returns.forked, -mae)
wti.plot.data$n_hl <- sapply(wti.plot.data$hidden_config, function(x){length(unlist(str_split(x, ",")))})
wti.plot.data$n_nodes <- sapply(wti.plot.data$hidden_config, function(x){sum(as.numeric(unlist(str_split(x, ","))))})
wti.plot.data$nodes_category[wti.plot.data$n_nodes < 5] <- "<5"
wti.plot.data$nodes_category[wti.plot.data$n_nodes >= 5 & wti.plot.data$n_nodes <= 10] <- "5-10"
wti.plot.data$nodes_category[wti.plot.data$n_nodes > 10 & wti.plot.data$n_nodes <= 20] <- "11-20"
wti.plot.data$nodes_category[wti.plot.data$n_nodes > 20 & wti.plot.data$n_nodes <= 30] <- "21-30"
wti.plot.data$nodes_category[wti.plot.data$n_nodes > 30 & wti.plot.data$n_nodes <= 40] <- "31-40"
wti.plot.data$nodes_category[wti.plot.data$n_nodes > 40 & wti.plot.data$n_nodes <= 50] <- "41-50"
wti.plot.data$nodes_category[wti.plot.data$n_nodes > 50 & wti.plot.data$n_nodes <= 60] <- "51-60"
wti.plot.data$hl_category <- ifelse(wti.plot.data$n_hl > 1, paste0(wti.plot.data$n_hl, " layers, ", wti.plot.data$nodes_category, " nodes"), paste0(wti.plot.data$n_hl, " layer, ", wti.plot.data$nodes_category, " nodes"))

wti.plot.data <- aggregate(mape ~ n_lags + hl_category, wti.plot.data, median)
wti.plot.data$hl_category <- factor(wti.plot.data$hl_category, levels = c("1 layer, <5 nodes", "1 layer, 5-10 nodes", "1 layer, 11-20 nodes", "2 layers, <5 nodes", "2 layers, 5-10 nodes",
                                                                          "2 layers, 11-20 nodes", "2 layers, 21-30 nodes", "2 layers, 31-40 nodes", "3 layers, <5 nodes", "3 layers, 5-10 nodes",
                                                                          "3 layers, 11-20 nodes", "3 layers, 21-30 nodes", "3 layers, 31-40 nodes", "3 layers, 41-50 nodes", "3 layers, 51-60 nodes"))

# Plot
wti.mape.heatmap <- ggplot(data = wti.plot.data, aes(x = hl_category, y = n_lags, fill = mape)) + 
  geom_tile() +
  scale_fill_viridis(name = "median\nMAPE", option = "magma", discrete = FALSE, direction = -1) +
  labs(title = "ANN error heatmap", subtitle = "WTI log returns", x = "hidden layer configuration", y = "nr. of lags used") +
  theme_bw() +
  theme(axis.text.x = element_text(family = "Arial", color = "#000000", angle = 45, hjust = 1, vjust = 1.2),
        axis.line = element_blank(),
        panel.border = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank(),
        plot.background = element_blank(),
        plot.margin = unit(c(0.5, 0.5, 0.5, 0.5), "in"))

wti.mape.heatmap

ggsave(filename = "plots/3 ANN WTI error heatmap.pdf", plot = wti.mape.heatmap, device = cairo_pdf)


### Combine the plots to include in the paper ----
## APSP
apsp.mape.heatmap <- ggplot(data = apsp.plot.data, aes(x = hl_category, y = n_lags, fill = mape)) + 
  geom_tile() +
  scale_fill_viridis(name = "median\nMAPE", option = "magma", discrete = FALSE, direction = -1) +
  labs(title = "APSP", x = "hidden layer configuration", y = "nr. of lags used") +
  theme_bw() +
  theme(axis.text.x = element_text(family = "Arial", color = "#000000", angle = 45, hjust = 1, vjust = 1.2),
        axis.line = element_blank(),
        panel.border = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank(),
        plot.background = element_blank(),
        plot.margin = unit(c(0.05, 0, 0, 0.35), "in"))

## Brent
brent.mape.heatmap <- ggplot(data = brent.plot.data, aes(x = hl_category, y = n_lags, fill = mape)) + 
  geom_tile() +
  scale_fill_viridis(name = "median\nMAPE", option = "magma", discrete = FALSE, direction = -1) +
  labs(title = "Brent", x = "hidden layer configuration", y = "nr. of lags used") +
  theme_bw() +
  theme(axis.text.x = element_text(family = "Arial", color = "#000000", angle = 45, hjust = 1, vjust = 1.2),
        axis.line = element_blank(),
        panel.border = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank(),
        plot.background = element_blank(),
        plot.margin = unit(c(0.05, 0, 0, 0.35), "in"))

## Dubai
dubai.mape.heatmap <- ggplot(data = dubai.plot.data, aes(x = hl_category, y = n_lags, fill = mape)) + 
  geom_tile() +
  scale_fill_viridis(name = "median\nMAPE", option = "magma", discrete = FALSE, direction = -1) +
  labs(title = "Dubai Fateh", x = "hidden layer configuration", y = "nr. of lags used") +
  theme_bw() +
  theme(axis.text.x = element_text(family = "Arial", color = "#000000", angle = 45, hjust = 1, vjust = 1.2),
        axis.line = element_blank(),
        panel.border = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank(),
        plot.background = element_blank(),
        plot.margin = unit(c(0.05, 0, 0, 0.35), "in"))

## LNG
lng.mape.heatmap <- ggplot(data = lng.plot.data, aes(x = hl_category, y = n_lags, fill = mape)) + 
  geom_tile() +
  scale_fill_viridis(name = "median\nMAPE", option = "magma", discrete = FALSE, direction = -1) +
  labs(title = "LNG Asia", x = "hidden layer configuration", y = "nr. of lags used") +
  theme_bw() +
  theme(axis.text.x = element_text(family = "Arial", color = "#000000", angle = 45, hjust = 1, vjust = 1.2),
        axis.line = element_blank(),
        panel.border = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank(),
        plot.background = element_blank(),
        plot.margin = unit(c(0.05, 0, 0, 0.35), "in"))

## NatGas
natgas.us.mape.heatmap <- ggplot(data = natgas.us.plot.data, aes(x = hl_category, y = n_lags, fill = mape)) + 
  geom_tile() +
  scale_fill_viridis(name = "median\nMAPE", option = "magma", discrete = FALSE, direction = -1) +
  labs(title = "NatGas Henry Hub", x = "hidden layer configuration", y = "nr. of lags used") +
  theme_bw() +
  theme(axis.text.x = element_text(family = "Arial", color = "#000000", angle = 45, hjust = 1, vjust = 1.2),
        axis.line = element_blank(),
        panel.border = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank(),
        plot.background = element_blank(),
        plot.margin = unit(c(0.05, 0, 0, 0.35), "in"))

## WTI
wti.mape.heatmap <- ggplot(data = wti.plot.data, aes(x = hl_category, y = n_lags, fill = mape)) + 
  geom_tile() +
  scale_fill_viridis(name = "median\nMAPE", option = "magma", discrete = FALSE, direction = -1) +
  labs(title = "WTI", x = "hidden layer configuration", y = "nr. of lags used") +
  theme_bw() +
  theme(axis.text.x = element_text(family = "Arial", color = "#000000", angle = 45, hjust = 1, vjust = 1.2),
        axis.line = element_blank(),
        panel.border = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank(),
        plot.background = element_blank(),
        plot.margin = unit(c(0.05, 0, 0, 0.35), "in"))


ann.heatmaps <- ggarrange(apsp.mape.heatmap, brent.mape.heatmap, dubai.mape.heatmap, lng.mape.heatmap, natgas.us.mape.heatmap, wti.mape.heatmap,
                          ncol = 2, nrow = 3)

ann.heatmaps

ggsave(filename = "plots/3 ANN combined error heatmaps.pdf", plot = ann.heatmaps, device = cairo_pdf, width = 9, height = 12)



### 3D surface plots
## APSP
apsp.plot.data <- select(tuning.results.apsp.log.returns.forked, -mae)
apsp.plot.data$n_hl <- sapply(apsp.plot.data$hidden_config, function(x){length(unlist(str_split(x, ", ")))})
apsp.plot.data$n_nodes <- sapply(apsp.plot.data$hidden_config, function(x){sum(as.numeric(unlist(str_split(x, ", "))))})

# Remove outliers
apsp.plot.data <- subset(apsp.plot.data, mape <= quantile(apsp.plot.data$mape, 0.95))

apsp.mape.surface <- plot_ly(data = apsp.plot.data, x = ~n_lags, y = ~n_nodes, z = ~mape, color = ~n_hl, alpha = 0.5)
apsp.mape.surface
