// ─── Resume Data Model ────────────────────────────────────────────────────────
// Gangadhar Poosarla - Application Security Engineer
// All data extracted from official resume

class ResumeData {
  static const String name = 'GANGADHAR POOSARLA';
  static const String title = 'Application Security Analyst';
  static const String phone = '+91 8106707308';
  static const String email = 'gangadharpoosarla8@gmail.com';
  static const String linkedin = 'linkedin.com/in/gangadhar-poosarla';
  static const String location = 'Visakhapatnam, India';
  static const String apkUrl = 'https://github.com/Lucifer0031J/gangadhar-portfolio/raw/main/app-release.apk';
  
  // Tony Stark easter egg quote — hidden until user taps the avatar 5x
  static const String starkQuote =
      '"I am Iron Man." — But in this universe, I secure the suit\'s OS. 🔐';

  static const String summary =
      'Application Security Analyst with 2 years of experience in web and API VAPT, '
      'mobile security testing, secure code review, and custom security tooling development within '
      'fintech environments. Hands-on with OWASP Top 10, ASVS, and PCI-DSS compliance workflows. '
      'Experienced in building Python security automation tools for DevSecOps, SCA/SBOM vulnerability '
      'parsing, HTTP header auditing, and Apache VirtualHost verification. Comfortable working across '
      'dev and QA teams to track and close findings.';

  static const List<SkillCategory> skills = [
    SkillCategory(
      name: 'Application Security',
      icon: '🛡️',
      color: 0xFF00D4FF,
      items: [
        Skill('Web & API VAPT', 95),
        Skill('Mobile App Security (MobSF, Frida)', 88),
        Skill('Secure Code Review (Java/Python)', 85),
        Skill('SAST/SCA (SonarQube, SBOM)', 90),
        Skill('OWASP Top 10 / ASVS / MASVS', 92),
      ],
    ),
    SkillCategory(
      name: 'Security Automation',
      icon: '⚔️',
      color: 0xFFFF3B3B,
      items: [
        Skill('Python Security Scripting', 92),
        Skill('REST API Automation', 90),
        Skill('Dependency-Check / CycloneDX', 85),
        Skill('Apache Config Auditing', 88),
      ],
    ),
    SkillCategory(
      name: 'Testing & Compliance',
      icon: '🔧',
      color: 0xFFFFB300,
      items: [
        Skill('AuthN/AuthZ & Logic Flaws', 90),
        Skill('IDOR / SSRF', 92),
        Skill('PCI-DSS / RBI Guidelines', 85),
        Skill('Remediation Tracking', 88),
        Skill('Apache APISIX Gateway', 80),
      ],
    ),
    SkillCategory(
      name: 'Tooling & Languages',
      icon: '💻',
      color: 0xFF00FF94,
      items: [
        Skill('Python / Java / Bash / C', 88),
        Skill('Burp Suite / Postman', 95),
        Skill('MobSF / Frida (JS)', 85),
        Skill('SonarQube', 85),
        Skill('Wireshark', 80),
      ],
    ),
  ];

