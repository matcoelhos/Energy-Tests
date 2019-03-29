setwd("/Users/mateuscoelho/Desktop/Mateus/Python/Serial Read")

#### READ AND SEPARATE DATA ####
#OPTIMIZED
OP1 <- read.table("result_OP.txt")
OP1$V1 <- OP1$V1*66/185 #correcting sensitivity issue

print(min(OP1$V1))
print(mean(OP1$V1))
print(sd(OP1$V1))
print(max(OP1$V1))

Curr <- OP1$V1
time <- OP1$V2

idleCurr <- Curr[(time<=10)]
idleTime <- time[(time<=10)]

bootCurr <- Curr[(time>=10 & time <=70)]
bootTime <- time[(time>=10 & time <=70)]

runCurr <- Curr[(time>=70 & time <=130)]
runTime <- time[(time>=70 & time <=130)]

idleonCurr <- Curr[(time>=130 & time <=140)]
idleonTime <- time[(time>=130 & time <=140)]

floraoffCurr <- Curr[(time>=140 & time <=160)]
floraoffTime <- time[(time>=140 & time <=160)]

endCurr <- Curr[(time>=160 & time <=170)]
endTime <- time[(time>=160 & time <=170)]

#NON-OPTIMIZED
OP2 <- read.table("result_NOP.txt")

OP2$V1 <- OP2$V1*66/185 #correcting sensitivity issue

print(min(OP2$V1))
print(mean(OP2$V1))
print(sd(OP2$V1))
print(max(OP2$V1))

Curr <- OP2$V1
time <- OP2$V2

idleCurr2 <- Curr[(time<=10)]
idleTime2 <- time[(time<=10)]

bootCurr2 <- Curr[(time>=10 & time <=70)]
bootTime2 <- time[(time>=10 & time <=70)]

runCurr2 <- Curr[(time>=70 & time <=130)]
runTime2 <- time[(time>=70 & time <=130)]

idleonCurr2 <- Curr[(time>=130 & time <=140)]
idleonTime2 <- time[(time>=130 & time <=140)]

floraoffCurr2 <- Curr[(time>=140 & time <=160)]
floraoffTime2 <- time[(time>=140 & time <=160)]

endCurr2 <- Curr[(time>=160 & time <=170)]
endTime2 <- time[(time>=160 & time <=170)]

#### PLOTS ####

#IDLE
plot(idleTime, idleCurr, type = 'l', col = "blue", xlim = c(0,11), ylim = c(0,250), xlab = 'Time (s)', ylab = 'Current (mA)', main="Idle (Begin)")
par(new = T)
plot(idleTime2, idleCurr2, type = 'l', col = "red", xlim = c(0,11), ylim = c(0,250), xlab = '', ylab = '')

#BOOT
plot(bootTime, bootCurr, type = 'l', col = "blue", xlim = c(9,71), ylim = c(0,250), xlab = 'Time (s)', ylab = 'Current (mA)', main="Boot")
par(new = T)
plot(bootTime2, bootCurr2, type = 'l', col = "red", xlim = c(9,71), ylim = c(0,250), xlab = '', ylab = '')

#RUN
plot(runTime, runCurr, type = 'l', col = "blue", xlim = c(69,131), ylim = c(0,250), xlab = 'Time (s)', ylab = 'Current (mA)', main="Application Run")
par(new = T)
plot(runTime2, runCurr2, type = 'l', col = "red", xlim = c(69,131), ylim = c(0,250), xlab = '', ylab = '')

#IDLE (Running)
plot(idleonTime, idleonCurr, type = 'l', col = "blue", xlim = c(129,141), ylim = c(0,250), xlab = 'Time (s)', ylab = 'Current (mA)', main="Idle (Running)")
par(new = T)
plot(idleonTime2, idleonCurr2, type = 'l', col = "red", xlim = c(129,141), ylim = c(0,250), xlab = '', ylab = '')

#FLORA OFF
plot(floraoffTime, floraoffCurr, type = 'l', col = "blue", xlim = c(139,161), ylim = c(0,250), xlab = 'Time (s)', ylab = 'Current (mA)', main="Flora Off")
par(new = T)
plot(floraoffTime2, floraoffCurr2, type = 'l', col = "red", xlim = c(139,161), ylim = c(0,250), xlab = '', ylab = '')

#END
plot(endTime, endCurr, type = 'l', col = "blue", xlim = c(159,171), ylim = c(0,250), xlab = 'Time (s)', ylab = 'Current (mA)', main="Idle (End)")
par(new = T)
plot(endTime2, endCurr2, type = 'l', col = "red", xlim = c(159,171), ylim = c(0,250), xlab = '', ylab = '')

#FULL
plot(OP1$V2, OP1$V1, type = 'l', col = "blue", xlim = c(0,171), ylim = c(0,250), xlab = 'Time (s)', ylab = 'Current (mA)', main = "Full Test")
par(new = T)
plot(OP2$V2, OP2$V1, type = 'l', col = "red", xlim = c(0,171), ylim = c(0,250), xlab = '', ylab = '')

print(min(endCurr2))
print(mean(endCurr2))
print(sd(endCurr2))
print(max(endCurr2))