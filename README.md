# HR Employee Attrition Analysis — MySQL

## 📌 Project Overview

Employee attrition is an important business challenge because high employee turnover can increase recruitment costs, reduce productivity, and affect organizational performance.

This project analyzes an **HR employee dataset of 120 employees** using **MySQL** to identify patterns in employee attrition, understand the major reasons employees leave, and determine which departments and employee groups experience the highest number of exits.

The project focuses on **data cleaning, data validation, SQL querying, relational data analysis, and business insights**.

---

## 🎯 Business Objectives

The main objectives of this analysis were to:

* Analyze the overall employee attrition rate.
* Identify departments with the highest employee exits.
* Analyze attrition across different job roles.
* Identify the major reasons employees leave the organization.
* Analyze employee exits by gender and age group.
* Understand rehire eligibility among former employees.
* Identify departments with the highest attrition rates.
* Convert raw HR data into meaningful business insights.

---

## 🗂️ Dataset Structure

The project consists of four related tables:

| Table            | Description                                                    |
| ---------------- | -------------------------------------------------------------- |
| `employees`      | Contains employee demographic and employment information       |
| `departments`    | Contains department information                                |
| `job_roles`      | Contains employee job-role information                         |
| `employee_exits` | Contains information about employees who left the organization |

### Dataset Size

* **Employees:** 120
* **Employee exits:** 48
* **Departments:** 8
* **Job roles:** 15

---

## 🧹 Data Cleaning & Validation

Before performing the analysis, the dataset was checked for common data-quality issues.

The following activities were performed:

* Checked for duplicate records.
* Checked for missing values.
* Validated employee and department relationships.
* Checked foreign-key relationships between tables.
* Investigated missing values in the `eligible_for_rehire` column.
* Standardized inconsistent categorical values.
* Verified that employee exits were correctly linked to employees.
* Validated the results using SQL aggregation queries.

One example of data standardization involved inconsistent capitalization in attrition reasons, such as:

* `Better Opportunity` / `Better opportunity`
* `Salary` / `salary`
* `Manager Issues` / `Manager issues`

These values were standardized before analyzing attrition reasons.

---

# 📊 Key Analysis & Findings

## 1. Overall Attrition

The organization has **120 employees**, of which **48 employees have left**.

### Overall Attrition Rate: **40%**

This indicates a significant level of employee turnover and makes employee retention an important area for HR investigation.

---

## 2. Employees Left by Department

| Department             | Employees Left |
| ---------------------- | -------------: |
| IT                     |              9 |
| Operations             |              8 |
| Human Resources        |              7 |
| Finance                |              6 |
| Research & Development |              6 |
| Customer Service       |              5 |
| Marketing              |              4 |
| Sales                  |              3 |

IT recorded the highest number of employee exits, followed by Operations and Human Resources.

---

## 3. Department-wise Attrition Rate

| Department             | Employees Left | Attrition Rate |
| ---------------------- | -------------: | -------------: |
| IT                     |              9 |     **60.00%** |
| Human Resources        |              7 |     **50.00%** |
| Finance                |              6 |     **40.00%** |
| Operations             |              8 |     **36.36%** |
| Customer Service       |              5 |     **35.71%** |
| Sales                  |              3 |     **33.33%** |
| Research & Development |              6 |     **33.33%** |
| Marketing              |              4 |     **30.77%** |

### Key Finding

**IT has the highest attrition rate at 60%**, making it the department requiring the most attention from a retention perspective.

---

## 4. Attrition Reasons

After standardizing the reason categories:

| Attrition Reason    | Employees Left |
| ------------------- | -------------: |
| Better Opportunity  |             13 |
| Higher Studies      |              6 |
| Work Environment    |              5 |
| Career Growth       |              5 |
| Personal Reasons    |              4 |
| Relocation          |              4 |
| Job Dissatisfaction |              4 |
| Salary              |              3 |
| Manager Issues      |              3 |
| Work-Life Balance   |              1 |

### Key Finding

**Better Opportunity was the leading reason for employee exits**, accounting for **13 out of 48 exits (27.1%)**.

Career-related and workplace-related factors were also important contributors to employee turnover.

---

## 5. Attrition by Job Role

| Job Role                   | Employees Left |
| -------------------------- | -------------: |
| Operations Manager         |              6 |
| HR Executive               |              5 |
| Data Analyst               |              5 |
| Customer Support Executive |              5 |
| Financial Analyst          |              4 |
| Marketing Executive        |              4 |
| Sales Manager              |              3 |
| Research Analyst           |              3 |
| Project Manager            |              3 |
| HR Manager                 |              2 |
| Software Engineer          |              2 |
| IT Support Specialist      |              2 |
| Accountant                 |              2 |
| Operations Executive       |              0 |
| Sales Executive            |              0 |