  static const List<Experience> experiences = [
    Experience(
      role: 'Information Security Associate',
      company: 'Yalamanchili Solutions for Payments',
      period: 'Jul 2024 – Present',
      location: 'Visakhapatnam, India',
      isCurrent: true,
      color: 0xFF00D4FF,
      highlights: [
        'Conducted VAPT for 40+ web and API applications in UAT/pre-prod environments, aligned to OWASP Top 10, ASVS, and PCI-DSS requirements.',
        'Developed a Python-based DevSecOps SCA & Supply Chain Pipeline integrating Nexus REST APIs, binary streaming retrievers, and an OWASP Dependency-Check/CycloneDX SBOM parser to automate SHA-512 hashing, PURL/CVSS mapping, and clean vs. vulnerable dependency reporting for DevOps.',
        'Engineered a multi-threaded Security & Performance Headers Auditor (Python + openpyxl) with fallback execution mechanics (requests → curl → wget) and policy scoring to automate header validation across enterprise endpoints with styled Excel reports.',
        'Built an automated Apache Config & URL Master Inventory Verifier in Python parsing VirtualHost rules (ProxyPass, Location, regex) and cross-referencing master sheets to detect missing/inactive contexts, domain mismatches, and IP CIDR whitelist errors.',
        'Identified vulnerabilities including authentication bypass, IDOR, SSRF, insecure deserialization, and business logic flaws during dynamic testing.',
        'Tracked and followed up on high/critical findings with dev and QA teams, contributing to consistent improvement in closure rates within agreed SLAs.',
        'Performed secure code reviews (Java/Python) for new features, helping reduce recurring vulnerability patterns over time.',
        'Participated in PCI-DSS & RBI compliance reviews for UAT and pre-production sign-off processes.',
        'Led trial environment deployment of Apache APISIX as an API gateway and security layer; coordinating with stakeholders for production rollout pending approval — covering route-level access control, rate limiting, and API traffic inspection.',
        'Supported SAST and SCA reviews using SonarQube and SBOM tooling as part of the secure development workflow.',
        'Prepared and presented detailed VAPT reports with risk-rated findings and remediation guidance to development and QA stakeholders.',
      ],
    ),
    Experience(
      role: 'Android Development Intern',
      company: 'WiSeNet Automation Pvt. Ltd.',
      period: 'Nov 2023 – Jan 2024',
      location: 'Visakhapatnam, India',
      isCurrent: false,
      color: 0xFFFFB300,
      highlights: [
        'Contributed to UI/UX improvements and performance fixes that meaningfully improved app responsiveness and user adoption.',
      ],
    ),
    Experience(
      role: 'Independent Vulnerability Research',
      company: 'Bug Bounty & Responsible Disclosure',
      period: '2021 – 2024',
      location: 'Student Period',
      isCurrent: false,
      color: 0xFFFF3B3B,
      highlights: [
        'Identified and responsibly disclosed 15+ vulnerabilities across targets including a college portal, FacePrep, and SVR Travels during undergraduate studies.',
        'Findings covered authentication weaknesses, session issues, and access control flaws; all reported through responsible disclosure.',
      ],
    ),
  ];

  static const List<Project> projects = [
    Project(
      title: 'DevSecOps SCA & Supply Chain Automation Pipeline',
      description:
          'Automated Nexus inventory extraction, JAR streaming, SBOM parsing, SHA-512 hashing, and clean vs. vulnerable dependency segregation into styled HTML/CSV reports.',
      tags: ['Python', 'Nexus API', 'CycloneDX', 'OWASP Dependency-Check'],
      icon: '🔄',
      color: 0xFF00D4FF,
      starkComment: 'JARVIS handling my dependencies, naturally.',
    ),
    Project(
      title: 'Multi-Threaded Security Header Auditor',
      description:
          'High-throughput HTTP security header scanner featuring fallback execution mechanics, policy scoring, and automated Excel report generation.',
      tags: ['Python', 'ThreadPoolExecutor', 'openpyxl', 'Automation'],
      icon: '🛡️',
      color: 0xFF00FF94,
      starkComment: 'Even my suit has better security headers than most sites I\'ve scanned.',
    ),
    Project(
      title: 'Apache VirtualHost & Master Sheet Audit Engine',
      description:
          'Automated verification engine parsing Apache proxy rules and cross-referencing master Excel inventories for IP subnet and route discrepancies.',
      tags: ['Python', 'IPv4/v6 CIDR Parsing', 'Apache'],
      icon: '📜',
      color: 0xFFFFB300,
      starkComment: 'Routing rules so tight, not even Ultron could slip through.',
    ),
    Project(
      title: 'Mobile App Dynamic Security Audit Framework',
      description:
          'Dynamic binary instrumentation runner executing custom JavaScript hooks to inspect Android app runtime behaviors against mobile security checklists.',
      tags: ['Python', 'Frida', 'Android', 'Mobile Security'],
      icon: '📱',
      color: 0xFFFF3B3B,
      starkComment: 'Hooking into runtime like patching my own suit.',
    ),
    Project(
      title: 'Geo-fencing Access Control Tool',
      description:
          'Implemented region-based access enforcement using MaxMind GeoIP + Apache configuration; tested in a controlled lab environment.',
      tags: ['GeoIP', 'Apache', 'Access Control', 'Python'],
      icon: '🌐',
      color: 0xFF00D4FF,
      starkComment: 'Location-aware security — even Stark Tower had geo-fencing.',
    ),
    Project(
      title: 'DKMS — Quantum-Resistant Decentralized KMS',
      description:
          'Research project exploring decentralized key management using Shamir’s Secret Sharing and CRYSTALS-Kyber; includes basic threat modeling.',
      tags: ['Cryptography', 'Quantum-Safe', 'CRYSTALS-Kyber', 'Distributed Systems'],
      icon: '🔑',
      color: 0xFF00FF94,
      starkComment: 'Post-quantum encryption. JARVIS would be proud.',
    ),
    Project(
      title: 'Decentralized DNS Prototype (Ethereum)',
      description:
          'Research prototype exploring DNS spoofing mitigation via blockchain; independently copyrighted (L-139347/2023).',
      tags: ['Ethereum', 'Blockchain', 'DNS', 'MITM Prevention', 'Copyrighted'],
      icon: '⛓️',
      color: 0xFFFF3B3B,
      starkComment: 'DNS on blockchain? Even Fury didn\'t see that coming.',
    ),
  ];

