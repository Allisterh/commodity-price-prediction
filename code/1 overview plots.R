rm(list = ls())

### Plot overviews on some of the data
library(tidyverse)
library(ggplot2)
library(rmaf)
library(zoo)
library(itsmr)
library(tseries)


### Load data
load("clean data/EIA short term energy outlook monthly.RData")
load("clean data/APSP monthly.RData")
load("clean data/Brent Crude monthly.RData")
load("clean data/Dubai Fateh monthly.RData")
load("clean data/Nat Gas Henry Hub monthly.RData")
load("clean data/WTI Crude monthly.RData")
load("clean data/LNG Asia monthly.RData")


### Create time series
## APSP
ts.apsp.monthly.absolute <- ts(apsp.monthly.absolute$value,
                               start = c(min(apsp.monthly.absolute$year), min(apsp.monthly.absolute$month[apsp.monthly.absolute$year == min(apsp.monthly.absolute$year)])),
                               end = c(max(apsp.monthly.absolute$year), max(apsp.monthly.absolute$month[apsp.monthly.absolute$year == max(apsp.monthly.absolute$year)])),
                               frequency = 12)

cairo_pdf("plots/0_APSP monthly prices.pdf", width = 8, height = 5.5)
plot.ts(ts.apsp.monthly.absolute, ylab = "APSP monthly prices")
dev.off()

ts.apsp.monthly.log.returns <- ts(log(apsp.monthly.return$value + 1),
                                  start = c(min(apsp.monthly.return$year), min(apsp.monthly.return$month[apsp.monthly.return$year == min(apsp.monthly.return$year)])),
                                  end = c(max(apsp.monthly.return$year), max(apsp.monthly.return$month[apsp.monthly.return$year == max(apsp.monthly.return$year)])),
                                  frequency = 12)

cairo_pdf("plots/0_APSP monthly log returns.pdf", width = 8, height = 5.5)
plot.ts(ts.apsp.monthly.log.returns, ylab = "APSP monthly log returns")
dev.off()

ts.apsp.monthly.difference <- diff(ts.apsp.monthly.absolute)


## Brent
ts.brent.monthly.absolute <- ts(brent.monthly.absolute$value,
                                start = c(min(brent.monthly.absolute$year), min(brent.monthly.absolute$month[brent.monthly.absolute$year == min(brent.monthly.absolute$year)])),
                                end = c(max(brent.monthly.absolute$year), max(brent.monthly.absolute$month[brent.monthly.absolute$year == max(brent.monthly.absolute$year)])),
                                frequency = 12)

cairo_pdf("plots/0_Brent monthly prices.pdf", width = 8, height = 5.5)
plot.ts(ts.brent.monthly.absolute, ylab = "Brent monthly prices")
dev.off()

ts.brent.monthly.log.returns <- ts(log(brent.monthly.return$value + 1),
                                   start = c(min(brent.monthly.return$year), min(brent.monthly.return$month[brent.monthly.return$year == min(brent.monthly.return$year)])),
                                   end = c(max(brent.monthly.return$year), max(brent.monthly.return$month[brent.monthly.return$year == max(brent.monthly.return$year)])),
                                   frequency = 12)

cairo_pdf("plots/0_Brent monthly log returns.pdf", width = 8, height = 5.5)
plot.ts(ts.brent.monthly.log.returns, ylab = "Brent monthly log returns")
dev.off()

ts.brent.monthly.difference <- diff(ts.brent.monthly.absolute)


## Dubai Fateh
ts.dubai.monthly.absolute <- ts(dubai.monthly.absolute$value,
                                start = c(min(dubai.monthly.absolute$year), min(dubai.monthly.absolute$month[dubai.monthly.absolute$year == min(dubai.monthly.absolute$year)])),
                                end = c(max(dubai.monthly.absolute$year), max(dubai.monthly.absolute$month[dubai.monthly.absolute$year == max(dubai.monthly.absolute$year)])),
                                frequency = 12)

cairo_pdf("plots/0_Dubai monthly prices.pdf", width = 8, height = 5.5)
plot.ts(ts.dubai.monthly.absolute, ylab = "Dubai Fateh monthly prices")
dev.off()

ts.dubai.monthly.log.returns <- ts(log(dubai.monthly.return$value + 1),
                                   start = c(min(dubai.monthly.return$year), min(dubai.monthly.return$month[dubai.monthly.return$year == min(dubai.monthly.return$year)])),
                                   end = c(max(dubai.monthly.return$year), max(dubai.monthly.return$month[dubai.monthly.return$year == max(dubai.monthly.return$year)])),
                                   frequency = 12)

