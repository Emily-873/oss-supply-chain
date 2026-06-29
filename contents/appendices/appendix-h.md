## Appendix H: Compliance Mapping

This appendix provides mapping tables that connect the content of this book to major regulatory frameworks and compliance standards relevant to software supply chain security. Use these mappings to identify which chapters and sections address specific compliance requirements, enabling efficient audit preparation and gap analysis.

The mappings reference the chapter structure across three books. For the complete chapter listing, see each book's Table of Contents. Key topic areas:

- **Book 1: Understanding the Software Supply Chain (Ch 1-10):** Foundations—how software is built, threat landscape, historical incidents, ecosystem risks, attack patterns including malicious packages, dependency confusion, typosquatting, build attacks, insider threats, social engineering
- **Book 2: Protecting the Software Supply Chain (Ch 11-22):** Assessment & Testing—risk measurement, SBOMs, dependency management, security testing, red teaming; Defense & Response—securing dev environments, CI/CD pipelines, distribution, incident response, crisis communication; Organization—security programs, platform engineering
- **Book 3: Governing the Software Supply Chain (Ch 23-33):** People & Organizations—training, maintainer guidance, vendor risk; Regulatory—EO 14028, EU CRA, compliance frameworks, legal considerations, industry initiatives; Context—economics, geopolitics, lessons from other industries, future directions

**Chapter Reference Key:**

The mapping tables below use abbreviated chapter references (e.g., "Ch. 4.2" refers to Chapter 4, Section 2). To identify which book contains a chapter:

| Chapter Range | Book |
|---------------|------|
| Ch. 1–10 | Book 1: Understanding the Software Supply Chain |
| Ch. 11–22 | Book 2: Protecting the Software Supply Chain |
| Ch. 23–33 | Book 3: Governing the Software Supply Chain |

For example, "Ch. 11.1" refers to Book 2, Chapter 11, Section 1. Cross-reference the specific sections in the appropriate book for detailed guidance on each topic.

---

### NIST Cybersecurity Framework 2.0 (CSF 2.0)

**Overview:** The NIST Cybersecurity Framework 2.0, released in February 2024, provides a taxonomy of high-level cybersecurity outcomes organized around six core functions: Govern, Identify, Protect, Detect, Respond, and Recover. CSF 2.0 expanded coverage of supply chain risk management, making it particularly relevant for organizations implementing software supply chain security programs.

#### Mapping Table