  static const List<Certification> certifications = [
    Certification(
      name: 'Certified Threat Intelligence & Governance Analyst',
      acronym: 'CTIGA',
      issuer: 'Red Team Leaders',
      date: 'Jan 2026',
      icon: '🎖️',
    ),
  ];

  static const Education education = Education(
    degree: 'B.Tech in Information Technology',
    institution: 'GMRIT',
    period: 'Jun 2024',
    icon: '🎓',
  );

  // Tony Stark Easter Eggs — triggered by hidden interactions
  static const List<String> easterEggs = [
    '"Genius, billionaire, playboy, philanthropist." — Well, minus the billionaire part. For now.',
    '"Sometimes you gotta run before you can walk." — I automated it first.',
    '"I am Iron Man." — But I\'m also the one who patches Iron Man\'s suit firmware.',
    '"We have a Hulk." — We also have VAPT, SAST, and threat modeling.',
    '"Friday, it\'s good to be home." — *loads Burp Suite*',
    '"Part of the journey is the end." — Every pentest report has one. Make it count.',
    '"I choose to run towards my problems, not away from them." — Zero-day? Let\'s go.',
    '"Proof that Tony Stark has a heart." — Mine beats fastest when I find a critical CVE.',
  ];
}

// ─── Data Classes ─────────────────────────────────────────────────────────────

class SkillCategory {
  final String name;
  final String icon;
  final int color;
  final List<Skill> items;
  const SkillCategory({required this.name, required this.icon, required this.color, required this.items});
}

class Skill {
  final String name;
  final int proficiency; // 0–100
  const Skill(this.name, this.proficiency);
}

class Experience {
  final String role;
  final String company;
  final String period;
  final String location;
  final bool isCurrent;
  final int color;
  final List<String> highlights;
  const Experience({
    required this.role, required this.company, required this.period,
    required this.location, required this.isCurrent, required this.color,
    required this.highlights,
  });
}

class Project {
  final String title;
  final String description;
  final List<String> tags;
  final String icon;
  final int color;
  final String starkComment;
  const Project({
    required this.title, required this.description, required this.tags,
    required this.icon, required this.color, required this.starkComment,
  });
}

class Certification {
  final String name;
  final String acronym;
  final String issuer;
  final String date;
  final String icon;
  const Certification({
    required this.name, required this.acronym, required this.issuer,
    required this.date, required this.icon,
  });
}

class Education {
  final String degree;
  final String institution;
  final String period;
  final String icon;
  const Education({
    required this.degree, required this.institution,
    required this.period, required this.icon,
  });
}