### Key Finding

**Operations Manager had the highest number of employee exits, with 6 employees leaving.**

However, exit counts should be considered alongside the total number of employees in each role when assessing actual attrition risk.

---

## 6. Attrition by Gender

| Gender | Employees Left |
| ------ | -------------: |
| Female |             27 |
| Male   |             21 |

Female employees represented **56.25% of all employee exits**, while male employees represented **43.75%**.

> Note: These figures represent the distribution of exits, not gender-specific attrition rates.

---

## 7. Attrition by Age Band

| Age Band   | Employees Left |
| ---------- | -------------: |
| Middle age |             19 |
| Young      |             15 |
| Old        |             14 |

Middle-age employees recorded the highest number of exits, accounting for approximately **39.6% of all exits**.

---

## 8. Rehire Eligibility

| Rehire Eligibility | Employees |
| ------------------ | --------: |
| No                 |        30 |
| Yes                |        18 |

Among employees who left:

* **62.5% were not eligible for rehire**
* **37.5% were eligible for rehire**

This provides HR with an additional dimension for understanding the nature of employee exits.

---

# 🔎 Final Business Insights

Based on the complete analysis, the major findings are:

### 🔴 High overall attrition

The company has a **40% overall attrition rate**, with 48 out of 120 employees leaving.

### 🔴 IT is the highest-risk department

IT has the highest department-wise attrition rate at **60%**, along with the highest number of exits.

### 🟠 Better opportunities are the main exit driver

**Better Opportunity** is the most frequently reported reason for leaving, representing **27.1% of all exits**.

### 🟠 Operations Manager has the highest number of exits

The Operations Manager role recorded **6 employee exits**, the highest among all job roles.

### 🟡 Career and workplace factors matter

Work Environment, Career Growth, Job Dissatisfaction, and Manager Issues collectively indicate that workplace and career-related factors contribute meaningfully to employee turnover.

### 🟡 Majority of exits are not eligible for rehire

**62.5% of exiting employees were marked as not eligible for rehire.**

---

# 💡 Business Recommendations

Based on these findings, the organization could consider the following actions:

### 1. Focus on IT employee retention

Conduct deeper analysis of IT employees to understand why the department has a **60% attrition rate**.

### 2. Improve career development opportunities

Since Better Opportunity is the leading exit reason, the organization could strengthen:

* Internal career progression
* Promotion opportunities
* Skill development
* Internal mobility programs

### 3. Investigate workplace factors

Conduct employee surveys and exit interviews to identify recurring issues related to:

* Work environment
* Managers
* Job satisfaction
* Work-life balance

### 4. Monitor high-exit job roles

Roles such as Operations Manager, HR Executive, Data Analyst, and Customer Support Executive should receive additional retention analysis.

### 5. Strengthen exit analysis

HR can regularly analyze exit reasons, department trends, and rehire eligibility to identify emerging attrition patterns.

---

# 🛠️ SQL Skills Demonstrated

Through this project, I practiced and demonstrated:

* `SELECT`
* `WHERE`
* `GROUP BY`
* `ORDER BY`
* `COUNT()`
* `DISTINCT`
* `ROUND()`
* Aggregate functions
* `INNER JOIN`
* `LEFT JOIN`
* `HAVING`
* Conditional filtering
* NULL-value analysis
* Duplicate detection
* Data validation
* Relational database analysis
* Attrition-rate calculations
* Business-oriented data analysis

---

# 📈 Project Outcome

This project demonstrates how SQL can be used to transform raw employee data into meaningful HR insights.

The analysis identified **where employee attrition is highest, why employees are leaving, which job roles experience the most exits, and which departments require greater retention attention**.

The project also demonstrates the importance of **data cleaning and validation before performing business analysis**, particularly when dealing with inconsistent categorical values and missing data.

---

## 🚀 Future Analysis

As a next step, the analysis can be extended by calculating:

* Attrition rate by gender
* Attrition rate by age band
* Attrition rate by job role
* Attrition rate by department and job role
* Attrition reasons by department
* Attrition reasons by gender
* Attrition trends over time
* High-risk employee segments

These additional analyses would provide a deeper understanding of the factors driving employee turnover.

---

## 👨‍💻 Conclusion

The HR Attrition Analysis project provided practical experience in using **MySQL for data cleaning, relational analysis, aggregation, and business insight generation**.

The most significant finding was the organization's **40% overall attrition rate**, with **IT showing the highest department-level attrition at 60%** and **Better Opportunity emerging as the leading reason for employee exits**.

The analysis demonstrates how structured SQL analysis can help HR teams identify employee-retention challenges and support more data-driven decision-making.