| CSF 2.0 Category | Subcategory ID | Requirement Summary | Book Reference |
|------------------|----------------|---------------------|----------------|
| **GOVERN (GV)** | | | |
| Organizational Context | GV.OC-01 | Organizational mission understood | Ch. 11.1, Ch. 21.1 |
| Organizational Context | GV.OC-03 | Legal, regulatory requirements understood | Ch. 26.1-26.4, Ch. 27.1-27.5 |
| Risk Management Strategy | GV.RM-01 | Risk management objectives established | Ch. 11.1-11.2, Ch. 21.3 |
| Risk Management Strategy | GV.RM-02 | Risk appetite statements established | Ch. 11.1, Ch. 21.3 |
| Roles and Responsibilities | GV.RR-01 | Organizational roles established | Ch. 21.1-21.2, Ch. 23.3 |
| Policy | GV.PO-01 | Cybersecurity policy established | Ch. 21.2, Ch. 25.3 |
| Oversight | GV.OV-01 | Cybersecurity risk management overseen | Ch. 21.4-21.5 |
| Supply Chain Risk Management | GV.SC-01 | Supply chain risk management program | Ch. 11.1, Ch. 21.1-21.6 |
| Supply Chain Risk Management | GV.SC-02 | Supplier identification and prioritization | Ch. 25.1, Ch. 12.1-12.2 |
| Supply Chain Risk Management | GV.SC-03 | Supply chain integration into risk program | Ch. 11.1, Ch. 21.2 |
| Supply Chain Risk Management | GV.SC-04 | Supplier assessment and monitoring | Ch. 25.1-25.2, Ch. 12.5 |
| Supply Chain Risk Management | GV.SC-05 | Supply chain requirements in contracts | Ch. 25.2, Ch. 28.2 |
| Supply Chain Risk Management | GV.SC-06 | Due diligence on suppliers | Ch. 25.1, Ch. 13.1 |
| Supply Chain Risk Management | GV.SC-07 | Supply chain risk response | Ch. 19.2-19.3, Ch. 11.1 |
| Supply Chain Risk Management | GV.SC-08 | Supplier inclusion in incident planning | Ch. 19.1-19.2, Ch. 20.3 |
| Supply Chain Risk Management | GV.SC-09 | Supply chain security practices integrated | Ch. 21.2, Ch. 22.1-22.3 |
| Supply Chain Risk Management | GV.SC-10 | Supply chain security plans | Ch. 21.1-21.6, Ch. 11.1 |
| **IDENTIFY (ID)** | | | |
| Asset Management | ID.AM-01 | Hardware inventories maintained | Ch. 12.1 |
| Asset Management | ID.AM-02 | Software inventories maintained | Ch. 12.1-12.3 |
| Asset Management | ID.AM-03 | Data flow representations | Ch. 4.1-4.2 |
| Asset Management | ID.AM-05 | Assets prioritized by criticality | Ch. 4.3, Ch. 11.1 |
| Risk Assessment | ID.RA-01 | Vulnerabilities identified and documented | Ch. 12.4-12.5, Ch. 14.1-14.2 |
| Risk Assessment | ID.RA-02 | Threat intelligence received | Ch. 3.1-3.4, Ch. 19.1 |
| Risk Assessment | ID.RA-03 | Internal and external threats identified | Ch. 3.1-3.2, Ch. 4.1-4.4 |
| Risk Assessment | ID.RA-05 | Risks prioritized | Ch. 11.1, Ch. 4.3-4.4 |
| Improvement | ID.IM-01 | Improvements identified from assessments | Ch. 19.4, Ch. 21.5 |
| **PROTECT (PR)** | | | |
| Identity Management | PR.AA-01 | Identities and credentials managed | Ch. 16.2, Ch. 17.2-17.3 |
| Identity Management | PR.AA-03 | Users authenticated | Ch. 16.2, Ch. 17.2 |
| Identity Management | PR.AA-05 | Access permissions managed | Ch. 16.1, Ch. 17.2-17.3 |
| Awareness and Training | PR.AT-01 | Personnel provided security awareness | Ch. 23.1-23.2 |
| Awareness and Training | PR.AT-02 | Privileged users understand responsibilities | Ch. 23.2, Ch. 16.4 |
| Data Security | PR.DS-01 | Data-at-rest protected | Ch. 16.1-16.2 |
| Data Security | PR.DS-02 | Data-in-transit protected | Ch. 17.2, Ch. 18.1 |
| Data Security | PR.DS-10 | Data integrity checking | Ch. 17.4-17.6, Ch. 18.2 |
| Platform Security | PR.PS-01 | Configuration management practices | Ch. 16.3, Ch. 17.1 |
| Platform Security | PR.PS-02 | Software maintained and replaced | Ch. 13.4-13.6, Ch. 12.4 |
| Platform Security | PR.PS-06 | Secure software development practices | Ch. 16.1-16.5, Ch. 17.1-17.6 |
| Technology Infrastructure | PR.IR-01 | Networks protected | Ch. 17.1, Ch. 18.4 |
| **DETECT (DE)** | | | |
| Continuous Monitoring | DE.CM-01 | Networks monitored | Ch. 18.4, Ch. 19.1 |
| Continuous Monitoring | DE.CM-03 | Computing activity monitored | Ch. 18.4, Ch. 19.1 |
| Continuous Monitoring | DE.CM-06 | External service provider activity monitored | Ch. 25.1, Ch. 12.5 |
| Continuous Monitoring | DE.CM-09 | Hardware and software monitored | Ch. 12.4-12.5, Ch. 14.1-14.2 |
| Adverse Event Analysis | DE.AE-02 | Events analyzed for incidents | Ch. 19.1 |
| Adverse Event Analysis | DE.AE-03 | Events correlated | Ch. 19.1, Ch. 18.4 |
| **RESPOND (RS)** | | | |
| Incident Management | RS.MA-01 | Incident response plan executed | Ch. 19.1-19.2 |
| Incident Management | RS.MA-02 | Incidents triaged and prioritized | Ch. 19.1-19.2 |
| Incident Management | RS.MA-03 | Incidents contained and eradicated | Ch. 19.2-19.3 |
| Incident Management | RS.MA-04 | Incidents escalated | Ch. 19.2, Ch. 20.2 |
| Incident Reporting | RS.CO-02 | Internal stakeholders informed | Ch. 20.2 |
| Incident Reporting | RS.CO-03 | External stakeholders informed | Ch. 20.3, Ch. 19.5 |
| **RECOVER (RC)** | | | |
| Incident Recovery | RC.RP-01 | Recovery plan executed | Ch. 19.3 |
| Incident Recovery | RC.RP-05 | Recovery verified | Ch. 19.3-19.4 |
| Incident Communication | RC.CO-03 | Recovery activities communicated | Ch. 20.3-20.4 |

