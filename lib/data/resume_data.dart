// ─── Resume Data Model ────────────────────────────────────────────────────────
// Gangadhar Poosarla - Application Security Engineer
// All data extracted from official resume

class ResumeData {
  static const String name = 'GANGADHAR POOSARLA';
  static const String title = 'Application Security Engineer';
  static const String phone = '+91 8106707308';
  static const String email = 'gangadharpoosarla8@gmail.com';
  static const String linkedin = 'linkedin.com/in/gangadhar-poosarla';
  static const String location = 'Visakhapatnam, India';
  static const String apkUrl = 'https://github.com/Lucifer0031J/gangadhar-portfolio/raw/main/app-release.apk';
  
  // Tony Stark easter egg quote — hidden until user taps the avatar 5x
  static const String starkQuote =
      '"I am Iron Man." — But in this universe, I secure the suit\'s OS. 🔐';

  static const String summary =
      'Application Security Engineer specializing in Web and API VAPT, '
      'secure code review, threat modeling, and security automation. '
      'Experienced in UAT/Pre-prod testing and remediation workflows aligned to '
      'PCI-DSS, RBI, OWASP Top 10, ASVS. Offensive mindset developed via bug '
      'bounty and research into quantum-safe cryptography, decentralized DNS, '
      'and geo-fencing. Comfortable influencing dev teams, optimizing closure '
      'rates, and integrating security practices across SDLC.';

  static const List<SkillCategory> skills = [
    SkillCategory(
      name: 'Application Security',
      icon: '🛡️',
      color: 0xFF00D4FF,
      items: [
        Skill('Web & API VAPT', 95),
        Skill('Secure Code Review', 88),
        Skill('Threat Modeling (STRIDE)', 85),
        Skill('OWASP Top 10 / ASVS', 92),
        Skill('PCI-DSS / RBI Compliance', 80),
        Skill('SSDLC', 82),
      ],
    ),
    SkillCategory(
      name: 'Offensive Security',
      icon: '⚔️',
      color: 0xFFFF3B3B,
      items: [
        Skill('AuthZ/AuthN Abuse', 90),
        Skill('IDOR / SSRF', 88),
        Skill('Business Logic Flaws', 85),
        Skill('Session & Crypto Misuse', 83),
        Skill('Bug Bounty', 80),
      ],
    ),
    SkillCategory(
      name: 'Tooling',
      icon: '🔧',
      color: 0xFFFFB300,
      items: [
        Skill('Burp Suite', 95),
        Skill('Nmap / Nessus', 85),
        Skill('MobSF / Mobexler', 82),
        Skill('Metasploit', 78),
        Skill('Wireshark', 80),
        Skill('Postman / SoapUI', 88),
        Skill('ImmuniWeb', 75),
      ],
    ),
    SkillCategory(
      name: 'Programming',
      icon: '💻',
      color: 0xFF00FF94,
      items: [
        Skill('Python', 85),
        Skill('Java', 78),
        Skill('Bash', 82),
        Skill('C', 70),
        Skill('HTML5 / CSS3', 80),
        Skill('Flutter / Dart', 75),
      ],
    ),
  ];

  static const List<Experience> experiences = [
    Experience(
      role: 'Application Security Engineer',
      company: 'Yalamanchili Solutions for Payments',
      period: 'Jul 2024 – Present',
      location: 'Visakhapatnam, India',
      isCurrent: true,
      color: 0xFF00D4FF,
      highlights: [
        'Delivered VAPT for 40+ real-time web & API applications in UAT/pre-prod aligned to OWASP Top 10, ASVS and PCI-DSS.',
        'Achieved 92% closure rate for high/critical findings within SLA by partnering with delivery, QA and dev teams.',
        'Performed secure code reviews (Java/Python) and threat modeling, reducing vulnerability reopen rate by 28%.',
        'Executed dynamic testing — uncovering auth bypass, IDOR, SSRF, insecure deserialization & business logic flaws.',
        'Automated validation/reporting via in-house Security Headers Scanner (Python + Selenium), saving 15+ hrs/week.',
        'Collaborated with SOC/EDR for threat triage and detection tuning, improving signal-to-noise ratios.',
        'Participated in compliance-driven reviews supporting PCI-DSS & RBI guidelines for UAT approvals.',
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
        'Improved app load time by 40% via UI/UX refactor and performance tuning.',
        'Increased active users from 10 to 400+ through enhanced user experience design.',
      ],
    ),
    Experience(
      role: 'Freelance Bug Bounty Hunter',
      company: 'Independent',
      period: '2021 – Present',
      location: 'Remote',
      isCurrent: true,
      color: 0xFFFF3B3B,
      highlights: [
        'Reported 30+ vulnerabilities across public bug bounty programs.',
        'Responsible disclosure of auth, session, crypto & logic issues.',
      ],
    ),
  ];

  static const List<Project> projects = [
    Project(
      title: 'DKMS — Quantum-Resistant Decentralized KMS',
      description:
          'Designed a decentralized Key Management System using Shamir\'s Secret Sharing + CRYSTALS-Kyber with threat modeling & resilience tests for quantum-capable adversaries. Post-quantum security meets decentralization.',
      tags: ['Cryptography', 'Quantum-Safe', 'CRYSTALS-Kyber', 'Distributed Systems'],
      icon: '🔑',
      color: 0xFF00D4FF,
      starkComment: 'JARVIS would be jealous of this encryption scheme.',
    ),
    Project(
      title: 'Security Headers Scanner',
      description:
          'Automated HTTP security header auditing tool built with Python & Selenium. Features Excel I/O for standardized reporting. Saved 15+ hrs/week across the security team and became an internal standard.',
      tags: ['Python', 'Selenium', 'Automation', 'Security Headers'],
      icon: '📡',
      color: 0xFF00FF94,
      starkComment: 'Even my suit has better security headers than most sites I\'ve scanned.',
    ),
    Project(
      title: 'Geo-fencing Access Control Tool',
      description:
          'Enforced region-based access control via MaxMind GeoIP + Apache configuration. Blocked 70% unauthorized traffic in test scenarios. Real-world deployment-ready geo-restriction system.',
      tags: ['GeoIP', 'Apache', 'Access Control', 'Python'],
      icon: '🌐',
      color: 0xFFFFB300,
      starkComment: 'Location-aware security — even Stark Tower had geo-fencing.',
    ),
    Project(
      title: 'Decentralized DNS for Spoofing Mitigation',
      description:
          'Research prototype leveraging Ethereum blockchain to reduce MITM risk via decentralized DNS resolution. Officially copyrighted (L-139347/2023) — the first blockchain DNS copyright in my portfolio.',
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
