# 🏥 Medical Costs Analysis using Statistical Methods

This project explores the **factors influencing medical insurance charges** using statistical hypothesis testing and descriptive analysis. Leveraging the popular **Medical Cost Personal Dataset** from Kaggle, the study focuses on how smoking, BMI, and regional differences affect healthcare costs.

---

## 📌 Objective

To identify statistically significant variables that impact medical insurance charges using:

- Descriptive statistics & visualizations
- Hypothesis testing (T-tests, ANOVA, Chi-Square)

---

## 📊 Dataset Overview

- 📦 **Total records:** 1,338
- 🧾 **Features:**
  - `age`
  - `sex`
  - `bmi`
  - `children`
  - `smoker`
  - `region`
  - `charges`

📚 **Source:** [Medical Cost Dataset on Kaggle](https://www.kaggle.com/datasets/mirichoi0218/insurance)

---

## 🔍 Methods Applied

### ✅ Descriptive Statistics & Visualization

- **Histograms** for BMI and charges  
- **Pie charts** for gender and region  
- Insights:
  - BMI is normally distributed around 30.6 (above healthy limit of 25)
  - Charges are positively skewed (some patients pay much higher)

---

### 🧪 Hypothesis Testing

#### 1. **T-Test: Smoking vs. Non-Smoking Charges**
- **Result:** Significant difference in charges  
- **Conclusion:** Smokers pay **~4x higher** charges  
- _p-value < 2.2e-16_

#### 2. **One-Way ANOVA: Region vs. Charges**
- **Conclusion:** Regional charge differences are significant (_p = 0.0309_)  
- **Implication:** Location plays a role, but less than smoking

#### 3. **Two-Way ANOVA: Smoking × Region**
- **Main Effect (Smoking):** Very significant (_p < 2e-16_)  
- **Interaction Effect:** Present (_p = 1.18e-05_)  
- **Conclusion:** Smoking effect varies by region

#### 4. **Chi-Square Test: Smoking vs. Region**
- **Result:** No significant relationship  
- **Conclusion:** Smoking status is **independent** of region

---

## 🧠 Key Findings

- Smoking is the **strongest predictor** of higher medical charges.
- Regional differences exist but have a smaller effect.
- There's a **significant interaction** between smoking and region.
- Health policy should focus on smoking cessation to reduce costs.

---

## 🛠 Technologies Used

- **Language:** R / Python (depending on implementation)
- **Libraries:** pandas, matplotlib/seaborn or ggplot2, scipy/statsmodels  
- **Statistical Tests:** T-test, ANOVA (1-way & 2-way), Chi-square

---

## 👩‍💻 Author

**Bhavyani Dodda**  
MS Data Science – Rutgers University  
📧 bhavyani.dodda123@gmail.com  
🔗 [LinkedIn](https://linkedin.com/in/bhavyani-dodda-414ab6195)