**Key Implementation Guidance:** See Chapter 11 for risk frameworks, Chapter 21 for building a supply chain security program, and Chapter 26 for regulatory context including CSF 2.0 alignment.

---

### NIST Secure Software Development Framework (SSDF) SP 800-218

**Overview:** The NIST SSDF defines fundamental secure software development practices organized into four practice groups: Prepare the Organization (PO), Protect the Software (PS), Produce Well-Secured Software (PW), and Respond to Vulnerabilities (RV). Executive Order 14028 requires federal agencies to obtain SSDF attestations from software suppliers.

#### Mapping Table

| Practice Group | Practice ID | Requirement Summary | Book Reference |
|----------------|-------------|---------------------|----------------|
| **Prepare the Organization (PO)** | | | |
| Define Security Requirements | PO.1.1 | Security requirements for software development | Ch. 21.2, Ch. 16.1 |
| Define Security Requirements | PO.1.2 | Security requirements for third-party components | Ch. 13.1, Ch. 25.2 |
| Define Security Requirements | PO.1.3 | Communicate requirements to third parties | Ch. 25.2, Ch. 25.3 |
| Implement Roles | PO.2.1 | Create software security roles | Ch. 21.1, Ch. 23.3 |
| Implement Roles | PO.2.2 | Provide security training | Ch. 23.1-23.2 |
| Implement Roles | PO.2.3 | Implement security expertise policies | Ch. 21.1, Ch. 23.3 |
| Implement Toolchains | PO.3.1 | Specify and configure tools | Ch. 16.3, Ch. 17.1 |
| Implement Toolchains | PO.3.2 | Verify tool integrity | Ch. 16.3, Ch. 17.4 |
| Implement Toolchains | PO.3.3 | Configure tools for security | Ch. 16.3, Ch. 17.1 |
| Define Criteria | PO.4.1 | Define criteria for software security checks | Ch. 14.1-14.4, Ch. 18.3 |
| Define Criteria | PO.4.2 | Implement processes for security checks | Ch. 14.1-14.4, Ch. 17.1 |
| Implement Environments | PO.5.1 | Separate development environments | Ch. 16.1 |
| Implement Environments | PO.5.2 | Secure and harden environments | Ch. 16.1-16.2, Ch. 17.1 |
| **Protect the Software (PS)** | | | |
| Protect Code | PS.1.1 | Store code securely | Ch. 16.1, Ch. 17.1 |
| Provide Provenance | PS.2.1 | Make software provenance available | Ch. 17.4-17.6 |
| Archive Software | PS.3.1 | Archive and protect releases | Ch. 18.1-18.2 |
| Archive Software | PS.3.2 | Collect and maintain provenance data | Ch. 17.4-17.6, Ch. 12.2-12.3 |
| **Produce Well-Secured Software (PW)** | | | |
| Design Software | PW.1.1 | Use secure design principles | Ch. 4.1-4.2 |
| Design Software | PW.1.2 | Conduct threat modeling | Ch. 4.1-4.5 |
| Design Software | PW.1.3 | Model attack surfaces | Ch. 4.2, Ch. 3.2 |
| Review Design | PW.2.1 | Review software design for compliance | Ch. 4.2, Ch. 16.4 |
| Reuse Software | PW.4.1 | Acquire well-secured components | Ch. 13.1-13.2, Ch. 25.1 |
| Reuse Software | PW.4.2 | Create SBOM | Ch. 12.2-12.3 |
| Reuse Software | PW.4.4 | Verify component integrity | Ch. 17.4-17.6, Ch. 18.2 |
| Create Code | PW.5.1 | Follow secure coding practices | Ch. 16.4, Ch. 24.1 |
| Configure Build | PW.6.1 | Configure compilation for security | Ch. 17.1 |
| Configure Build | PW.6.2 | Compile with hardening features | Ch. 17.1, Ch. 17.4 |
| Review Code | PW.7.1 | Analyze code for vulnerabilities | Ch. 14.2-14.3, Ch. 16.4 |
| Review Code | PW.7.2 | Use peer review | Ch. 16.4, Ch. 24.3 |
| Test Code | PW.8.1 | Test for compliance with requirements | Ch. 14.1-14.5 |
| Test Code | PW.8.2 | Use automated testing | Ch. 14.1-14.4, Ch. 17.1 |
| Configure Software | PW.9.1 | Provide secure default configurations | Ch. 18.3, Ch. 22.2 |
| Configure Software | PW.9.2 | Document security-relevant configuration | Ch. 20.5 |
| **Respond to Vulnerabilities (RV)** | | | |
| Identify Vulnerabilities | RV.1.1 | Gather vulnerability information | Ch. 12.4, Ch. 14.1-14.2 |
| Identify Vulnerabilities | RV.1.2 | Monitor vulnerabilities in dependencies | Ch. 12.4-12.5, Ch. 13.4 |
| Identify Vulnerabilities | RV.1.3 | Identify unreported vulnerabilities | Ch. 14.1-14.3, Ch. 15.1-15.2 |
| Assess Vulnerabilities | RV.2.1 | Analyze vulnerabilities | Ch. 12.4, Ch. 5.3-5.4 |
| Assess Vulnerabilities | RV.2.2 | Assess exploitability | Ch. 12.4, Ch. 5.3 |
| Remediate Vulnerabilities | RV.3.1 | Have remediation process | Ch. 13.4, Ch. 19.3 |
| Remediate Vulnerabilities | RV.3.2 | Prioritize and remediate | Ch. 12.4, Ch. 5.4, Ch. 13.4 |
| Remediate Vulnerabilities | RV.3.3 | Analyze root causes | Ch. 19.4, Ch. 5.4 |
| Remediate Vulnerabilities | RV.3.4 | Analyze remediation trends | Ch. 21.4, Ch. 19.4 |

