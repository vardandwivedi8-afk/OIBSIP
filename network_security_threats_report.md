# Research Report: Common Network Security Threats

**Internship:** Oasis Infobyte — Security Analyst  
**Task:** 4  
**Prepared on:** 14 October 2026  
**Author:** [Add your name]  
**Institution / course:** [Add details]

## Abstract

Networks connect users, applications, devices, and services, but they also create paths that attackers may abuse. This report reviews denial-of-service (DoS/DDoS), man-in-the-middle (MITM), and spoofing attacks. For each threat, it describes the general mechanism, likely impact, a documented example or context, and practical defenses. The key conclusion is that layered controls—secure configuration, encryption, identity verification, monitoring, and tested incident response—are more reliable than any single security product.

## 1. Introduction

Network security protects the confidentiality, integrity, and availability of data moving between systems. Threats may target availability (DoS), confidentiality and integrity (MITM), or trust in the identity or origin of traffic (spoofing). These categories can overlap: spoofed source addresses can be used in reflection-based DDoS attacks, while a successful MITM position may allow an attacker to observe or alter poorly protected communications.

## 2. Denial-of-Service (DoS) and Distributed DoS (DDoS)

### How it works
A DoS attack attempts to make a system or service unavailable by exhausting a resource, exploiting a protocol or application weakness, or overwhelming a connection or request-handling capacity. A DDoS attack distributes traffic across many systems, making filtering and attribution more difficult. Reflection/amplification attacks abuse exposed third-party services to send a much larger volume of traffic toward a victim, often with spoofed source addresses.

### Impact
Potential effects include service outages, lost sales, interrupted operations, increased hosting and mitigation costs, degraded user trust, and diversion of security teams from other incidents. Availability attacks can also affect dependent services, not just the original target.

### Real-world example
The 2016 Mirai botnet attack disrupted access to major internet services by using compromised Internet of Things devices to generate DDoS traffic against DNS provider Dyn. The incident illustrated the systemic impact of insecure connected devices and dependence on shared infrastructure. See the Dyn post-incident analysis and CISA guidance in the references.

### Mitigations
- Use DDoS protection from a hosting provider, CDN, or specialist mitigation service.
- Apply rate limits, request validation, connection limits, and resilient architecture where appropriate.
- Filter traffic upstream; coordinate with the ISP because a saturated access link cannot always be fixed by host-level filtering.
- Disable unnecessary exposed services and change default credentials on IoT devices.
- Monitor availability, traffic baselines, error rates, and upstream alerts; maintain an incident playbook and test it.

## 3. Man-in-the-Middle (MITM)

### How it works
A MITM attacker positions themselves between communicating parties—for example, through a malicious or compromised Wi-Fi access point, local-network manipulation, DNS manipulation, or compromised routing. If communications lack proper encryption or identity verification, the attacker may observe, relay, or modify data. HTTPS/TLS reduces this risk when certificate validation is performed correctly; users should not bypass certificate warnings.

### Impact
A successful MITM attack can expose session cookies, login credentials, personal data, or business information. If traffic can be modified, an attacker may alter transactions or deliver malicious content. The severity depends on what the victim communicates and whether strong encryption and authentication are in place.

### Real-world example / documented context
Public advisories and security guidance routinely warn about hostile Wi-Fi and certificate-validation failures. The general attack pattern is also reflected in OWASP's TLS guidance: encryption alone is not sufficient if applications fail to validate certificates or permit insecure fallback. In a report, distinguish a documented technique from a claim that a particular organization was breached by it.

### Mitigations
- Use HTTPS/TLS with modern configurations and correct certificate validation.
- Never ignore browser certificate warnings or install untrusted root certificates.
- Use a trusted VPN when required by organizational policy, especially on untrusted networks.
- Use WPA2-AES or WPA3 for Wi-Fi, disable obsolete protocols, and use client isolation on guest networks.
- Protect sessions with secure cookies, short session lifetimes where suitable, and MFA.
- Monitor certificate changes, rogue access points, suspicious DNS behavior, and endpoint alerts.

## 4. Spoofing

