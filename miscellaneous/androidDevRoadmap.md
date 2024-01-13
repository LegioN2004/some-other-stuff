# Android development

---

**Title Slide**

- _Title:_ "Introduction to Android Development"
- _Subtitle:_ "Building Your First Mobile App"

---

**Slide 2: What is Android Development?**

- _Introduction:_
  - Android development involves creating mobile applications for devices running the Android operating system. Android, developed by Google, is a widely used mobile platform, making it a valuable skill for developers. Embarking on the journey of Android development opens a world of possibilities where you transform your ideas into interactive and dynamic mobile applications for millions of users. As an Android developer, you'll leverage the power of Java or Kotlin, the primary programming languages for Android, to craft engaging user interfaces using XML layouts. Android Studio, the official development environment, becomes your creative playground, providing tools to design, code, test, and debug your apps seamlessly. From creating your first 'Hello World' program to mastering the intricacies of activities, UI components, and event handling, Android development introduces you to the core building blocks of mobile applications. And the excitement doesn't stop there – as you evolve, you'll explore advanced topics like databases, networking, and incorporating third-party libraries. What's more, the cross-platform realm beckons! With Flutter and React Native, you can extend your skills to create mobile apps for both Android and iOS, including their wide range of devices, using a single codebase. So, whether you're diving into the native Android world or exploring cross-platform frameworks, your journey in mobile app development is a thrilling adventure filled with creativity and endless possibilities. Welcome to the vibrant and dynamic world of Android development!
- Resource: https://developer.android.com/ - Official Android Developer website, your one-stop shop for documentation, tutorials, and resources.

---

**Choosing your weapon, the language**

- _Java and Kotlin:_

  - "Java and Kotlin are the primary programming languages for Android development. Kotlin, introduced by JetBrains, is now officially supported and recommended by Android and offers concise syntax and enhanced safety features."

    - resources

      - Kotlin: https://kotlinlang.org/ - Official Kotlin website with tutorials, documentation, and a vibrant community.
      - Java: https://www.java.com/ - Official Java website with tutorials, documentation, and resources.

  - Java: Java is a popular programming language used for Android development due to its robustness and ease of use. Its object-oriented structure allows developers to create modular programs and reusable code. The language was built with the philosophy of “write once, run anywhere” (WORA), meaning compiled Java code can run on all platforms without the need for recompilation. Android’s API and core libraries are primarily written in Java, therefore understanding Java is fundamental in creating diverse and powerful Android apps. Java is a statically-typed language, which can be beneficial for detecting errors at compile-time rather than at runtime. Oracle, who owns Java, provides comprehensive documentation and support for the language.

  - Kotlin: Kotlin is a cross-platform, statically typed general-purpose programming language with type inference. Developed by JetBrains, the makers of the world’s leading IDEs, Kotlin has a syntax, which is more expressive and concise. This allows for more readable and maintainable code. It is fully interoperable with Java and comes with no limitations. It can be used almost everywhere Java is used today, for server-side development, Android apps, and much more. Kotlin introduces several improvements for programmers over Java, which makes it a preferred choice for many developers. With more concise code base and modern programming concept support - it’s certainly a future of Android app development.

  - _XML Layouts:_
    - "XML (eXtensible Markup Language) is used for designing the layout and appearance of Android app interfaces. It allows developers to define UI elements and their properties in a structured manner."

#### JavaScript

If you happen to be from the JavaScript background with a good amount of web development knowledge, you can opt for the cross-platform react-native journey which is a similar framework to React made by facebook(now Meta) but for mobile development. You may feel like home if you have done some react native development for making user interfaces using react and css. Also the react-native way is a bit easy to enter into the android development world using Expo and its set of tools(production level) since it doesn't need(almost) the main tools like android studio(believe us it is not that hard) which will be described later as they are the ones that makes most of the beginner people run away from android development, due its complexity and high chances of failure at the initial stage of just setting it up, locally.

links resources

- Websites
  - Official react-native documentation: https://reactnative.dev/docs/getting-started
- Youtube tutorials
  - By Hitesh Chaudhury, for complete beginners: https://youtube.com/playlist?list=PLRAV69dS1uWSjBBJ-egNNOd4mdblt1P4c&si=HLb5YijiESkXsUnH
  - By JavaScript Mastery, building and deploying on the web: https://youtu.be/mJ3bGvy0WAY?si=gJX_fvMPGg8XsAA6
  - By freeCodeCamp: https://youtu.be/obH0Po_RdWk?si=CV8kyd-JPw-YyAOJ