**Key Implementation Guidance:** Chapter 17 provides comprehensive CI/CD security including provenance and attestation. Chapter 12 covers SBOM generation and vulnerability management. Chapter 26 details EO 14028 and SSDF attestation requirements.

---

### EU Cyber Resilience Act (CRA)

**Overview:** The EU Cyber Resilience Act, adopted in 2024, establishes mandatory cybersecurity requirements for products with digital elements sold in the European market. It includes specific obligations for software manufacturers regarding vulnerability handling, security updates, and software bill of materials.

#### Mapping Table

| CRA Article/Annex | Requirement Summary | Book Reference |
|-------------------|---------------------|----------------|
| **Essential Requirements (Annex I)** | | |
| Annex I, Part I, 1 | Designed with appropriate cybersecurity level | Ch. 4.1-4.5, Ch. 16.1 |
| Annex I, Part I, 2(a) | No known exploitable vulnerabilities | Ch. 12.4-12.5, Ch. 13.4 |
| Annex I, Part I, 2(b) | Secure by default configuration | Ch. 18.3, Ch. 22.2 |
| Annex I, Part I, 2(c) | Protection against unauthorized access | Ch. 16.1-16.2, Ch. 17.2 |
| Annex I, Part I, 2(d) | Protect data confidentiality and integrity | Ch. 16.2, Ch. 17.4 |
| Annex I, Part I, 2(e) | Data minimization | Ch. 4.2 |
| Annex I, Part I, 2(f) | Protect availability | Ch. 4.2, Ch. 14.6 |
| Annex I, Part I, 2(g) | Minimize negative impact on other products | Ch. 4.2 |
| Annex I, Part I, 2(h) | Minimize attack surfaces | Ch. 4.2-4.3, Ch. 13.5 |
| Annex I, Part I, 2(i) | Reduce incident impact through mitigations | Ch. 19.2-19.3 |
| Annex I, Part I, 2(j) | Provide security logging | Ch. 17.1, Ch. 18.4 |
| Annex I, Part I, 2(k) | Ensure secure updates | Ch. 18.1, Ch. 13.4 |
| Annex I, Part I, 3 | Security support duration statement | Ch. 25.2, Ch. 2.3 |
| **Vulnerability Handling (Annex I, Part II)** | | |
| Part II, 1 | Identify and document vulnerabilities | Ch. 12.4-12.5, Ch. 14.1-14.3 |
| Part II, 2 | Address vulnerabilities without delay | Ch. 13.4, Ch. 5.4 |
| Part II, 3 | Apply effective testing and review | Ch. 14.1-14.5, Ch. 16.4 |
| Part II, 4 | Disclose vulnerabilities after remediation | Ch. 24.2, Ch. 20.1 |
| Part II, 5 | Share vulnerability information | Ch. 24.2, Ch. 20.3 |
| Part II, 6 | Provide coordinated vulnerability disclosure | Ch. 24.2 |
| Part II, 7 | Distribute security updates | Ch. 13.4, Ch. 18.1 |
| Part II, 8 | Ensure timely and free security updates | Ch. 13.4, Ch. 26.2 |
| **SBOM Requirements** | | |
| Article 13(11) | Draw up SBOM | Ch. 12.2-12.3 |
| Article 13(11) | Include at minimum top-level dependencies | Ch. 12.2-12.3 |
| Article 13(11) | Machine-readable format | Ch. 12.2 |
| **Incident Reporting** | | |
| Article 14(1) | Report actively exploited vulnerabilities | Ch. 19.5, Ch. 20.3, Ch. 26.2 |
| Article 14(2) | Report within 24 hours | Ch. 19.5, Ch. 26.2 |
| Article 14(3) | Submit detailed report within 72 hours | Ch. 19.5, Ch. 26.2 |
| Article 14(8) | Report to affected users | Ch. 20.3, Ch. 24.2 |
| **Documentation Requirements** | | |
| Article 13(16) | Technical documentation maintained | Ch. 12.2-12.3, Ch. 21.2 |
| Annex VII | Risk assessment documentation | Ch. 4.1-4.5, Ch. 11.1 |
| Annex VII | SBOM maintained for 10 years | Ch. 12.2-12.3 |
| **Open Source Considerations** | | |
| Article 3(12) | Open source steward obligations | Ch. 24.1-24.5, Ch. 26.2 |
| Recital 18 | Non-commercial open source exemption | Ch. 26.2, Ch. 2.6 |

