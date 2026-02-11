# ML-Project-Giestte (Gisette)

This project explores binary classification on the Gisette dataset using a complete machine learning workflow:
data loading → cleaning → feature selection → model training → hyperparameter tuning → evaluation.

The implementation is done in a single Jupyter notebook:
`Machine Learning.ipynb` and the written report is included as `MachineLearningReport.pdf`.

---

## Dataset (Training Set Used)
The project uses the provided training files:

- gisette_train.data (features)
- gisette_train.labels (labels)

From the loaded training set:
- 6000 samples
- 5000 features originally
- 45 constant features removed → 4955 remaining features
- Labels are converted from {-1, 1} to {0, 1} inside the notebook

---

## What’s inside the notebook

### 1) Data Preparation & Cleaning
- Loads the data using relative paths (files must be in the same folder as the notebook).
- Removes constant columns (features with a single unique value).
- Splits into train/test with a stratified 80/20 split (to preserve label balance).

### 2) Scaling
- Uses StandardScaler to normalize features before training linear models.

### 3) Feature Selection (High-dimensional data)
Because Gisette is high-dimensional, the notebook applies feature selection using:

- ANOVA F-score (f_classif) via SelectKBest
- Tests multiple k values to choose a reasonable number of features
- Final experiments use k = 600 features

### 4) Models Trained
Two linear models were trained and compared:

- Linear SVM (LinearSVC)
- Logistic Regression (LogisticRegression with L2 regularization)

### 5) Hyperparameter Tuning
- Uses Stratified K-Fold Cross Validation
- Uses GridSearchCV to tune regularization strength:
  - SVM: C ∈ {0.001, 0.01, 0.1, 1}
  - Logistic Regression: C ∈ {0.01, 0.1, 1}

### 6) Evaluation
Evaluation is done using:
- Accuracy
- F1-score
- Confusion matrix visualization

---

## Results Summary (Holdout Test Set)

| Model | Setup | Test Accuracy | Test F1 |
|------|-------|---------------|---------|
| Linear SVM | StandardScaler (no feature selection) | 0.9775 | — |
| Linear SVM | VarianceThreshold + SelectKBest(k=600) + tuned C | 0.9817 | 0.9818 |
| Logistic Regression | StandardScaler baseline | 0.9775 | 0.9776 |
| Logistic Regression | VarianceThreshold + SelectKBest(k=600) + tuned C | 0.9833 | 0.9835 |

Best-performing setup in this notebook:
Logistic Regression + feature selection + tuning.

---

## (Extra) Unsupervised Exploration
The notebook also includes an exploratory clustering section:
- Agglomerative Clustering
- Silhouette score check for k = 2..9 (best silhouette was at k=2, but very small)
- Adjusted Rand Score was computed to compare cluster assignments vs true labels (low score, expected for this dataset)

---

## Repository Structure
- Machine Learning.ipynb — main notebook (full workflow)
- MachineLearningReport.pdf — final report
- gisette_train.data / gisette_train.data.zip — training features
- gisette_train.labels — training labels
- requirements.txt — dependencies
- .gitignore — ignores common Python/Jupyter cache files

---

## How to Run (Local)

### 1) Install dependencies
```bash
pip install -r requirements.txt