#### Flutter framework using the Dart language

Flutter – a revolutionary framework for crafting stunning, natively compiled applications for mobile, web, and desktop from a single codebase. Flutter employs Dart as its programming language, offering a delightful experience for developers with its simplicity and versatility. What sets Flutter apart is its hot reload feature, allowing you to see changes instantly and iterate on your designs swiftly(Expo with react-native also has that). With a rich set of pre-designed widgets, you can build beautiful and responsive user interfaces, while the reactive framework ensures a smooth and seamless user experience. What makes Flutter truly exceptional is its cross-platform capability. Your Flutter codebase becomes a powerhouse, enabling you to deploy your app not only on Android and iOS but also on the web and desktop platforms. Whether you're a seasoned developer or just starting, Flutter's ease of use and cross-platform potential make it an exciting and powerful tool for bringing your app ideas to life.

links resources

- Websites
  - Official flutter documentation: https://docs.flutter.dev/
  - Official dart documentation: https://dart.dev/guides since dart is the language you will code in
- Youtube tutorials
  - by Rivaan Ranawat https://youtu.be/CzRQ9mnmh44?si=vheQVSZIos9q_x1Z
  - freeCodeCamp - https://youtu.be/VPvVD8t02U8?si=mcmQbibhK1_A1fLj
  - and more on youtube

---

### The fundamentals

1. **Android Studio - Your Development Environment**

- _Introduction to Android Studio:_

  - Android Studio is the official integrated development environment (IDE) for Android app development, made by Google itself. It provides tools for designing, coding, testing, and debugging your applications.

- _Installation:_

  - "[Download Android Studio](https://developer.android.com/studio) and follow the installation instructions for your operating system. Android Studio includes the Android SDK (Software Development Kit) necessary for building Android apps."

- some resources on how to setup android studio
  - Stack Overflow: Find solutions to specific problems you encounter during setup: https://stackoverflow.com/questions/tagged/android
  - Interactive Tutorials:
    - Google Codelabs: Choose from different codelabs focusing on specific aspects of setting up Android Studio, like installing the SDK or configuring Kotlin/Java: https://developer.android.com/get-started/codelabs
    - Udacity Basic Android App in Kotlin: This beginner-friendly course guides you through building your first app while covering the setup process: https://www.udacity.com/course/android-kotlin-developer-nanodegree--nd940
  - Video Tutorials:
    - Newboston Android Studio Installation: Watch a clear and concise video guide on installing and setting up Android Studio: https://www.youtube.com/watch?v=SLNTnJkg6EE
    - CodingWithMitch Android Studio Setup: Follow along with Mitch's detailed video tutorial covering various settings and configurations: https://m.youtube.com/watch?v=qzcGfN9S_QY

---

**Slide 8: Introduction to Android Resources**

- _Official Android Documentation:_

  - "[Android Developer Documentation](https://developer.android.com/docs) - The official documentation provides in-depth guides, reference materials, and tutorials for all aspects of Android development."
  - _Codecademy:_
    - "[Codecademy Android Courses](https://www.codecademy.com/learn/learn-android) - Codecademy offers interactive courses to learn Android development through hands-on coding exercises."
  - Also follow the above links that goes with the keyword android, they also have great amount of information

- _Emulator and Real Devices:_
  - "Explore testing your app on both emulators and real Android devices. Understand the advantages and limitations of each testing environment."
- _Debugging Tools:_
  - "Learn to use Android Studio's debugging tools to identify and fix issues in your code. Utilize breakpoints, watches, and logs to troubleshoot problems."

2. Basics of Kotlin or Java & Basics of OOP

#### **Java:**