**Key Implementation Guidance:** Chapter 12 provides comprehensive SBOM guidance meeting CRA requirements. Chapter 26 offers detailed analysis of CRA obligations. Chapter 24 addresses open source maintainer responsibilities under the CRA's steward provisions.

---

### SOC 2 Type II

**Overview:** SOC 2 reports, developed by the AICPA, assess controls relevant to security, availability, processing integrity, confidentiality, and privacy. Software supply chain security is increasingly evaluated within the Security and Processing Integrity trust service criteria.

#### Mapping Table

| Trust Service Criteria | Control Point | Requirement Summary | Book Reference |
|------------------------|---------------|---------------------|----------------|
| **CC6: Logical and Physical Access** | | | |
| CC6.1 | Logical access security | Software and infrastructure access controls | Ch. 16.1-16.2, Ch. 17.2 |
| CC6.2 | Access authorization | Registration and authorization procedures | Ch. 17.2-17.3 |
| CC6.3 | Access removal | Removal of access when no longer required | Ch. 17.2, Ch. 16.1 |
| CC6.6 | Access restrictions | Restrictions on systems and data | Ch. 16.1, Ch. 17.2 |
| CC6.7 | Information transmission | Protection of transmitted data | Ch. 17.2, Ch. 18.1 |
| CC6.8 | Unauthorized software | Prevention of unauthorized software | Ch. 13.1-13.2, Ch. 18.3 |
| **CC7: System Operations** | | | |
| CC7.1 | Vulnerability management | Detection and monitoring of vulnerabilities | Ch. 12.4-12.5, Ch. 14.1-14.2 |
| CC7.2 | Security monitoring | Monitoring of system components | Ch. 18.4, Ch. 19.1 |
| CC7.3 | Security event evaluation | Analysis of potential security events | Ch. 19.1 |
| CC7.4 | Security incident response | Incident response procedures | Ch. 19.1-19.5 |
| CC7.5 | Incident recovery | Recovery from identified incidents | Ch. 19.3 |
| **CC8: Change Management** | | | |
| CC8.1 | Infrastructure changes | Authorization and testing of changes | Ch. 17.1, Ch. 13.4 |
| **CC9: Risk Mitigation** | | | |
| CC9.1 | Risk identification | Identification and assessment of risk | Ch. 11.1, Ch. 4.1-4.5 |
| CC9.2 | Vendor risk management | Assessment of vendor and partner risk | Ch. 25.1-25.4, Ch. 13.1 |
| **PI1: Processing Integrity** | | | |
| PI1.1 | Processing completeness | Inputs processed accurately | Ch. 17.4, Ch. 14.5 |
| PI1.2 | Processing accuracy | System outputs accurate | Ch. 17.4 |
| PI1.3 | Processing timeliness | Processing in timely manner | Ch. 13.4 |
| PI1.4 | Processing validation | Processing accuracy validated | Ch. 17.4-17.6 |
| PI1.5 | Error handling | Inputs and processing errors identified | Ch. 19.1 |
| **Additional Points of Focus** | | | |
| Software Development | Secure development lifecycle | SDLC security practices | Ch. 16.1-16.5, Ch. 17.1-17.6 |
| Third-Party Management | Vendor assessment | Third-party component evaluation | Ch. 13.1, Ch. 25.1 |
| Third-Party Management | Continuous monitoring | Ongoing vendor risk assessment | Ch. 25.1, Ch. 12.5 |

