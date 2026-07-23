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
      'I started building Android applications before moving into Application Security. '
      'That experience changed how I approach testing—I don\'t just look for vulnerabilities, '
      'I think like the developer who wrote the code. Today I focus on securing web, API, '
      'and mobile applications while automating repetitive security workflows wherever possible.';

  static const List<SkillCategory> skills = [
    SkillCategory(
      name: 'Application Security',
      icon: '🛡️',
      color: 0xFF00D4FF,
      items: [
        Skill('Web & API VAPT', 'Expert'),
        Skill('Mobile App Security (MobSF, Frida)', 'Expert'),
        Skill('Secure Code Review (Java/Python)', 'Advanced'),
        Skill('SAST/SCA (SonarQube, SBOM)', 'Advanced'),
        Skill('OWASP Top 10 / ASVS / MASVS', 'Expert'),
      ],
    ),
    SkillCategory(
      name: 'Security Automation',
      icon: '⚙️',
      color: 0xFFFF3B3B,
      items: [
        Skill('Python Security Scripting', 'Expert'),
        Skill('REST API Automation', 'Advanced'),
        Skill('Dependency-Check / CycloneDX', 'Working Knowledge'),
        Skill('Apache Config Auditing', 'Advanced'),
      ],
    ),
    SkillCategory(
      name: 'Testing & Compliance',
      icon: '✅',
      color: 0xFFFFB300,
      items: [
        Skill('AuthN/AuthZ & Logic Flaws', 'Expert'),
        Skill('IDOR / SSRF', 'Expert'),
        Skill('PCI-DSS / RBI Guidelines', 'Advanced'),
        Skill('Remediation Tracking', 'Advanced'),
        Skill('Apache APISIX Gateway', 'Working Knowledge'),
      ],
    ),
    SkillCategory(
      name: 'Tooling & Languages',
      icon: '💻',
      color: 0xFF00FF94,
      items: [
        Skill('Python / Java / Bash / C', 'Advanced'),
        Skill('Burp Suite / Postman', 'Expert'),
        Skill('MobSF / Frida (JS)', 'Working Knowledge'),
        Skill('SonarQube', 'Advanced'),
        Skill('Wireshark', 'Working Knowledge'),
      ],
    ),
  ];

  static const List<ResearchItem> research = [
    ResearchItem('Frida Runtime Instrumentation', 'ACTIVE'),
    ResearchItem('Android Banking Security', 'ACTIVE'),
    ResearchItem('SBOM Automation', 'ACTIVE'),
    ResearchItem('Secure SDLC', 'ACTIVE'),
    ResearchItem('AI for AppSec', 'ACTIVE'),
  ];

  static const List<MissionLog> experiences = [
    MissionLog(
      missionId: 'MISSION LOG 001',
      objective: 'Secure banking web portals and scale DevSecOps pipeline.',
      company: 'Yalamanchili Solutions for Payments',
      period: 'Jul 2024 – Present',
      location: 'Visakhapatnam, India',
      status: 'ACTIVE',
      color: 0xFF00D4FF,
      results: [
        '✓ 40+ web & API applications assessed (OWASP/ASVS/PCI-DSS)',
        '✓ DevSecOps SCA Pipeline built (Python, Nexus REST API, CycloneDX)',
        '✓ Automated Security Headers Auditor (Python, openpyxl)',
        '✓ Apache Config Verifier deployed',
        '✓ Apache APISIX API Gateway configured for rate limiting & access control',
        '✓ Found auth bypass, IDOR, SSRF & insecure deserialization flaws',
        '✓ Secure code reviews (Java/Python)',
      ],
    ),
    MissionLog(
      missionId: 'MISSION LOG 002',
      objective: 'Optimize and refine mobile user experience.',
      company: 'WiSeNet Automation Pvt. Ltd.',
      period: 'Nov 2023 – Jan 2024',
      location: 'Visakhapatnam, India',
      status: 'COMPLETED',
      color: 0xFFFFB300,
      results: [
        '✓ UI/UX refactored for 40% load time improvement',
        '✓ Active users increased from 10 to 400+',
      ],
    ),
    MissionLog(
      missionId: 'MISSION LOG 003',
      objective: 'Find and responsibly disclose critical vulnerabilities.',
      company: 'Bug Bounty & Responsible Disclosure',
      period: '2021 – 2024',
      location: 'Student Period',
      status: 'COMPLETED',
      color: 0xFFFF3B3B,
      results: [
        '✓ 15+ vulnerabilities reported (college portal, FacePrep, SVR Travels)',
        '✓ Auth weaknesses, session issues, access control flaws disclosed',
      ],
    ),
  ];

  static const List<Project> projects = [
    Project(
      title: 'SBOM Generator Automation',
      description:
          'Automated Nexus inventory extraction, JAR streaming, SBOM parsing, SHA-512 hashing, and clean vs. vulnerable dependency segregation into styled HTML/CSV reports.',
      tags: ['Python', 'Nexus API', 'CycloneDX', 'OWASP Dependency-Check'],
      icon: '🔄',
      color: 0xFF00D4FF,
      starkComment: 'JARVIS handling my dependencies, naturally.',
    ),
    Project(
      title: 'Python Security Scripts',
      description:
          'High-throughput HTTP security header scanner featuring fallback execution mechanics, policy scoring, and automated Excel report generation.',
      tags: ['Python', 'ThreadPoolExecutor', 'openpyxl', 'Automation'],
      icon: '🛡️',
      color: 0xFF00FF94,
      starkComment: 'Even my suit has better security headers than most sites I\'ve scanned.',
    ),
    Project(
      title: 'Burp Extensions / Apache Verifier',
      description:
          'Automated verification engine parsing Apache proxy rules and cross-referencing master Excel inventories for IP subnet and route discrepancies.',
      tags: ['Python', 'IPv4/v6 CIDR Parsing', 'Apache'],
      icon: '📜',
      color: 0xFFFFB300,
      starkComment: 'Routing rules so tight, not even Ultron could slip through.',
    ),
    Project(
      title: 'MobSF Automation & Frida Scripts',
      description:
          'Dynamic binary instrumentation runner executing custom JavaScript hooks to inspect Android app runtime behaviors against mobile security checklists.',
      tags: ['Python', 'Frida', 'Android', 'Mobile Security'],
      icon: '📱',
      color: 0xFFFF3B3B,
      starkComment: 'Hooking into runtime like patching my own suit.',
    ),
    Project(
      title: 'Android Testing Toolkit',
      description:
          'Implemented region-based access enforcement using MaxMind GeoIP + Apache configuration; tested in a controlled lab environment.',
      tags: ['GeoIP', 'Apache', 'Access Control', 'Python'],
      icon: '🌐',
      color: 0xFF00D4FF,
      starkComment: 'Location-aware security — even Stark Tower had geo-fencing.',
    ),
    Project(
      title: 'Quantum-Resistant Decentralized KMS',
      description:
          'Research project exploring decentralized key management using Shamir’s Secret Sharing and CRYSTALS-Kyber; includes basic threat modeling.',
      tags: ['Cryptography', 'Quantum-Safe', 'CRYSTALS-Kyber'],
      icon: '🔑',
      color: 0xFF00FF94,
      starkComment: 'Post-quantum encryption. JARVIS would be proud.',
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
  final String level; 
  const Skill(this.name, this.level);
}

class ResearchItem {
  final String title;
  final String status;
  const ResearchItem(this.title, this.status);
}

class MissionLog {
  final String missionId;
  final String objective;
  final String company;
  final String period;
  final String location;
  final String status;
  final int color;
  final List<String> results;
  const MissionLog({
    required this.missionId, required this.objective, required this.company,
    required this.period, required this.location, required this.status, required this.color,
    required this.results,
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
