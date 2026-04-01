# 🧬 Biomarker Identification in Pancreatic Ductal Adenocarcinoma

**Program:** Data Science & Artificial Intelligence (DSAI) - Final Year Project  
**Domain:** Transcriptomics, Next-Generation Sequencing (NGS), Machine Learning  
**Tech Stack:** R, edgeR, DESeq2, Random Forest, Decision Trees  

---

## 📌 Project Overview
Pancreatic Ductal Adenocarcinoma (PDAC) is highly aggressive and often diagnosed late. This project aims to identify reliable genomic biomarkers for PDAC by integrating a Next-Generation Sequencing (NGS) pipeline with advanced Machine Learning algorithms. 

By analyzing RNA-seq count data, we extracted Differentially Expressed Genes (DEGs) and trained predictive models to classify cancer presence with high precision.

---

## 🛠️ Methodology & Technical Workflow

### 1. NGS Pipeline & Quality Control
* Conducted initial mapping and quality control of raw sequencing data using **FastQ Screen**.
* Filtered low counts to ensure robust downstream statistical analysis.

### 2. Transcriptomics Data Normalization (R)
* Utilized **edgeR** and **DESeq2** libraries.
* Applied `rlog` (regularized log) transformation to normalize raw gene expression data.
* Filtered normalized counts using the Coefficient of Variation to isolate the most significant features.

### 3. Machine Learning Modeling
* Split the processed genomic data into training and testing sets.
* Deployed **Random Forest** and **Decision Tree** algorithms to evaluate predictive performance based on the identified genetic biomarkers.
* Generated performance visualizations using **ggplot2**.

---

## 📊 Results & Performance Evaluation

The **Random Forest** algorithm significantly outperformed the Decision Tree, proving to be a highly reliable architecture for this diagnostic classification task.

| Performance Metric | Random Forest Model | Decision Tree Model |
| :--- | :--- | :--- |
| **Accuracy** | **92.0%** | 76.0% |
| **Sensitivity** | **96.0%** | 64.0% |
| **Specificity** | **88.0%** | 88.0% |

---

## 📁 Repository Structure

* **[`ML.R`](ML.R)**: The core R script containing the data normalization process, feature selection, and machine learning model training.
* **[`Data files.rar`](Data%20files.rar)**: The genomic datasets utilized for training the models.
* **[`Final_Report.pdf`](# 🧬 Biomarker Identification in Pancreatic Ductal Adenocarcinoma

**Program:** Data Science & Artificial Intelligence (DSAI) - Final Year Project  
**Domain:** Transcriptomics, Next-Generation Sequencing (NGS), Machine Learning  
**Tech Stack:** R, edgeR, DESeq2, Random Forest, Decision Trees  

---

## 📌 Project Overview
Pancreatic Ductal Adenocarcinoma (PDAC) is highly aggressive and often diagnosed late. This project aims to identify reliable genomic biomarkers for PDAC by integrating a Next-Generation Sequencing (NGS) pipeline with advanced Machine Learning algorithms. 

By analyzing RNA-seq count data, we extracted Differentially Expressed Genes (DEGs) and trained predictive models to classify cancer presence with high precision.

---

## 🛠️ Methodology & Technical Workflow

### 1. NGS Pipeline & Quality Control
* Conducted initial mapping and quality control of raw sequencing data using **FastQ Screen**.
* Filtered low counts to ensure robust downstream statistical analysis.

### 2. Transcriptomics Data Normalization (R)
* Utilized **edgeR** and **DESeq2** libraries.
* Applied `rlog` (regularized log) transformation to normalize raw gene expression data.
* Filtered normalized counts using the Coefficient of Variation to isolate the most significant features.

### 3. Machine Learning Modeling
* Split the processed genomic data into training and testing sets.
* Deployed **Random Forest** and **Decision Tree** algorithms to evaluate predictive performance based on the identified genetic biomarkers.
* Generated performance visualizations using **ggplot2**.

---

## 📊 Results & Performance Evaluation

The **Random Forest** algorithm significantly outperformed the Decision Tree, proving to be a highly reliable architecture for this diagnostic classification task.

| Performance Metric | Random Forest Model | Decision Tree Model |
| :--- | :--- | :--- |
| **Accuracy** | **92.0%** | 76.0% |
| **Sensitivity** | **96.0%** | 64.0% |
| **Specificity** | **88.0%** | 88.0% |

---

## 📁 Repository Structure

* **[`ML.R`](ML.R)**: The core R script containing the data normalization process, feature selection, and machine learning model training.
* **[`Data files.rar`](Data%20files.rar)**: The genomic datasets utilized for training the models.
* **Research Report:** [Download Final Report PDF](Final_Report.pdf) : The comprehensive 34-page research thesis detailing the biological background, methodology, and full analytical results. *(Clicking this link will directly download the PDF to bypass GitHub's preview limits).*

---

## 💡 Conclusion
The integration of Machine Learning with traditional NGS pipelines successfully identified key biomarkers for Pancreatic Ductal Adenocarcinoma with a 92% accuracy rate. This highlights the critical role of Data Science and AI in accelerating oncological diagnostics and precision medicine.?raw=true)**: The comprehensive 34-page research thesis detailing the biological background, methodology, and full analytical results. *(Clicking this link will directly download the PDF to bypass GitHub's preview limits).*

---

## 💡 Conclusion
The integration of Machine Learning with traditional NGS pipelines successfully identified key biomarkers for Pancreatic Ductal Adenocarcinoma with a 92% accuracy rate. This highlights the critical role of Data Science and AI in accelerating oncological diagnostics and precision medicine.