**Key Implementation Guidance:** Chapter 27 provides detailed SOC 2 mapping guidance. Chapter 21 covers the organizational program framework. Chapter 25 addresses vendor management for CC9.2.

---

### ISO/IEC 27001:2022

**Overview:** ISO/IEC 27001:2022 is the international standard for information security management systems (ISMS). The 2022 revision includes updated controls in Annex A, with new controls specifically addressing supply chain security, secure development, and cloud services.

#### Mapping Table

| Control ID | Control Name | Book Reference |
|------------|--------------|----------------|
| **Organizational Controls** | | |
| A.5.1 | Policies for information security | Ch. 21.2, Ch. 25.3 |
| A.5.2 | Information security roles and responsibilities | Ch. 21.1, Ch. 23.3 |
| A.5.3 | Segregation of duties | Ch. 17.2, Ch. 21.1 |
| A.5.7 | Threat intelligence | Ch. 3.1-3.4, Ch. 19.1 |
| A.5.8 | Information security in project management | Ch. 21.2, Ch. 4.1 |
| A.5.19 | Information security in supplier relationships | Ch. 25.1-25.2 |
| A.5.20 | Addressing information security in supplier agreements | Ch. 25.2 |
| A.5.21 | Managing information security in the ICT supply chain | Ch. 11.1, Ch. 21.1-21.6, Ch. 25.1-25.4 |
| A.5.22 | Monitoring, review, and change management of supplier services | Ch. 25.1, Ch. 13.4 |
| A.5.23 | Information security for use of cloud services | Ch. 17.2, Ch. 18.1 |
| A.5.24 | Information security incident management planning | Ch. 19.1-19.2 |
| A.5.25 | Assessment and decision on information security events | Ch. 19.1 |
| A.5.26 | Response to information security incidents | Ch. 19.2-19.3 |
| A.5.27 | Learning from information security incidents | Ch. 19.4 |
| A.5.28 | Collection of evidence | Ch. 19.2, Ch. 19.5 |
| A.5.37 | Documented operating procedures | Ch. 21.2, Ch. 25.3 |
| **People Controls** | | |
| A.6.3 | Information security awareness, education, and training | Ch. 23.1-23.4 |
| **Technological Controls** | | |
| A.8.4 | Access to source code | Ch. 16.1, Ch. 17.1 |
| A.8.8 | Management of technical vulnerabilities | Ch. 12.4-12.5, Ch. 13.4 |
| A.8.9 | Configuration management | Ch. 16.3, Ch. 17.1 |
| A.8.16 | Monitoring activities | Ch. 18.4, Ch. 19.1 |
| A.8.20 | Network security | Ch. 17.1, Ch. 18.4 |
| A.8.21 | Security of network services | Ch. 17.2, Ch. 18.1 |
| A.8.24 | Use of cryptography | Ch. 17.4-17.6, Ch. 5.5 |
| A.8.25 | Secure development life cycle | Ch. 16.1-16.5, Ch. 17.1-17.6 |
| A.8.26 | Application security requirements | Ch. 4.1-4.2, Ch. 16.1 |
| A.8.27 | Secure system architecture and engineering principles | Ch. 4.1-4.2, Ch. 22.1-22.2 |
| A.8.28 | Secure coding | Ch. 16.4, Ch. 24.1 |
| A.8.29 | Security testing in development and acceptance | Ch. 14.1-14.5 |
| A.8.30 | Outsourced development | Ch. 25.1-25.2, Ch. 25.4 |
| A.8.31 | Separation of development, test, and production environments | Ch. 16.1, Ch. 17.1 |
| A.8.32 | Change management | Ch. 17.1, Ch. 13.4 |
| A.8.33 | Test information | Ch. 14.1-14.5 |

