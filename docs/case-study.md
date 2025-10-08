# Case Study — Multi-Region Fintech on Azure

## Objective
Build a financial-grade, multi-region architecture that meets strict **availability**, **compliance**, and **cost** goals.

## Business Drivers
- Payments and account services require <200ms latency for users in two continents.
- Zero data exposure over public internet for internal services.
- RPO ≤ 5 minutes, RTO ≤ 15 minutes.

## Architecture Overview
- **Azure Front Door (WAF)** for global routing and Layer 7 protection.
- **App Service Premium** in active/active (Region A & B) with autoscale.
- **Azure SQL Failover Group** ensures cross-region read/write with automatic failover.
- **Private Endpoints** + **Managed Identity** + **Key Vault** for zero-trust.
- **Azure Policy** to enforce allowed regions/SKUs and tagging.
- **Azure Monitor + Log Analytics** for SLI/SLO observability and alerts.

## Design Decisions (Why)
- **Front Door vs. Traffic Manager**: modern L7 routing, WAF integration, and CDN-style acceleration.
- **App Service vs. AKS**: faster time-to-value; AKS reserved for container-first orgs.
- **SQL Failover Group**: managed HA across regions with minimal operational burden.
- **Private Endpoints**: no public exposure for DB/Key Vault; limits blast radius.
- **Policy**: compliance-as-code; prevents drift.

## Cost Controls
- App Service **Premium** with autoscale + nightly scale-in windows.
- SQL **Business Critical** only when justified; default to **General Purpose**.
- Use **Reserved Instances** where workload is predictable; **Autoscale** for bursts.

## Operations
- Centralized logging with **Log Analytics**, Azure Monitor alerts to **Action Groups** (Email/Teams/SMS).
- Runbooks for failover testing quarterly; dashboards for SLI/SLO tracking.

## Future Expansion
- Add **Event Hub + Functions** for async processing.
- Introduce **Azure API Management** for partner integrations.
- Evaluate **Confidential Computing** for sensitive transaction workloads.

---

**Author:** Ayobamidele “Dark👣” Aderosoye  
**Brand:** Dark👣 Systems