### How it works
Spoofing is the falsification of an identifier or origin to make traffic or a message appear trustworthy. Examples include IP spoofing, ARP spoofing on a local network, DNS spoofing, email sender spoofing, and caller-ID spoofing. The technique is not one single vulnerability; its consequences depend on which identity mechanism is trusted and how that trust is enforced.

### Impact
Spoofing can enable phishing, traffic redirection, unauthorized access attempts, session interception, reflection DDoS, or evasion of weak source-based controls. A forged source address does not automatically let an attacker receive replies or bypass strong authentication.

### Real-world example / documented context
The 2008 Kaminsky DNS vulnerability demonstrated how weaknesses in DNS response validation could enable cache poisoning under certain conditions, redirecting users to attacker-controlled destinations. DNS software updates and stronger randomization/validation mitigations followed. This is an example of DNS trust being abused, not a claim that every DNS spoofing attempt succeeds.

### Mitigations
- Deploy ingress and egress filtering following BCP 38 / RFC 2827 where applicable to reduce spoofed source traffic.
- Use DNS software that is patched and correctly configured; use DNSSEC validation where operationally appropriate.
- Use email authentication such as SPF, DKIM, and DMARC, with a staged enforcement policy.
- Avoid trusting a device solely because of its IP or MAC address; use strong authentication and network segmentation.
- Use Dynamic ARP Inspection and DHCP snooping on managed switches where supported.
- Correlate logs and alerts across DNS, firewall, endpoint, and identity systems.

## 5. Comparison

| Threat | Main security goal affected | Typical warning signs | Primary defenses |
|---|---|---|---|
| DoS/DDoS | Availability | Traffic spikes, high latency, service errors | Upstream mitigation, rate limits, resilient architecture, monitoring |
| MITM | Confidentiality and integrity | Certificate warnings, rogue Wi-Fi, suspicious network changes | TLS validation, secure Wi-Fi, MFA, endpoint/network monitoring |
| Spoofing | Trust, integrity, sometimes availability | Unexpected sender/origin, anomalous DNS/ARP, inconsistent logs | Authentication, anti-spoofing filters, DNS/email protections, segmentation |

## 6. General incident-response steps

1. **Identify:** confirm affected assets, scope, timeline, and business impact.
2. **Contain:** apply approved traffic filtering, isolate affected endpoints, or disable a compromised account/service as appropriate.
3. **Preserve evidence:** retain relevant logs and timestamps; follow organizational evidence-handling rules.
4. **Eradicate and recover:** patch the cause, rotate exposed credentials, restore clean service, and validate operation.
5. **Learn:** document root cause, notification obligations, and improvements to monitoring and response procedures.

## 7. Conclusion

DoS, MITM, and spoofing attacks target different assumptions in network design: available capacity, protected communication, and trustworthy identity. A defense-in-depth approach combines secure protocols, robust identity checks, patching, traffic controls, segmentation, monitoring, and rehearsed incident response. Controls should be selected based on the organization's assets, threat model, and risk tolerance.

## References

1. CISA, **Understanding and Responding to Distributed Denial-of-Service Attacks**: https://www.cisa.gov/news-events/news/understanding-and-responding-distributed-denial-service-attacks
2. Dyn, **Dyn Analysis Summary of Friday October 21 Attack** (2016): https://dyn.com/blog/dyn-analysis-summary-of-friday-october-21-attack/
3. OWASP, **Transport Layer Protection Cheat Sheet**: https://cheatsheetseries.owasp.org/cheatsheets/Transport_Layer_Protection_Cheat_Sheet.html
4. IETF, **RFC 2827: Network Ingress Filtering**: https://www.rfc-editor.org/rfc/rfc2827
5. IETF, **RFC 4033: DNS Security Introduction and Requirements**: https://www.rfc-editor.org/rfc/rfc4033
6. CISA, **Email and Web Security** resources: https://www.cisa.gov/topics/cybersecurity-best-practices

**Personalization before submission:** Add a short paragraph explaining which of these threats you consider most relevant to a college, small business, or home network, and why.