**Key Implementation Guidance:** Control A.5.21 (ICT supply chain) is comprehensively addressed in Chapters 11, 21, and 25. Controls A.8.25–A.8.31 (secure development) are covered in Chapters 16 and 17. Chapter 27 provides detailed ISO 27001 mapping.

---

### PCI DSS v4.0

**Overview:** The Payment Card Industry Data Security Standard (PCI DSS) v4.0 establishes security requirements for organizations handling payment card data. Version 4.0 includes enhanced requirements for software security, third-party management, and secure development practices.

#### Mapping Table

| Requirement | Sub-Requirement | Description | Book Reference |
|-------------|-----------------|-------------|----------------|
| **Req. 2: Secure Configurations** | | | |
| 2.2 | 2.2.1 | Develop configuration standards | Ch. 16.3, Ch. 17.1 |
| 2.2 | 2.2.4 | Only necessary services enabled | Ch. 13.5, Ch. 18.2 |
| 2.2 | 2.2.5 | Address insecure services | Ch. 13.5, Ch. 18.2 |
| 2.2 | 2.2.6 | System security parameters configured | Ch. 16.3, Ch. 17.1 |
| **Req. 6: Secure Software** | | | |
| 6.1 | 6.1.1 | Define security roles for development | Ch. 21.1, Ch. 23.3 |
| 6.1 | 6.1.2 | Security training for development personnel | Ch. 23.1-23.2 |
| 6.2 | 6.2.1 | Secure development processes defined | Ch. 16.1, Ch. 17.1 |
| 6.2 | 6.2.2 | Software developers trained in secure coding | Ch. 23.1-23.2 |
| 6.2 | 6.2.3 | Code reviewed before production release | Ch. 16.4 |
| 6.2 | 6.2.3.1 | Manual code review for vulnerabilities | Ch. 16.4, Ch. 14.2 |
| 6.2 | 6.2.4 | Common vulnerabilities addressed | Ch. 16.4, Ch. 14.2 |
| 6.3 | 6.3.1 | Security vulnerabilities identified and managed | Ch. 12.4-12.5, Ch. 14.1-14.2 |
| 6.3 | 6.3.2 | Software inventory maintained | Ch. 12.1-12.3 |
| 6.3 | 6.3.3 | Security patches installed timely | Ch. 13.4, Ch. 5.4 |
| 6.4 | 6.4.1 | Public-facing web applications protected | Ch. 14.1, Ch. 18.4 |
| 6.4 | 6.4.2 | Automated technical solution for attacks | Ch. 14.1, Ch. 18.4 |
| 6.4 | 6.4.3 | Payment page script integrity (CSP/SRI) | Ch. 18.2, Ch. 27.4 |
| 6.5 | 6.5.1 | Change control processes for all changes | Ch. 17.1, Ch. 13.4 |
| 6.5 | 6.5.2 | Changes documented and include impact | Ch. 17.1, Ch. 20.5 |
| 6.5 | 6.5.3 | Pre-production testing for security impact | Ch. 14.1-14.4, Ch. 17.1 |
| 6.5 | 6.5.4 | Rollback procedures defined | Ch. 17.1, Ch. 19.3 |
| 6.5 | 6.5.5 | Change management procedures documented | Ch. 17.1, Ch. 21.2 |
| 6.5 | 6.5.6 | Developers certify code security | Ch. 16.4 |
| **Req. 11: Regular Testing** | | | |
| 11.3 | 11.3.1 | External vulnerability scans | Ch. 14.1, Ch. 12.4 |
| 11.3 | 11.3.2 | Internal vulnerability scans | Ch. 14.1, Ch. 12.4-12.5 |
| 11.3 | 11.3.3 | Internal scans after significant changes | Ch. 14.1, Ch. 12.4 |
| 11.4 | 11.4.1 | Penetration testing methodology | Ch. 15.1-15.2 |
| 11.6 | 11.6.1 | Detect unauthorized changes to content | Ch. 17.4, Ch. 18.2, Ch. 18.4 |
| **Req. 12: Security Policies** | | | |
| 12.3 | 12.3.2 | Targeted risk analysis for flexible requirements | Ch. 11.1, Ch. 4.1-4.5 |
| 12.5 | 12.5.2 | PCI DSS scope documented | Ch. 12.1-12.3 |
| 12.8 | 12.8.1 | List of third-party service providers maintained | Ch. 25.1, Ch. 12.1 |
| 12.8 | 12.8.2 | Written agreements with service providers | Ch. 25.2 |
| 12.8 | 12.8.3 | Due diligence before engagement | Ch. 25.1 |
| 12.8 | 12.8.4 | Monitor service provider PCI DSS status | Ch. 25.1 |
| 12.8 | 12.8.5 | Information on shared responsibilities | Ch. 25.2 |
| 12.10 | 12.10.1 | Incident response plan established | Ch. 19.1-19.2 |
| 12.10 | 12.10.2 | Incident response plan reviewed annually | Ch. 19.1-19.2 |
| 12.10 | 12.10.4 | Personnel trained on incident response | Ch. 19.2, Ch. 23.2 |
| 12.10 | 12.10.5 | Incident response plan includes alerts | Ch. 19.1, Ch. 18.4 |
| 12.10 | 12.10.6 | Incident response plan modified as needed | Ch. 19.4 |

