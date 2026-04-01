rnaseq <- read.csv(file = 'C:/Users/PMYLS/Downloads/FullData.csv',
                              header = TRUE,
                              row.names = 1)


Design <- factor(rep(c("low","low","low","low","low","low","low","low","low","low","low","low","low","low","low","low","low","low","low","low","low","low","low","low","low","high","high","high","high","high","high","high","high","high","high","high","high","high","high","high","high","high","high","high","high","high","high","high","high","high")))
#Filter low counts
library(edgeR)
dim(rnaseq)
meanLog2CPM <- rowMeans(log2(cpm(rnaseq) + 1))
hist(meanLog2CPM)
countTable <- rnaseq[meanLog2CPM > 1, ]
dim(countTable)

#Normalizing counts
library(DESeq2)
dds <- DESeqDataSetFromMatrix(
  countData = countTable,
  design = ~ Design,
  colData = data.frame(Design=Design))
normCounts <- rlog(dds, blind = FALSE)
#Filter normalized counts
cofVar <- rowSds(assay(normCounts)) / rowMeans(assay(normCounts))
normCounts <- normCounts[cofVar > quantile(cofVar, 0.7), ]
dim(normCounts)
library(caret)
#New score function
rfSBF$score <- function(x, y){
  loadNamespace("pROC")
  pROC::auc(pROC::roc(y, x, quiet = TRUE))[1]
}
#New filter function
rfSBF$filter <- function(score, x, y){
  top100 <- order(score, decreasing = TRUE)[1:100]
  names(score) %in% names(score)[top100]
}
#Decision tree fit function
dtSBF <- rfSBF
dtSBF$fit <- function(x, y, ...){
  loadNamespace("C50")
  C50::C5.0(x = x, y = y)
}
trainingSet <- data.frame(t(assay(normCounts)))
#Decision tree (C5.0)
dtControl <- sbfControl(functions = dtSBF,
                        method = "loocv",
                        saveDetails = TRUE,
                        verbose = FALSE)
dtModel <- sbf(trainingSet, Design,
               sbfControl = dtControl)
#Show model
summary(dtModel$fit)
#Print confusion matrix from validation
confusionMatrix(dtModel$pred$predictions$pred, Design)
#Set random seed
set.seed(123)
#Random forest
rfControl <- sbfControl(functions = rfSBF,
                        method = "loocv",
                        saveDetails = TRUE,
                        verbose = FALSE)
rfModel <- sbf(trainingSet, Design,
               sbfControl = rfControl)
#Show model
rfModel$fit
#Print confusion matrix from validation
confusionMatrix(rfModel$pred$predictions$pred, Design)

# Load necessary libraries
library(ggplot2)

# Define model names and corresponding accuracy values
model_names <- c("Decision Tree", "Random Forest")
accuracy <- c(76, 92)  # Accuracy values for decision tree and random forest models

# Create a data frame for plotting
performance_data <- data.frame(Model = factor(model_names), Accuracy = accuracy)

# Plot the performance comparison
performance_plot <- ggplot(performance_data, aes(x = Model, y = Accuracy, fill = Model)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Performance Comparison of Models",
       x = "Model", y = "Accuracy (%)") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

# Display the plot
print(performance_plot)


# Define model names and corresponding performance metrics
model_names <- c("Decision Tree", "Random Forest")
accuracy <- c(76, 92)  # Accuracy values for decision tree and random forest models
sensitivity <- c(64, 96)  # Sensitivity values for decision tree and random forest models
specificity <- c(88, 88)  # Specificity values for decision tree and random forest models

# Create a data frame for plotting
performance_data <- data.frame(Model = rep(factor(model_names), each = 3),
                               Metric = rep(c("Accuracy", "Sensitivity", "Specificity"), times = 2),
                               Value = c(accuracy, sensitivity, specificity))

# Plot the performance comparison
performance_plot <- ggplot(performance_data, aes(x = Metric, y = Value, group = Model, color = Model)) +
  geom_line() +
  geom_point(size = 3) +
  labs(title = "Performance Comparison of Models",
       x = "Performance Metric", y = "Value (%)") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

# Display the plot
print(performance_plot)