cairo_pdf("plots/0_Dubai monthly log returns.pdf", width = 8, height = 5.5)
plot.ts(ts.dubai.monthly.log.returns, ylab = "Dubai Fateh monthly log returns")
dev.off()

ts.dubai.monthly.difference <- diff(ts.dubai.monthly.absolute)


## Nat Gas Henry Hub
ts.natgas.us.monthly.absolute <- ts(natgas.us.monthly.absolute$value,
                                    start = c(min(natgas.us.monthly.absolute$year), min(natgas.us.monthly.absolute$month[natgas.us.monthly.absolute$year == min(natgas.us.monthly.absolute$year)])),
                                    end = c(max(natgas.us.monthly.absolute$year), max(natgas.us.monthly.absolute$month[natgas.us.monthly.absolute$year == max(natgas.us.monthly.absolute$year)])),
                                    frequency = 12)

cairo_pdf("plots/0_NatGas Henry Hub monthly prices.pdf", width = 8, height = 5.5)
plot.ts(ts.natgas.us.monthly.absolute, ylab = "Nat Gas Henry Hub monthly prices (USD/MMBtu)")
dev.off()

ts.natgas.us.monthly.log.returns <- ts(log(natgas.us.monthly.return$value + 1),
                                       start = c(min(natgas.us.monthly.return$year), min(natgas.us.monthly.return$month[natgas.us.monthly.return$year == min(natgas.us.monthly.return$year)])),
                                       end = c(max(natgas.us.monthly.return$year), max(natgas.us.monthly.return$month[natgas.us.monthly.return$year == max(natgas.us.monthly.return$year)])),
                                       frequency = 12)

cairo_pdf("plots/0_NatGas Henry Hub monthly log returns.pdf", width = 8, height = 5.5)
plot.ts(ts.natgas.us.monthly.log.returns, ylab = "Nat Gas Henry Hub monthly log returns")
dev.off()

ts.natgas.us.monthly.difference <- diff(ts.natgas.us.monthly.absolute)


## WTI
ts.wti.monthly.absolute <- ts(wti.monthly.absolute$value,
                              start = c(min(wti.monthly.absolute$year), min(wti.monthly.absolute$month[wti.monthly.absolute$year == min(wti.monthly.absolute$year)])),
                              end = c(max(wti.monthly.absolute$year), max(wti.monthly.absolute$month[wti.monthly.absolute$year == max(wti.monthly.absolute$year)])),
                              frequency = 12)

cairo_pdf("plots/0_WTI monthly prices.pdf", width = 8, height = 5.5)
plot.ts(ts.wti.monthly.absolute, ylab = "WTI monthly prices")
dev.off()

ts.wti.monthly.log.returns <- ts(log(wti.monthly.return$value + 1),
                                 start = c(min(wti.monthly.return$year), min(wti.monthly.return$month[wti.monthly.return$year == min(wti.monthly.return$year)])),
                                 end = c(max(wti.monthly.return$year), max(wti.monthly.return$month[wti.monthly.return$year == max(wti.monthly.return$year)])),
                                 frequency = 12)

cairo_pdf("plots/0_WTI monthly log returns.pdf", width = 8, height = 5.5)
plot.ts(ts.wti.monthly.log.returns, ylab = "WTI monthly log returns")
dev.off()

ts.wti.monthly.difference <- diff(ts.wti.monthly.absolute)


## LNG
ts.lng.monthly.absolute <- ts(lng.monthly.absolute$value,
                              start = c(min(lng.monthly.absolute$year), min(lng.monthly.absolute$month[lng.monthly.absolute$year == min(lng.monthly.absolute$year)])),
                              end = c(max(lng.monthly.absolute$year), max(lng.monthly.absolute$month[lng.monthly.absolute$year == max(lng.monthly.absolute$year)])),
                              frequency = 12)

cairo_pdf("plots/0_LNG monthly prices.pdf", width = 8, height = 5.5)
plot.ts(ts.lng.monthly.absolute, ylab = "LNG monthly prices")
dev.off()

ts.lng.monthly.log.returns <- ts(log(lng.monthly.return$value + 1),
                                 start = c(min(lng.monthly.return$year), min(lng.monthly.return$month[lng.monthly.return$year == min(lng.monthly.return$year)])),
                                 end = c(max(lng.monthly.return$year), max(lng.monthly.return$month[lng.monthly.return$year == max(lng.monthly.return$year)])),
                                 frequency = 12)