**Key Implementation Guidance:** Requirement 6 (secure software) maps primarily to Chapters 16-17. Requirements 12.8 (third-party management) maps to Chapter 25. Chapter 12 addresses the software inventory requirements in 6.3.2. Chapter 27 provides detailed PCI DSS 4.0 supply chain guidance including the critical Requirement 6.4.3.

---

### Cross-Framework Implementation Notes

**Common Control Themes:** Several requirements appear across multiple frameworks:

| Theme | Frameworks | Primary Book Coverage |
|-------|------------|----------------------|
| Software Bill of Materials | CRA, SSDF, NIST CSF | Chapter 12 |
| Vulnerability Management | All frameworks | Chapters 12, 13, 14 |
| Third-Party Risk Management | ISO 27001, SOC 2, PCI DSS, CSF | Chapter 25 |
| Secure Development Lifecycle | SSDF, ISO 27001, PCI DSS, CRA | Chapters 16, 17 |
| Incident Response | All frameworks | Chapters 19, 20 |
| Supply Chain Integrity/Provenance | CSF 2.0, SSDF, ISO 27001 | Chapter 17 |
| Security Training | All frameworks | Chapter 23 |
| Risk Assessment | All frameworks | Chapters 4, 11 |

**Chapter Quick Reference by Topic:**

| Topic | Book | Chapter(s) |
|-------|------|------------|
| Threat landscape and attack patterns | Book 1 | Ch. 3, 5-10 |
| Threat modeling | Book 1 | Ch. 4 |
| Risk frameworks | Book 2 | Ch. 11 |
| SBOMs and software inventory | Book 2 | Ch. 12 |
| Dependency management | Book 2 | Ch. 13 |
| Security testing | Book 2 | Ch. 14, 15 |
| Development environment security | Book 2 | Ch. 16 |
| CI/CD and build security | Book 2 | Ch. 17 |
| Distribution and deployment | Book 2 | Ch. 18 |
| Incident response | Book 2 | Ch. 19 |
| Crisis communication | Book 2 | Ch. 20 |
| Security program building | Book 2 | Ch. 21 |
| Platform engineering | Book 2 | Ch. 22 |
| Training and awareness | Book 3 | Ch. 23 |
| Open source maintainer guidance | Book 3 | Ch. 24 |
| Vendor risk management | Book 3 | Ch. 25 |
| Regulatory landscape (EO 14028, CRA) | Book 3 | Ch. 26 |
| Compliance frameworks | Book 3 | Ch. 27 |
| Legal considerations | Book 3 | Ch. 28 |

**Evidence Documentation:** When preparing for audits, collect evidence demonstrating:

1. **Policy documentation** (Chapters 21, 25) – Security policies, standards, procedures
2. **Process artifacts** (Chapters 16, 17) – Code review records, test results, build logs
3. **Inventory records** (Chapter 12) – SBOMs, dependency lists, asset inventories
4. **Vulnerability records** (Chapters 12, 14) – Scan results, remediation tracking, risk assessments
5. **Third-party documentation** (Chapter 25) – Vendor assessments, contracts, monitoring records
6. **Incident records** (Chapters 19, 20) – Response plans, incident logs, post-mortems
7. **Training records** (Chapter 23) – Training completion, certifications, awareness metrics
