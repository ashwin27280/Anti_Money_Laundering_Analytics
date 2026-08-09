# AML Transaction Monitoring & Customer Risk Scoring

> An end-to-end financial analytics project that identifies potentially suspicious transaction patterns, detects potential structuring behavior, and prioritizes customers for investigation using Python, PostgreSQL, SQL, and Power BI.

---

## 1. Business Problem

Financial institutions process large volumes of transactions every day, making manual review of every transaction inefficient and difficult to scale.

Compliance investigators need a way to identify unusual transaction behavior, detect potential structuring patterns, and prioritize cases that require further investigation.

This project builds a focused **AML transaction monitoring and customer risk scoring system** to help investigators prioritize potentially higher-risk customers while balancing detection coverage against investigation workload.

> **Important:** The system identifies potentially suspicious patterns for investigation. It does not determine whether a customer has committed money laundering.

---

## 2. Project Objectives

The project focuses on five objectives:

- Identify potentially unusual transaction activity using rule-based monitoring.
- Detect potential structuring behavior using transaction sequences and rolling activity.
- Engineer customer-level behavioral features.
- Calculate a customer risk score to prioritize investigations.
- Evaluate the trade-off between alert volume, detection performance, and investigator capacity.

---

# 3. Project Scope

## Included

### Transaction Monitoring

The system monitors:

- High-value transactions
- High transaction frequency
- Rapid consecutive transactions
- Off-hours activity
- Unusual customer transaction behavior

### Structuring Detection

The project identifies patterns such as:

- Multiple transactions below a defined threshold
- Repeated near-threshold transactions
- Multiple transactions within a short time window
- Repeated same-day transactions
- High cumulative transaction activity

### Customer Risk Scoring

Customer risk is assessed using behavioral and rule-based signals including:

- Transaction frequency
- Average transaction amount
- Total transaction value
- High-value transaction activity
- Structuring activity
- Rapid transaction activity
- Off-hours activity
- Deviation from historical behavior

### Dashboard

The final Power BI dashboard is designed around an investigator workflow:

**Identify → Prioritize → Investigate**

---

# 4. Out of Scope

This project intentionally does not attempt to replicate a complete enterprise AML platform.

The following are outside the current scope:

- Sanctions screening
- KYC verification
- PEP screening
- Adverse media screening
- Layering detection
- Terrorist financing detection
- Real-time transaction blocking
- Production case-management systems

These are considered potential future extensions.

---

# 5. End-to-End Approach

```text
Raw Transaction Data
        │
        ▼
Data Cleaning & EDA
        │
        ▼
PostgreSQL Database
        │
        ▼
Transaction Monitoring
        │
        ▼
Structuring Detection
        │
        ▼
Behavioral Feature Engineering
        │
        ▼
Customer Risk Scoring
        │
        ▼
Threshold / Alert Evaluation
        │
        ▼
Power BI Investigation Dashboard
        │
        ▼
Business Recommendations
