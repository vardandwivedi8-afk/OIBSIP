# Research Report: Social Engineering Attacks

**Internship:** Oasis Infobyte — Security Analyst  
**Task:** 5  
**Prepared on:** 14 October 2026  
**Author:** [Add your name]  
**Institution / course:** [Add details]

## Abstract

Social engineering manipulates people into revealing information, transferring money, granting access, or taking unsafe actions. Unlike a purely technical exploit, it abuses trust, urgency, authority, curiosity, or routine. This report examines phishing, pretexting, and baiting, outlines their impacts, discusses documented cases, and recommends layered prevention through verification procedures, staff awareness, secure authentication, and incident reporting.

## 1. Introduction

People are a critical part of an organization's security boundary. Attackers may research employees, impersonate trusted parties, create urgency, or exploit everyday processes such as invoice approval and password resets. Security awareness should not blame victims: well-designed controls make it harder for a single pressured decision to cause major harm.

## 2. Phishing

### Definition and method
Phishing uses deceptive email, messages, websites, or phone calls to persuade a person to click a link, open an attachment, disclose credentials, approve a login, or send money. Spear-phishing is tailored to a particular person or organization. Business email compromise (BEC) often uses impersonation and social context to influence payments or sensitive requests, sometimes without malware.

### Impact
Consequences include account takeover, data theft, ransomware entry, fraudulent payments, exposure of personal information, and operational disruption.

### Case study: Google and Facebook invoice fraud
The U.S. Department of Justice described a case in which a fraudster impersonated a hardware vendor and sent fraudulent invoices to Google and Facebook; the companies collectively paid more than $100 million before the scheme was discovered. The case demonstrates how payment workflows and trusted business relationships can be manipulated. It is commonly described as business email compromise / vendor impersonation.

### Prevention
- Verify unusual payment, bank-detail, password-reset, or data requests through a known, independent channel.
- Use phishing-resistant MFA where available; never approve an unexpected authentication prompt.
- Configure SPF, DKIM, and DMARC for organizational email domains.
- Filter malicious links and attachments and keep endpoint protection current.
- Train people to report suspicious messages without fear of punishment.
- Use dual approval and change-of-bank-details verification for high-value transactions.

## 3. Pretexting

### Definition and method
Pretexting is creating a believable story or identity to obtain information or action. An attacker may pretend to be IT support, a manager, a recruiter, a bank employee, a delivery service, or an auditor. The attacker may use publicly available information to make the story credible.

### Impact
Pretexting can lead to disclosure of employee or customer records, password resets, unauthorized access, fraudulent payments, or bypassing of physical security.

### Case study / documented pattern
The U.S. Federal Trade Commission warns that impersonation scams frequently involve criminals pretending to be government officials or trusted businesses and pressuring people to provide money or sensitive information. The exact pretext varies, but the recurring pattern is an invented authority or emergency combined with a request that bypasses normal verification.

### Prevention
- Verify identity using an approved directory or callback number, not contact details supplied in the suspicious request.
- IT support should never ask for a user's password or MFA code.
- Establish clear procedures for account recovery, employee onboarding, sensitive-data access, and executive requests.
- Require approvals for privileged actions and maintain auditable logs.
- Limit the personal and organizational information exposed publicly where practical.

## 4. Baiting

### Definition and method
Baiting offers something tempting—such as a free download, prize, gift card, or USB drive—to encourage a risky action. A physical USB device may contain malicious files or exploit a vulnerable system; a digital bait may direct a user to a malicious download or credential-harvesting site.

### Impact
Baiting can introduce malware, steal credentials, compromise endpoints, or provide a foothold for broader network intrusion.

### Case study / documented pattern
The Stuxnet incident, publicly analyzed by security researchers and government sources, demonstrated that removable media can be a route into isolated or tightly controlled environments. It is not proof that every USB infection is baiting; rather, it illustrates why removable-media handling is a security control. A classic baiting scenario is an unknown USB drive left where an employee might plug it into a work computer.

### Prevention
- Do not plug unknown USB devices into work or personal computers.
- Provide a safe process to hand found devices to IT/security staff.
- Disable autorun where appropriate and use endpoint controls to restrict removable media.
- Keep systems patched and use least privilege so a user-level mistake has limited impact.
- Download software only from trusted sources and verify publisher/signature information where available.

## 5. Other related forms

- **Vishing:** voice calls used to impersonate trusted people or institutions.
- **Smishing:** phishing delivered by SMS or messaging applications.
- **Tailgating:** following an authorized person into a restricted physical area.
- **Quid pro quo:** offering a service or benefit in exchange for access or information.
- **MFA fatigue:** repeatedly prompting a user to approve authentication until they accept; unexpected prompts should be denied and reported.

## 6. Organizational prevention framework

1. **People:** short, recurring training with realistic examples; make reporting easy and blame-free.
2. **Process:** independent verification for payments, sensitive-data requests, access changes, and account recovery.
3. **Technology:** phishing-resistant MFA, email authentication, endpoint protection, filtering, least privilege, and logging.
4. **Response:** provide a clear reporting channel; revoke sessions, reset credentials, notify financial institutions, and preserve evidence when an incident occurs.
5. **Measurement:** evaluate reporting rates, time-to-report, simulation learning, and control effectiveness—not just click rates.

## 7. What to do after a suspected attack

- Stop interacting with the message or caller and report it through the official channel.
- If credentials were entered, use a trusted device to change the password, revoke active sessions, and contact IT/security.
- If a payment was sent, immediately contact the bank/payment provider and the organization's finance/security teams.
- Preserve the original message, sender details, timestamps, and transaction records.
- Follow incident-response and legal/privacy reporting procedures.

## 8. Conclusion

Social engineering succeeds when an attacker can make a request feel normal, urgent, or trustworthy. Awareness helps, but reliable verification, strong authentication, payment controls, least privilege, and a supportive reporting culture reduce the consequences of mistakes. The most effective program combines people, process, and technology.

## References

1. U.S. Department of Justice, **Lithuanian Man Sentenced for $122 Million Fraud Scheme Targeting Two Internet Companies** (2019): https://www.justice.gov/opa/pr/lithuanian-man-sentenced-122-million-fraud-scheme-targeting-two-internet-companies
2. Federal Trade Commission, **How to Recognize and Avoid Phishing Scams**: https://consumer.ftc.gov/articles/how-recognize-and-avoid-phishing-scams
3. Federal Trade Commission, **Impersonation Scams**: https://consumer.ftc.gov/features/avoiding-imposter-scams
4. CISA, **Recognize and Report Phishing**: https://www.cisa.gov/secure-our-world/recognize-and-report-phishing
5. CISA, **Stuxnet** overview/resources: https://www.cisa.gov/

**Personalization before submission:** Add a brief example of a suspicious message a student or employee might receive and explain how to verify it safely. Do not include real passwords, private information, or a live malicious link.