- **Official Tutorials:**

  - **The Java Tutorials:** Official Oracle Java tutorial site: [https://docs.oracle.com/javase/tutorial/](https://docs.oracle.com/javase/tutorial/)- Comprehensive tutorials on all aspects of Java, from basic syntax to advanced features.
  - [https://docs.oracle.com/cd/E26537_01/tutorial/java/TOC.html](https://docs.oracle.com/cd/E26537_01/tutorial/java/TOC.html) - Interactive learning trails with hands-on exercises and quizzes.

- **Books:**

  - "Head First Java" by Kathy Sierra and Bert Bates - A beginner-friendly guide with a visual approach.
  - "Effective Java" by Joshua Bloch - Best practices and coding guidelines for writing clean and efficient Java code.

- **YouTube Channels:**

  - **Newboston Java Tutorials:** Easy-to-follow video tutorials: [https://www.youtube.com/watch?v=Hl-zzrqQoSE](https://www.youtube.com/watch?v=Hl-zzrqQoSE) (too old but is okay)
  - [https://m.youtube.com/watch?v=n-xAqcBCws4](https://m.youtube.com/watch?v=n-xAqcBCws4) - Derek Banas - Clear and concise explanations of Java concepts, perfect for beginners.
  - from WsCubeTech: https://youtube.com/playlist?list=PLjVLYmrlmjGdDps6HAwOOVoAtBPAgIOXL&si=bQsdID_nBw9pzQuX
  - CodeWithHarry java playlist: https://youtube.com/playlist?list=PLu0W_9lII9agS67Uits0UnJyrYiXhDS6q&si=azI-40a2g2wJcN9T
  - BroCode java playlist: https://youtu.be/xk4_1vDrzzo?si=6HMf3ktR6Kwup9fp

- **Websites:**

  - [https://www.javatpoint.com/](https://www.javatpoint.com/) - JavaTPoint - Extensive collection of Java tutorials, examples, and quizzes.

  - **Codecademy:** Interactive Java course with coding challenges: [https://www.codecademy.com/learn/learn-java](https://www.codecademy.com/learn/learn-java)
  - **Udacity Intro to Java Programming:** [https://www.udacity.com/course/java-programming-basics--ud282](https://www.udacity.com/course/java-programming-basics--ud282)

#### **Kotlin:**

- **Official Documentation:**

  - [https://kotlinlang.org/](https://kotlinlang.org/) - Get started with Kotlin programming, including tutorials, documentation, and references.
  - [https://kotlinlang.org/docs/home.html](https://kotlinlang.org/docs/home.html) - Comprehensive Kotlin documentation with detailed explanations and examples.

  - **JetBrains Tutorials:** Official Kotlin tutorials from the developers: [https://kotlinlang.org/docs/getting-started.html](https://kotlinlang.org/docs/getting-started.html)
  - **Google Kotlin Basics:** Interactive course from Google: [https://developer.android.com/kotlin/campaign/learn](https://developer.android.com/kotlin/campaign/learn)

- **Books:**

  - "Kotlin in Action" by Charles Severance - A practical guide to Kotlin programming with real-world examples.
  - "Head First Kotlin" by Dawn Griffiths and David Griffiths - A beginner-friendly introduction to Kotlin with a visual approach.

- **YouTube Channels:**

  - [https://www.youtube.com/watch?v=gN-0MnN9YsU](https://www.youtube.com/watch?v=gN-0MnN9YsU) - The Net Ninja - High-quality tutorials and courses on Kotlin, including Android development.
  - [https://www.youtube.com/user/androiddevelopers](https://www.youtube.com/user/androiddevelopers) - Android Developers - Official channel with Kotlin tutorials and talks related to Android development.
  - **CodingWithMitch Kotlin Tutorials:** Comprehensive video tutorials: [https://m.youtube.com/watch?v=BCSlZIUj18Y](https://m.youtube.com/watch?v=BCSlZIUj18Y)
  - freecodecamp kotlin tutorial: https://youtu.be/EExSSotojVI?si=ujJ1aBrr2kwwKfu3

* **Websites:**
  - [https://kotlinlang.org/docs/getting-started.html](https://kotlinlang.org/docs/getting-started.html) - Interactive Kotlin tutorials from the official website, covering various topics.
  - [https://www.codewars.com/](https://www.codewars.com/) - Codewars - Practice your Kotlin skills with coding challenges and compete with other developers.
  - **Udacity Kotlin Bootcamp for Programmers:** Structured learning path for experienced developers: [https://www.udacity.com/course/android-kotlin-developer-nanodegree--nd940](https://www.udacity.com/course/android-kotlin-developer-nanodegree--nd940)

**XML:**

- **Android Developer Guide:** Official documentation on XML for Android: [https://developer.android.com/guide/topics/resources/more-resources](https://developer.android.com/guide/topics/resources/more-resources)
- **XML Tutorial:** Easy-to-understand beginner's guide: [https://www.w3schools.com/xml/](https://www.w3schools.com/xml/)
- **Udacity Android Kotlin Development:** Learn XML basics within the context of Android development: [https://www.udacity.com/course/android-kotlin-developer-nanodegree--nd940](https://www.udacity.com/course/android-kotlin-developer-nanodegree--nd940)
- **CodingWithMitch Android Layout XML Tutorials:** Video tutorials on building layouts with XML: [https://www.youtube.com/user/YouTube/playlists](https://www.youtube.com/user/YouTube/playlists)

**Additional Resources:**

- **Android Developers website:** Official resource for all things Android development: [https://developer.android.com/](https://developer.android.com/)
- **Stack Overflow:** Q&A forum for developers, great for getting help with specific problems: [https://stackoverflow.com/](https://stackoverflow.com/)
- **Pluralsight:** Free trial access to video courses on various programming topics, including Android development: [https://www.pluralsight.com/](https://www.pluralsight.com/)
- **Online Courses:**

  - [https://www.coursera.org/](https://www.coursera.org/) - Coursera offers various free and paid online courses on Java and Kotlin.
  - [https://www.edx.org/](https://www.edx.org/) - edX also offers free and paid online courses on Java and Kotlin from top universities and institutions.

- **Communities and Forums:**

  - Stack Overflow - Ask questions and get help from experienced Java and Kotlin developers.
  - Reddit communities like r/java and r/Kotlin - Connect with other developers and learn from their experiences.

- **YouTube channels:**
  - Android Developers:\*\* [https://www.youtube.com/user/androiddevelopers](https://www.youtube.com/user/androiddevelopers)
  - Newboston:\*\* [https://www.youtube.com/playlist?list=PLEA1FEF17E1E5C0DA](https://www.youtube.com/playlist?list=PLEA1FEF17E1E5C0DA)
  - CodingWithMitch:\*\* [https://www.youtube.com/channel/UCoNZZLhPuuRteu02rh7bzsw](https://www.youtube.com/channel/UCoNZZLhPuuRteu02rh7bzsw)

**Tips:**

- Start with the basics and gradually build your knowledge.
- Practice regularly by coding projects.
- Don't be afraid to ask for help online in forums or communities.
- Have fun and enjoy the learning process!

Remember, the best resources are the ones that work best for you. Try out different resources and find the ones that fit your learning style and pace. Good luck with your Android development journey!

3. Data Structures and Algorithms:
   In Android, data structures are primarily used to collect, organize and perform operations on the stored data more effectively. They are essential for designing advanced-level Android applications. Examples include Array, Linked List, Stack, Queue, Hash Map, and Tree.

Meanwhile, algorithms are a sequence of instructions or rules for performing a particular task. In Android, algorithms can be used for data searching, sorting, or performing complex business logic. Some commonly used algorithms are Binary Search, Bubble Sort, Selection Sort, etc. A deep understanding of data structures and algorithms is crucial in optimizing the performance and the memory consumption of the Android applications.

4. What is and how to use Gradle?:

Using Gradle: Gradle is a powerful build system used in Android development that allows you to define your project and dependencies, and distinguish between different build types and flavors. Gradle uses a domain-specific language (DSL) which gives developers almost complete control over the build process. When you trigger a build in Android Studio, Gradle is the tool working behind the scenes to compile and package your app. It looks at the dependencies you declared in your build.gradle files and creates a build script accordingly. Using Gradle in android development requires continuous editing of the build.gradle files to manage app dependencies, build variants, signing configurations and other essential aspects related to building your app.

5. Create a basic Hello World App

Now you are good to make a basic Hello World app, yes it needs a lot of things to be covered before actually making a hello world app, and hence the entry barrier is high, developers are low and hence the pay is also high. The “Hello World” app is a simple project that you can build when you’re getting started with Android development. It’s often the first program that beginners learn to build in a new system. It’s usually considered the simplest form of program that displays a message to the user - “Hello, World!” In Android, this involves creating a new project from the Android Studio and setting up the main activity. The main activity file is primarily written in Java or Kotlin where you can code for the display message, while the layout design view can be created in the XML file.

---

### Version Control with Git and GitHub

Version Control is a system that records changes to a file or set of files over time so that you can recall specific versions later. An essential tool for software development, it helps to track changes, enhance collaboration, and manage different versions of a project. Two common types of version control systems are Centralized Version Control System (CVCS) and Distributed Version Control System (DVCS). CVCS uses a central server to store all versions of a project, with users getting snapshots from that server. Examples include SVN and Perforce. On the other hand, DVCS allows multiple developers to work on a single project simultaneously. Each user has a complete backup of all versions of the work. Examples include Git and Mercurial.

#### Git

Git is a highly efficient and flexible distributed version control system that was created by Linus Torvalds, the creator of Linux. It allows multiple developers to work on a project concurrently, providing tools for non-linear development and tracking changes in any set of files. Git has a local repository with a complete history and version-tracking capabilities, allowing offline operations, unlike SVN. It ensures data integrity and provides strong support for non-linear development with features such as branching and merging. Yet, Git has a high learning curve and can be complex for beginners to understand the command line interface. Furthermore, Git also allows you to create tags to reference certain points in your history for milestone or version releases.

#### GitHub

GitHub is a cloud-based hosting service for managing software version control using Git. It provides a platform for enabling multiple developers to work together on the same project at the same time. With GitHub, codes can be stored publicly, allowing for collaboration with other developers or privately for individual projects. Key features of GitHub include code sharing, task management, and version control, among others. GitHub also offers functionalities such as bug tracking, feature requests, and task management for the project. For Android development, it supports Gradle-based android projects, plugins for Android Studio and JetBrains IntelliJ IDEA, making version control operations more user-friendly.

### Developing & Publishing Your App

- Development
  - App Ideas and User Focus: - Brainstorm app ideas, identify target users, and understand their needs – this will be your guiding light throughout development.
    - Resource: https://developer.android.com/guide/components/fundamentals - Official documentation on Android app components. - User Interface (UI) Design: ✨ - Learn the basics of UI design principles like Material Design, layout components like buttons and text views, and how to bring your app to life visually.
    - Resource: https://m3.material.io/ - Google's Material Design guidelines for beautiful and consistent UI experiences.
  - Building Interactivity: - Add functionality to your app with event listeners, data manipulation, and basic programming concepts like variables and loops. - Resource: https://m.youtube.com/watch?v=FjrKMcnKahY - Build your first Android app in Kotlin or Java with this interactive tutorial.
- **Publishing**

  - _Google Play Console:_
    - [Google Play Console](https://play.google.com/apps/publish) - The Google Play Console is the platform where developers manage and publish their Android apps. Use it to upload app versions, track performance, and engage with users.
    - "Understand the process of distributing your app to users. Learn about different distribution channels, with a focus on publishing your app on the Google Play Store."

- more resources
- Udacity Nanodegree Programs: https://www.udacity.com/course/android-kotlin-developer-nanodegree--nd940 - Structured learning paths with projects and mentorship, ideal for serious learners.
- YouTube Channels:
  - https://www.youtube.com/watch?v=QAbQgLGKd3Y - Newboston - Beginner-friendly tutorials on various Android development topics.
  - https://www.youtube.com/user/androiddevelopers - Android Developers - Official channel with talks, tutorials, and live coding sessions.
  - freecodecamp: https://youtu.be/fis26HvvDII?si=EDumFbXrWW-htBjg
  - more freecodecamp: https://youtu.be/fis26HvvDII?si=Z6ipNXA2CCKxqCbW
  - CodeWithHarry: https://youtu.be/mXjZQX3UzOs?si=CavQITfTGbDtMqz8
  - another freecodecamp android dev tutorial by Rahul Pandey with publishing to the play store: https://youtu.be/FjrKMcnKahY?si=Sa57Kpi0OJMGZR1z
- Communities and Forums:
  - Stack Overflow - Ask questions and get help from experienced developers.
  - Reddit's r/androiddev community - Connect with other Android developers and learn from their experiences.

Remember, Android development is a journey, not a destination. Embrace the learning process, don't be afraid to experiment, and most importantly, have fun creating!

---

### Next Steps and Advanced Topics

- _Advanced Topics:_

  - "Explore advanced Android development topics, such as working with databases, implementing networking, integrating third-party libraries, and incorporating advanced UI features."

- _Udacity Android Development Nanodegree:_

  - "[Android Developer Nanodegree](https://www.udacity.com/course/android-developer-nanodegree-by-google) - Udacity offers a comprehensive program developed by Google to master Android development. It covers advanced topics and provides real-world project experiences."

    Going Further:

- Advanced Topics: - Once you've mastered the basics, delve deeper into more advanced concepts like databases, networking, sensors, and security.

  - Resource: https://developer.android.com/guide - Comprehensive developer guides on various Android features and APIs.
    Testing and Deployment: - Learn how to test your app for bugs and functionality, and prepare it for publishing on the Google Play Store.
  - Resource: https://developer.android.com/studio/test - Official documentation on testing and debugging Android apps.
    Bonus Resources:

---

### Conclusion

- _Celebrating Your Achievement:_
  - "Congratulations on taking your first steps into Android development! With the skills you've gained, you're now equipped to build, test, and publish your own mobile apps. Keep coding, keep learning, and welcome to the exciting world of Android development!"

---