cairo_pdf("plots/0_LNG monthly log returns.pdf", width = 8, height = 5.5)
plot.ts(ts.lng.monthly.log.returns, ylab = "LNG monthly log returns")
dev.off()

ts.lng.monthly.difference <- diff(ts.lng.monthly.absolute)


### Save timeseries
save(ts.apsp.monthly.absolute, ts.apsp.monthly.log.returns, ts.apsp.monthly.difference, ts.brent.monthly.absolute, ts.brent.monthly.log.returns,
     ts.brent.monthly.difference, ts.dubai.monthly.absolute, ts.dubai.monthly.log.returns, ts.dubai.monthly.difference, ts.natgas.us.monthly.absolute,
     ts.natgas.us.monthly.log.returns, ts.natgas.us.monthly.difference, ts.wti.monthly.absolute, ts.wti.monthly.log.returns, ts.wti.monthly.difference,
     ts.lng.monthly.absolute, ts.lng.monthly.difference, ts.lng.monthly.log.returns,
     file = "clean data/timeseries.RData")

load("clean data/timeseries.RData")


### Correlation plots
## APSP
cairo_pdf("plots/0_APSP autocorrelations.pdf", width = 8.25, height = 10)
layout(mat = matrix(data = c(1, 1, 1, 2, 3, 4, 5, 6, 7), nrow = 3, ncol = 3, byrow = TRUE))
plot.ts(ts.apsp.monthly.absolute, ylab = "APSP monthly prices", main = "APSP spot")
acf(ts.apsp.monthly.absolute, main = "prices")
acf(ts.apsp.monthly.log.returns, main = "log returns")
acf(ts.apsp.monthly.difference, main = "difference")
pacf(ts.apsp.monthly.absolute, main = "prices")
pacf(ts.apsp.monthly.log.returns, main = "log returns")
pacf(ts.apsp.monthly.difference, main = "difference")
dev.off()

## Brent
cairo_pdf("plots/0_Brent autocorrelations.pdf", width = 8.25, height = 10)
layout(mat = matrix(data = c(1, 1, 1, 2, 3, 4, 5, 6, 7), nrow = 3, ncol = 3, byrow = TRUE))
plot.ts(ts.brent.monthly.absolute, ylab = "Brent monthly prices", main = "Brent spot")
acf(ts.brent.monthly.absolute, main = "prices")
acf(ts.brent.monthly.log.returns, main = "log returns")
acf(ts.brent.monthly.difference, main = "difference")
pacf(ts.brent.monthly.absolute, main = "prices")
pacf(ts.brent.monthly.log.returns, main = "log returns")
pacf(ts.brent.monthly.difference, main = "difference")
dev.off()

## Dubai Crude
cairo_pdf("plots/0_Dubai autocorrelations.pdf", width = 8.25, height = 10)
layout(mat = matrix(data = c(1, 1, 1, 2, 3, 4, 5, 6, 7), nrow = 3, ncol = 3, byrow = TRUE))
plot.ts(ts.dubai.monthly.absolute, ylab = "Dubai monthly prices", main = "Dubai Crude spot")
acf(ts.dubai.monthly.absolute, main = "prices")
acf(ts.dubai.monthly.log.returns, main = "log returns")
acf(ts.dubai.monthly.difference, main = "difference")
pacf(ts.dubai.monthly.absolute, main = "prices")
pacf(ts.dubai.monthly.log.returns, main = "log returns")
pacf(ts.dubai.monthly.difference, main = "difference")
dev.off()

## Nat Gas
cairo_pdf("plots/0_NatGas autocorrelations.pdf", width = 8.25, height = 10)
layout(mat = matrix(data = c(1, 1, 1, 2, 3, 4, 5, 6, 7), nrow = 3, ncol = 3, byrow = TRUE))
plot.ts(ts.natgas.us.monthly.absolute, ylab = "Nat Gas monthly prices", main = "Nat Gas Henry Hub spot")
acf(ts.natgas.us.monthly.absolute, main = "prices")
acf(ts.natgas.us.monthly.log.returns, main = "log returns")
acf(ts.natgas.us.monthly.difference, main = "difference")
pacf(ts.natgas.us.monthly.absolute, main = "prices")
pacf(ts.natgas.us.monthly.log.returns, main = "log returns")
pacf(ts.natgas.us.monthly.difference, main = "difference")
dev.off()

