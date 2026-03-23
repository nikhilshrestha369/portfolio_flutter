// --- DATA MODELS & DATA ---

class Job {
  final String period;
  final String title;
  final String company;
  final String location;
  final List<String> responsibilities;

  const Job({
    required this.period,
    required this.title,
    required this.company,
    required this.location,
    required this.responsibilities,
  });
}

class Education {
  final String period;
  final String degree;
  final String institution;

  const Education({
    required this.period,
    required this.degree,
    required this.institution,
  });
}

class Skill {
  final String name;
  final double progress; // 0.0 to 1.0

  const Skill({required this.name, required this.progress});
}

final List<Job> employmentHistory = [
  Job(
    period: 'Apr 2024 — Present',
    title: 'Mid-level Flutter Developer',
    company: 'Prixa Technologies',
    location: 'Jawlakhel, Lalitpur',
    responsibilities: [
      'Designed, developed, and deployed mobile and cross-platform applications for Android TV, POS devices, and thermal printers using Flutter and Dart.',
      'Implemented socket-based bill printing functionality for seamless integration with high-speed receipt printers.',
      'Built and maintained a News Portal mobile application, featuring real-time content updates, category filtering, and push notifications for breaking news.',
      'Developed TikTok-style short video and messaging features, including video feed rendering, likes/comments, and real-time chat using socket communication.',
      'Contributed to Augmented Reality (AR) projects, integrating AR SDKs for immersive, interactive user experiences within mobile applications.',
      'Collaborated closely with designers, backend developers, and QA engineers to deliver high-performance, user-friendly applications.',
    ],
  ),
  Job(
    period: 'Mar 2023 — Apr 2024',
    title: 'Mid-level Flutter Developer',
    company: 'Nectar Digit',
    location: 'Sundhara, Kathmandu',
    responsibilities: [
      'Designed, developed, and deployed multiple high-quality mobile applications to the Google Play Store and Apple App Store, including Celler Mart, Peak Promotion, and O & U Furniture.',
      'Integrated Google Maps for location-based features such as live tracking, geocoding, and route optimization.',
      'Implemented real-time socket communication for instant data updates and interactive user experiences.',
      'Led iOS release management, resolving platform-specific issues, configuring provisioning profiles, and ensuring smooth App Store submissions.',
      'Applied Provider and GetX for robust state management, resulting in improved app scalability, maintainability, and performance.',
      'Conducted code reviews, refactoring, and optimization to maintain a clean and modular codebase.',
      'Actively contributed to UI/UX improvements, ensuring mobile apps met high usability and accessibility standards.',
    ],
  ),
  Job(
    period: 'Nov 2022 — Mar 2023',
    title: 'Junior Flutter Developer',
    company: 'FrenzYard',
    location: 'Pulchowk, Lalitpur',
    responsibilities: [
      'Developed and consumed RESTful APIs to connect applications with backend systems.',
      'Optimized app performance and implemented lazy loading and state management to improve responsiveness.',
      'Conducted UI/UX improvements to enhance user engagement and satisfaction.',
      'Collaborated with cross-functional teams, including designers and backend engineers, to deliver projects on time.',
      'Deployed apps to Google Play Store with optimized release builds and handled post-release bug fixes and feature updates.',
    ],
  ),
  Job(
    period: 'Jul 2022 — Oct 2022',
    title: 'Backend Developer',
    company: 'Shrestha Ventures',
    location: 'Gaushala, Kathmandu',
    responsibilities: [
      'Designed, developed, and deployed scalable RESTful APIs using Node.js and Express.js to power mobile and web applications.',
      'Created modular, reusable backend components to improve development speed and maintainability.',
      'Integrated MongoDB for database storage with optimized indexing to ensure fast query performance.',
      'Implemented secure authentication & authorization using JWT to protect APIs and user data.',
    ],
  ),
  Job(
    period: 'Aug 2021 — Nov 2022',
    title: 'Flutter Internship',
    company: 'Cool Multipurpose',
    location: 'Gaushala, Kathmandu',
    responsibilities: [
      'Developed mobile applications using Flutter framework.',
      'Collaborated with cross-functional teams to design user-friendly interfaces.',
      'Conducted code reviews to ensure quality and maintainability.',
      'Participated in Agile methodologies for project management.',
      'Assisted in debugging and troubleshooting issues in existing applications.',
    ],
  ),
];

final List<Education> educationHistory = [
  Education(
    period: 'Aug 2025 — Present',
    degree: 'MBA with Specialisation in International Business Management',
    institution: 'Islington College',
  ),
  Education(
    period: 'Oct 2019 — Dec 2022',
    degree: 'BSc (Hons) Computing',
    institution: 'Islington College',
  ),
];

double _getLevelProgress(String level) {
  switch (level) {
    case 'Expert':
      return 0.9;
    case 'Skillful':
      return 0.7;
    case 'Experienced':
      return 0.6;
    default:
      return 0.5; // Default for unknown levels
  }
}

final List<Skill> skills = [
  Skill(name: 'Flutter & Dart', progress: _getLevelProgress('Expert')),
  Skill(name: 'Bloc', progress: _getLevelProgress('Skillful')),
  Skill(name: 'GetX', progress: _getLevelProgress('Expert')),
  Skill(name: 'Provider', progress: _getLevelProgress('Expert')),
  Skill(name: 'Firebase', progress: _getLevelProgress('Expert')),
  Skill(name: 'Git', progress: _getLevelProgress('Expert')),
  Skill(name: 'Figma', progress: _getLevelProgress('Experienced')),
  Skill(name: 'Java', progress: _getLevelProgress('Experienced')),
  Skill(name: 'Python, Django', progress: _getLevelProgress('Skillful')),
  Skill(name: 'Node.js', progress: _getLevelProgress('Experienced')),
];