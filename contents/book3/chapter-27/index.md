# Chapter 27: Compliance Frameworks and Standards

This chapter examines how organizations can leverage compliance frameworks and industry standards to strengthen software supply chain security. Rather than treating compliance as a checkbox exercise, the chapter demonstrates how these frameworks provide structured approaches to managing supply chain risks.

The chapter begins with OWASP standards, including the Software Component Verification Standard (SCVS) which provides three progressive maturity levels for supply chain security, and the emerging Top 10 standards for LLM and Agentic AI applications that address novel risks from AI supply chains.

SOC 2 examinations, while principles-based, offer significant hooks for supply chain security through Trust Services Criteria addressing vendor management (CC9.2), change management (CC8.1), and system operations (CC7). Organizations can map SBOMs to vendor inventory requirements and frame dependency updates within change management controls.

ISO 27001:2022 provides explicit supplier relationship controls (A.5.19 through A.5.23) that directly address supply chain security. The ICT supply chain control (A.5.21) was strengthened following incidents like SolarWinds, requiring component provenance verification, vulnerability management, and transitive dependency visibility.

FedRAMP requirements, updated with NIST SP 800-53 Rev 5 baselines, introduce the Supply Chain Risk Management (SR) control family. Cloud service providers must implement supply chain risk management plans, demonstrate component authenticity verification, and increasingly use SBOMs as evidence for inventory and vulnerability management.

PCI DSS 4.0 brings landmark supply chain requirements for payment environments, including mandatory inventories of bespoke and custom software and incorporated third-party components (6.3.2) and the critical Requirement 6.4.3 requiring authorization, integrity assurance, and justification for payment page scripts to reduce Magecart-style risk.

Across all frameworks, common themes emerge: maintain comprehensive component inventories, implement continuous vulnerability monitoring, formalize dependency change management, and prepare evidence demonstrating ongoing control effectiveness.