## WTI
cairo_pdf("plots/0_WTI autocorrelations.pdf", width = 8.25, height = 10)
layout(mat = matrix(data = c(1, 1, 1, 2, 3, 4, 5, 6, 7), nrow = 3, ncol = 3, byrow = TRUE))
plot.ts(ts.wti.monthly.absolute, ylab = "WTI monthly prices", main = "WTI spot")
acf(ts.wti.monthly.absolute, main = "prices")
acf(ts.wti.monthly.log.returns, main = "log returns")
acf(ts.wti.monthly.difference, main = "difference")
pacf(ts.wti.monthly.absolute, main = "prices")
pacf(ts.wti.monthly.log.returns, main = "log returns")
pacf(ts.wti.monthly.difference, main = "difference")
dev.off()

## LNG
cairo_pdf("plots/0_LNG autocorrelations.pdf", width = 8.25, height = 10)
layout(mat = matrix(data = c(1, 1, 1, 2, 3, 4, 5, 6, 7), nrow = 3, ncol = 3, byrow = TRUE))
plot.ts(ts.lng.monthly.absolute, ylab = "LNG monthly prices", main = "LNG spot")
acf(ts.lng.monthly.absolute, main = "prices")
acf(ts.lng.monthly.log.returns, main = "log returns")
acf(ts.lng.monthly.difference, main = "difference")
pacf(ts.lng.monthly.absolute, main = "prices")
pacf(ts.lng.monthly.log.returns, main = "log returns")
pacf(ts.lng.monthly.difference, main = "difference")
dev.off()


### Combined correlation plots
cairo_pdf("plots/0_All autocorrelations.pdf", width = 9, height = 12)
layout(mat = matrix(data = c(1:24), nrow = 6, ncol = 4, byrow = TRUE))
acf(ts.apsp.monthly.log.returns[1:length(ts.apsp.monthly.log.returns)], main = "APSP log returns", ylim = c(-0.2,1))
acf(ts.apsp.monthly.difference[1:length(ts.apsp.monthly.difference)], main = "APSP difference", ylim = c(-0.2,1))
pacf(ts.apsp.monthly.log.returns[1:length(ts.apsp.monthly.log.returns)], main = "APSP log returns", ylim = c(-0.2,1))
pacf(ts.apsp.monthly.difference[1:length(ts.apsp.monthly.difference)], main = "APSP difference", ylim = c(-0.2,1))
acf(ts.brent.monthly.log.returns[1:length(ts.brent.monthly.log.returns)], main = "Brent log returns", ylim = c(-0.2,1))
acf(ts.brent.monthly.difference[1:length(ts.brent.monthly.difference)], main = "Brent difference", ylim = c(-0.2,1))
pacf(ts.brent.monthly.log.returns[1:length(ts.brent.monthly.log.returns)], main = "Brent log returns", ylim = c(-0.2,1))
pacf(ts.brent.monthly.difference[1:length(ts.brent.monthly.difference)], main = "Brent difference", ylim = c(-0.2,1))
acf(ts.dubai.monthly.log.returns[1:length(ts.dubai.monthly.log.returns)], main = "Dubai Fateh log returns", ylim = c(-0.2,1))
acf(ts.dubai.monthly.difference[1:length(ts.dubai.monthly.difference)], main = "Dubai Fateh difference", ylim = c(-0.2,1))
pacf(ts.dubai.monthly.log.returns[1:length(ts.dubai.monthly.log.returns)], main = "Dubai Fateh log returns", ylim = c(-0.2,1))
pacf(ts.dubai.monthly.difference[1:length(ts.dubai.monthly.difference)], main = "Dubai Fateh difference", ylim = c(-0.2,1))
acf(ts.lng.monthly.log.returns[1:length(ts.lng.monthly.log.returns)], main = "LNG log returns", ylim = c(-0.2,1))
acf(ts.lng.monthly.difference[1:length(ts.lng.monthly.difference)], main = "LNG difference", ylim = c(-0.2,1))
pacf(ts.lng.monthly.log.returns[1:length(ts.lng.monthly.log.returns)], main = "LNG log returns", ylim = c(-0.2,1))
pacf(ts.lng.monthly.difference[1:length(ts.lng.monthly.difference)], main = "LNG difference", ylim = c(-0.2,1))
acf(ts.natgas.us.monthly.log.returns[1:length(ts.natgas.us.monthly.log.returns)], main = "NatGas Henry Hub log returns", ylim = c(-0.2,1))
acf(ts.natgas.us.monthly.difference[1:length(ts.natgas.us.monthly.difference)], main = "NatGas Henry Hub difference", ylim = c(-0.2,1))
pacf(ts.natgas.us.monthly.log.returns[1:length(ts.natgas.us.monthly.log.returns)], main = "NatGas Henry Hub log returns", ylim = c(-0.2,1))
pacf(ts.natgas.us.monthly.difference[1:length(ts.natgas.us.monthly.difference)], main = "NatGas Henry Hub difference", ylim = c(-0.2,1))
acf(ts.wti.monthly.log.returns[1:length(ts.wti.monthly.log.returns)], main = "WTI log returns", ylim = c(-0.2,1))
acf(ts.wti.monthly.difference[1:length(ts.wti.monthly.difference)], main = "WTI difference", ylim = c(-0.2,1))
pacf(ts.wti.monthly.log.returns[1:length(ts.wti.monthly.log.returns)], main = "WTI log returns", ylim = c(-0.2,1))
pacf(ts.wti.monthly.difference[1:length(ts.wti.monthly.difference)], main = "WTI difference", ylim = c(-0.2,1))
dev.off()


