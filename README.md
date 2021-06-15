📱💻🖥❤️🖥💻📱

# SwiftUI-UI-Testing

This project aims to demonstrate how to write automated UI tests for SwiftUI components.


Writing good UI testing code is hardly different from writing good software in general: Learn from the past, follow SOLID principles, and read Robert Martin’s [Clean Code](https://sites.google.com/site/unclebobconsultingllc/books). 

![alt text](https://github.com/burhanaras/SwiftUI-UI-Testing/raw/main/Screenshots/screen.gif "SwiftUI Automated UI Testing")

## Understanding Best Practices for Testing
The acronym FIRST describes a concise set of criteria for effective unit tests. Those criteria are:

- **Fast:** Tests should run quickly.
- **Independent/Isolated:** Tests shouldn’t share state with each other.
- **Repeatable:** You should obtain the same results every time you run a test. External data providers or concurrency issues could cause intermittent failures.
- **Self-validating:** Tests should be fully automated. The output should be either “pass” or “fail”, rather than relying on a programmer’s interpretation of a log file.
- **Timely:** Ideally, you should write your tests before writing the production code they test. This is known as test-driven development.

Following the FIRST principles will keep your tests clear and helpful, instead of turning into roadblocks for your app.

## Given-When-Then Style
The essential idea is to break down writing a scenario (or test) into three sections:
- The **GIVEN** part describes the state of the world before you begin the behavior you're specifying in this scenario. You can think of it as the pre-conditions to the test.
- The **WHEN** section is that behavior that you're specifying.
- Finally the **THEN** section describes the changes you expect due to the specified behavior.