### Only log return series correlation plots
cairo_pdf("plots/0_Log return autocorrelations.pdf", width = 9, height = 8)
layout(mat = matrix(data = c(1:6, 1, 7, 3, 8, 5, 9, 10:15, 10, 16, 12, 17, 14, 18), nrow = 6, ncol = 4), heights = c(1, 5, 1, 5, 1, 5))
par(mar=c(0, 0, 0, 0))
plot.new()
text(0.57, 0.5, "APSP log returns", cex = 1.5, font = 2)
par(mar=c(4, 5, 0.5, 0.5))
acf(ts.apsp.monthly.log.returns[1:length(ts.apsp.monthly.log.returns)], main = "", ylim = c(-0.2,1), mar = c(1,0,1,0))
par(mar=c(0, 0, 0, 0))
plot.new()
text(0.57, 0.5, "Dubai Fateh log returns", cex = 1.5, font = 2)
par(mar=c(4, 5, 0.5, 0.5))
acf(ts.dubai.monthly.log.returns[1:length(ts.dubai.monthly.log.returns)], main = "", ylim = c(-0.2,1))
par(mar=c(0, 0, 0, 0))
plot.new()
text(0.57, 0.5, "NatGas Henry Hub log returns", cex = 1.5, font = 2)
par(mar=c(4, 5, 0.5, 0.5))
acf(ts.natgas.us.monthly.log.returns[1:length(ts.natgas.us.monthly.log.returns)], main = "", ylim = c(-0.2,1))
pacf(ts.apsp.monthly.log.returns[1:length(ts.apsp.monthly.log.returns)], main = "", ylim = c(-0.2,1))
pacf(ts.dubai.monthly.log.returns[1:length(ts.dubai.monthly.log.returns)], main = "", ylim = c(-0.2,1))
pacf(ts.natgas.us.monthly.log.returns[1:length(ts.natgas.us.monthly.log.returns)], main = "", ylim = c(-0.2,1))
par(mar=c(0, 0, 0, 0))
plot.new()
text(0.57, 0.5, "Brent log returns", cex = 1.5, font = 2)
par(mar=c(4, 5, 0.5, 0.5))
acf(ts.brent.monthly.log.returns[1:length(ts.brent.monthly.log.returns)], main = "", ylim = c(-0.2,1))
par(mar=c(0, 0, 0, 0))
plot.new()
text(0.57, 0.5, "LNG Asia log returns", cex = 1.5, font = 2)
par(mar=c(4, 5, 0.5, 0.5))
acf(ts.lng.monthly.log.returns[1:length(ts.lng.monthly.log.returns)], main = "", ylim = c(-0.2,1))
par(mar=c(0, 0, 0, 0))
plot.new()
text(0.57, 0.5, "WTI log returns", cex = 1.5, font = 2)
par(mar=c(4, 5, 0.5, 0.5))
acf(ts.wti.monthly.log.returns[1:length(ts.wti.monthly.log.returns)], main = "", ylim = c(-0.2,1))
pacf(ts.brent.monthly.log.returns[1:length(ts.brent.monthly.log.returns)], main = "", ylim = c(-0.2,1))
pacf(ts.lng.monthly.log.returns[1:length(ts.lng.monthly.log.returns)], main = "", ylim = c(-0.2,1))
pacf(ts.wti.monthly.log.returns[1:length(ts.wti.monthly.log.returns)], main = "", ylim = c(-0.2,1))
dev.off()
