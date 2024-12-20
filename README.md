# Module 01: Container, Dependency, and IoC

This repository demonstrates the concepts and answers related to **Module 01: Container, Dependency, and IoC** of the Spring Professional Certification study guide. It explains the foundational principles of Spring's core features, including Dependency Injection, the ApplicationContext, and bean lifecycle management.

Each section corresponds to a key question from the study guide, providing practical implementations to help deepen understanding.

---

## Topics Covered

1. **Dependency Injection**
    - Types: Constructor, Setter, and Interface Injection
    - Advantages:
        - Improved code readability, testability, and maintainability
        - Reduced coupling and increased cohesion

2. **Design Patterns and Anti-patterns**
    - Examples of patterns (Factory, Builder, etc.) and anti-patterns (God Object, Circular Dependency, etc.)
    - Dependency Injection as a design pattern.

3. **Interfaces**
    - Their use in Java and Spring for decoupling, contract enforcement, and dynamic proxies.

4. **ApplicationContext**
    - Role in managing beans and their lifecycle.

5. **Spring Container**
    - Lifecycle:
        - Create configuration
        - Process bean definitions
        - Instantiate beans
        - Configure dependencies
        - Invoke lifecycle callbacks

6. **Creating an ApplicationContext**
    - Methods:
        - For non-web: `AnnotationConfigApplicationContext`, `ClassPathXmlApplicationContext`
        - For web: `AnnotationConfigWebApplicationContext`, `XmlWebApplicationContext`
        - Using Spring Boot: `SpringApplication`

7. **Bean Lifecycle in ApplicationContext**
    - Stages:
        - Pre-initialization: Bean creation, property setting
        - Initialization: `@PostConstruct`, `InitializingBean`, `@Bean(initMethod)`
        - Post-initialization: Ready for use
        - Destruction: `@PreDestroy`, `DisposableBean`, `@Bean(destroyMethod)`

8. **Integration Testing with Spring**
    - Setting up an ApplicationContext for tests with `@ContextConfiguration`.

9. **Preferred Way to Close an ApplicationContext**
    - Standalone applications: `registerShutdownHook`
    - Spring Boot: Automatic context management.

10. **Dependency Injection Techniques**
    - Java configuration, annotations (`@Component`, `@Autowired`), and component scanning (`@ComponentScan`).

11. **Bean Scopes**
    - Singleton (default), Prototype, Request, Session, Application, and WebSocket.

---

## Project Structure

```
src/main/java
├── config
│   ├── ApplicationConfiguration.java    # Java-based bean configuration
├── lifecycle
│   ├── CustomBeanPostProcessor.java     # Post-processor for beans
│   ├── CustomBeanFactoryPostProcessor.java  # Post-processor for factory
├── model
│   ├── ExampleBean.java                 # Bean for lifecycle and DI demo
├── service
│   ├── GreetingService.java             # Service demonstrating DI
├── App.java                             # Main entry point
src/main/resources
├── application.properties               # Property file for @Value examples
```

---

## How to Run

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd Module01-Container-Dependency-IoC
   ```

2. Build the project:
   ```bash
   mvn clean install
   ```

3. Run the application:
   ```bash
   mvn spring-boot:run
   ```

---
# Module 01: Container, Dependency, and IoC

This repository demonstrates the concepts and answers related to **Module 01: Container, Dependency, and IoC** of the Spring Professional Certification study guide.

## Other Modules in This Series
- **Module 01** - Container, Dependency, and IoC
- **Module 02** - Aspect Oriented Programming
- **Module 03** - Data Management: JDBC, Transactions, JPA, Spring Data
- **Module 04** - Spring Boot
- **Module 05** - Spring MVC and The Web Layer
- **Module 06** - Security
- **Module 07** - REST
- **Module 08** - Testing

## About Module 01
Here in **Module 01**, we explain the foundational principles of Spring's core features, including:
- Dependency Injection
- The ApplicationContext
- Bean lifecycle management

Each section corresponds to a key question from the study guide, providing practical implementations to help deepen understanding.

---

## Topics Covered

1. **Dependency Injection**
   - Types: Constructor, Setter, and Interface Injection
   - Advantages:
      - Improved code readability, testability, and maintainability
      - Reduced coupling and increased cohesion

2. **Design Patterns and Anti-patterns**
   - Examples of patterns (Factory, Builder, Observer, Strategy, Adapter, Decorator etc.) and anti-patterns (God Object, Circular Dependency, etc.)
   - Dependency Injection as a design pattern.

3. **Interfaces**
   - Their use in Java and Spring for decoupling, contract enforcement, and dynamic proxies.

4. **ApplicationContext**
   - Role in managing beans and their lifecycle.

5. **Spring Container**
   - Lifecycle:
      - Create configuration
      - Process bean definitions
      - Instantiate beans
      - Configure dependencies
      - Invoke lifecycle callbacks

6. **Creating an ApplicationContext**
   - Methods:
      - For non-web: `AnnotationConfigApplicationContext`, `ClassPathXmlApplicationContext`
      - For web: `AnnotationConfigWebApplicationContext`, `XmlWebApplicationContext`
      - Using Spring Boot: `SpringApplication`

7. **Bean Lifecycle in ApplicationContext**
   - Stages:
      - Pre-initialization: Bean creation, property setting
      - Initialization: `@PostConstruct`, `InitializingBean`, `@Bean(initMethod)`
      - Post-initialization: Ready for use
      - Destruction: `@PreDestroy`, `DisposableBean`, `@Bean(destroyMethod)`

8. **Integration Testing with Spring**
   - Setting up an ApplicationContext for tests with `@ContextConfiguration`.

9. **Preferred Way to Close an ApplicationContext**
   - Standalone applications: `registerShutdownHook`
   - Spring Boot: Automatic context management.

10. **Dependency Injection Techniques**
   - Java configuration, annotations (`@Component`, `@Autowired`), and component scanning (`@ComponentScan`).

11. **Bean Scopes**
   - Singleton (default), Prototype, Request, Session, Application, and WebSocket.

---

## Project Structure

```
src/main/java
├── config
│   ├── ApplicationConfiguration.java    # Java-based bean configuration
├── lifecycle
│   ├── CustomBeanPostProcessor.java     # Post-processor for beans
│   ├── CustomBeanFactoryPostProcessor.java  # Post-processor for factory
├── model
│   ├── ExampleBean.java                 # Bean for lifecycle and DI demo
├── service
│   ├── GreetingService.java             # Service demonstrating DI
├── App.java                             # Main entry point
src/main/resources
├── application.properties               # Property file for @Value examples
```

---

## How to Run

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd Module01-Container-Dependency-IoC
   ```

2. Build the project:
   ```bash
   mvn clean install
   ```

3. Run the application:
   ```bash
   mvn spring-boot:run
   ```

---

## Questions and Answers with Code Snippets

### 1. What is Dependency Injection and what are its advantages?

Dependency Injection (DI) is a design pattern where objects do not create their dependencies themselves. Instead, dependencies are provided externally.

**Advantages:**
- **Reusability:** Promotes the reuse of code components.
- **Readability:** Simplifies the understanding of object relationships.
- **Maintainability:** Decouples objects, making it easier to modify or replace components.
- **Testability:** Simplifies testing by allowing mock dependencies to be injected.
- **Reduced Coupling:** Objects depend on abstractions rather than concrete implementations.
- **Increased Cohesion:** Classes focus only on their core responsibilities.

**Example:** Constructor Injection:
```java
@Component
public class GreetingService {
    private final MessageService messageService;

    @Autowired
    public GreetingService(MessageService messageService) {
        this.messageService = messageService;
    }

    public void greet() {
        System.out.println(messageService.getMessage());
    }
}
```

---

### 2. What is a pattern? What is an anti-pattern? Is Dependency Injection a pattern?

- **Pattern:** A reusable solution to a common design problem, e.g., Factory, Singleton, and Builder.
- **Anti-pattern:** An ineffective and counterproductive design solution, e.g., God Object, Circular Dependency.
- **DI as a Pattern:** Dependency Injection is a design pattern that solves the problem of flexible dependency creation.

**Example:** Factory Pattern:
```java
public class MessageFactory {
    public static MessageService createMessageService() {
        return new SimpleMessageService();
    }
}
```

---

### 3. What is an interface and what are the advantages of making use of them in Java? Why are they recommended for Spring beans?

- **Interface (Java):** A reference type that contains abstract methods and can include constants, default methods, static methods, and nested types.

**Advantages of Interfaces in Java:**
- Decouples contract from implementation.
- Enables polymorphism and interchangeability.
- Facilitates unit testing.

**Advantages of Interfaces in Spring:**
- Enables the use of dynamic proxies.
- Hides implementation details.
- Allows easy switching of bean implementations.

**Example:**
```java
public interface MessageService {
    String getMessage();
}

@Component
public class SimpleMessageService implements MessageService {
    @Override
    public String getMessage() {
        return "Hello, Spring!";
    }
}
```

---

### 4. What is meant by ApplicationContext?

The `ApplicationContext` is the core of the Spring container. It manages beans and their lifecycle, resolving dependencies and configuration.

**Capabilities:**
- Initializes, configures, and assembles beans.
- Manages bean lifecycle.
- Acts as a resource loader and event broadcaster.

**Types:**
- `AnnotationConfigApplicationContext`
- `AnnotationConfigWebApplicationContext`
- `ClassPathXmlApplicationContext`
- `FileSystemXmlApplicationContext`

**Example:**
```java
AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
MessageService messageService = context.getBean(MessageService.class);
System.out.println(messageService.getMessage());
context.close();
```

---

### 5. What is the concept of a "container" and what is its lifecycle?

A container is an execution environment for managing beans and their dependencies.

**Spring Container Lifecycle:**
1. Configuration is read.
2. Bean definitions are processed.
3. Beans are instantiated and configured.
4. Dependencies are injected.
5. Pre- and post-initialization callbacks are executed.
6. Application runs.
7. Shutdown hooks and destruction callbacks are invoked.

**Example:**
```java
@Configuration
public class AppConfig {
    @Bean
    public MessageService messageService() {
        return new SimpleMessageService();
    }
}
```

---

### 6. How are you going to create a new instance of an ApplicationContext?

**Non-Web Applications:**
- `AnnotationConfigApplicationContext`
- `ClassPathXmlApplicationContext`
- `FileSystemXmlApplicationContext`

**Web Applications:**
- Servlet 2: `ContextLoaderListener`, `DispatcherServlet`
- Servlet 3: `AnnotationConfigWebApplicationContext`, `XmlWebApplicationContext`

**Spring Boot Applications:**
- `SpringApplication.run()`

**Example:**
```java
AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
MessageService messageService = context.getBean(MessageService.class);
System.out.println(messageService.getMessage());
context.close();
```

---

### 7. Can you describe the lifecycle of a Spring Bean in an ApplicationContext?

1. **Context Creation:** Bean definitions are read.
2. **Pre-Initialization:**
   - `BeanFactoryPostProcessor`
3. **Initialization:**
   - Bean is instantiated.
   - Properties are set.
   - `BeanPostProcessor.postProcessBeforeInitialization`
   - `@PostConstruct`
   - `InitializingBean.afterPropertiesSet`
   - `@Bean(initMethod)`
   - `BeanPostProcessor.postProcessAfterInitialization`
4. **Destruction:**
   - `@PreDestroy`
   - `DisposableBean.destroy`
   - `@Bean(destroyMethod)`

**Example:**
```java
@Component
public class ExampleBean {

    @PostConstruct
    public void init() {
        System.out.println("Bean initialized");
    }

    @PreDestroy
    public void destroy() {
        System.out.println("Bean destroyed");
    }
}
```

---

### 8. How are you going to create an ApplicationContext in an integration test?

1. Add the `spring-test` dependency:
   ```xml
   <dependency>
       <groupId>org.springframework</groupId>
       <artifactId>spring-test</artifactId>
       <scope>test</scope>
   </dependency>
   ```
2. Use `@RunWith(SpringRunner.class)` and `@ContextConfiguration` annotations.

**Example:**
```java
@RunWith(SpringRunner.class)
@ContextConfiguration(classes = AppConfig.class)
public class IntegrationTest {

    @Autowired
    private MessageService messageService;

    @Test
    public void testMessage() {
        assertEquals("Hello, Spring!", messageService.getMessage());
    }
}
```

---

### 9. What is the preferred way to close an ApplicationContext? Does Spring Boot do this for you?

**Standalone Applications:**
- Use `registerShutdownHook`.
- Explicitly call `context.close()` if necessary.

**Web Applications:**
- Managed via `ContextLoaderListener`.

**Spring Boot Applications:**
- Automatically closes the ApplicationContext when the JVM shuts down.

**Example:**
```java
public static void main(String[] args) {
    ConfigurableApplicationContext context = SpringApplication.run(AppConfig.class, args);
    context.registerShutdownHook();
}
```

---

### 10. Can you describe Dependency Injection using Java configuration, annotations (`@Component`, `@Autowired`), component scanning, stereotypes, and meta-annotations?

Dependency Injection (DI) can be achieved in various ways:

1. **Java Configuration:**
   ```java
   @Configuration
   public class AppConfig {
       @Bean
       public MessageService messageService() {
           return new SimpleMessageService();
       }
   }
   ```

2. **Annotations:**
   ```java
   @Component
   public class GreetingService {
       @Autowired
       private MessageService messageService;

       public void greet() {
           System.out.println(messageService.getMessage());
       }
   }
   ```

3. **Component Scanning:**
   ```java
   @ComponentScan(basePackages = "com.example")
   public class AppConfig {}
   ```

4. **Stereotypes and Meta-Annotations:**
   - Stereotypes (`@Component`, `@Service`, `@Repository`, `@Controller`) define roles.
   - Meta-annotations (e.g., `@RestController`) combine multiple behaviors into one annotation.

---

### 11. Are beans lazily or eagerly instantiated by default? How do you alter this behavior?

**Default Behavior:**
- Singleton beans: Eager by default.
- Prototype beans: Lazy by default.

**Altering Behavior:**
- Use `@Lazy` on a specific bean or class.
- Enable lazy initialization globally using `@ComponentScan(lazyInit = true)`.

**Example:**
```java
@Lazy
@Component
public class LazyService {
    public LazyService() {
        System.out.println("LazyService initialized");
    }
}
```

---

### 12. What is a property source? How would you use `@PropertySource`?

A property source is a way to load key-value pairs into the Spring environment, typically from properties files.

**Example:**
```java
@Configuration
@PropertySource("classpath:application.properties")
public class AppConfig {
    @Value("${app.name}")
    private String appName;

    @Bean
    public AppService appService() {
        return new AppService(appName);
    }
}
```

---

### 13. What is a `BeanFactoryPostProcessor` and what is it used for? When is it invoked?

A `BeanFactoryPostProcessor` allows you to modify bean definitions before the beans are instantiated.

**Example:**
```java
@Component
public class CustomBeanFactoryPostProcessor implements BeanFactoryPostProcessor {
    @Override
    public void postProcessBeanFactory(ConfigurableListableBeanFactory beanFactory) throws BeansException {
        System.out.println("Custom processing of bean definitions");
    }
}
```

---

### 14. What is a `BeanPostProcessor` and how is it different from a `BeanFactoryPostProcessor`? When are they called?

- **`BeanFactoryPostProcessor`:** Modifies bean definitions before bean instantiation.
- **`BeanPostProcessor`:** Modifies bean instances during initialization.

**Example:**
```java
@Component
public class CustomBeanPostProcessor implements BeanPostProcessor {
    @Override
    public Object postProcessBeforeInitialization(Object bean, String beanName) throws BeansException {
        System.out.println("Before Initialization: " + beanName);
        return bean;
    }

    @Override
    public Object postProcessAfterInitialization(Object bean, String beanName) throws BeansException {
        System.out.println("After Initialization: " + beanName);
        return bean;
    }
}
```

---

### 15. What does component scanning do?

Component scanning is the process of Spring scanning the classpath for classes annotated with stereotype annotations (e.g., `@Component`, `@Service`, `@Repository`, `@Controller`) to create beans and register them in the `ApplicationContext`.

**Example:**
```java
@Configuration
@ComponentScan(basePackages = "com.example.project")
public class AppConfig {
    // Configuration class
}
```

---

### 16. What is the behavior of the `@Autowired` annotation with regards to field injection, constructor injection, and method injection?

- **Field Injection:** Injects dependencies directly into fields.
  ```java
  @Autowired
  private MyService myService;
  ```

- **Constructor Injection:** Recommended for mandatory dependencies.
  ```java
  @Autowired
  public MyComponent(MyService myService) {
      this.myService = myService;
  }
  ```

- **Method Injection:** Injects dependencies via a setter or other method.
  ```java
  @Autowired
  public void setMyService(MyService myService) {
      this.myService = myService;
  }
  ```

---

### 17. What do you have to do if you would like to inject something into a private field? How does this impact testing?

- Use `@Autowired` to inject the dependency.
  ```java
  @Autowired
  private MyService myService;
  ```
- For testing, use tools like `ReflectionTestUtils`, `@MockBean`, or `@TestPropertySource` to modify private fields.

**Example:**
```java
@RunWith(SpringRunner.class)
@ContextConfiguration(classes = AppConfig.class)
public class MyServiceTest {

    @Autowired
    private MyService myService;

    @Test
    public void testService() {
        assertNotNull(myService);
    }
}
```

---

### 18. How does the `@Qualifier` annotation complement the use of `@Autowired`?

When multiple beans of the same type exist, `@Qualifier` specifies which bean should be injected.

**Example:**
```java
@Autowired
@Qualifier("specialBean")
private MyService myService;

@Bean(name = "specialBean")
public MyService specialService() {
    return new SpecialService();
}

@Bean(name = "defaultBean")
public MyService defaultService() {
    return new DefaultService();
}
```

---
### 19. What is a proxy object, and what are the two different types of proxies Spring can create?

- **Proxy Object:** An object that adds additional behavior (e.g., logging, security) to a target object without modifying its code.

**Types of Proxies:**
1. **JDK Dynamic Proxy:** Used when the target object implements an interface.
   ```java
   @Service
   public class MyService implements MyInterface {
       public void doWork() {
           System.out.println("Work done.");
       }
   }
   ```

2. **CGLIB Proxy:** Used when the target object does not implement an interface.
   ```java
   @Service
   public class MyService {
       public void doWork() {
           System.out.println("Work done.");
       }
   }
   ```

**Limitations:**
- JDK Dynamic Proxy only works with interfaces.
- CGLIB Proxy cannot be used on `final` classes or methods.

---

### 20. What are the advantages of Java configuration? What are its limitations?

**Advantages:**
- Compile-time type safety.
- Centralized configuration.
- Easily integrated with Java-based tools and frameworks.

**Limitations:**
- Requires explicit configuration for each bean.
- Configuration class cannot be `final` or contain `final` methods due to proxying requirements.

**Example:**
```java
@Configuration
public class AppConfig {
    @Bean
    public MyService myService() {
        return new MyService();
    }
}
```

---

### 21. What does the `@Bean` annotation do?

The `@Bean` annotation indicates that a method produces a bean to be managed by the Spring container.

**Example:**
```java
@Configuration
public class AppConfig {
    @Bean
    public MyService myService() {
        return new MyService();
    }
}
```

---

### 22. What is the default bean id if you only use `@Bean`? How can you override this?

- Default bean ID is the method name.
- Override using the `name` or `value` attributes of `@Bean`.

**Example:**
```java
@Bean(name = "customBean")
public MyService myService() {
    return new MyService();
}
```

---

### 23. Why are you not allowed to annotate a final class with `@Configuration`? Why can’t `@Bean` methods be final?

- Spring uses CGLIB to subclass `@Configuration` classes and override `@Bean` methods for proxying.
- `final` methods or classes prevent subclassing and will cause Spring to throw exceptions.

---

### 24. How do you configure profiles? What are possible use cases where they might be useful?

Use `@Profile` to associate beans with specific profiles and activate them programmatically or through configuration.

**Example:**
```java
@Configuration
@Profile("dev")
public class DevConfig {
    @Bean
    public MyService myService() {
        return new DevService();
    }
}
```

**Use Cases:**
- Environment-specific beans (e.g., dev, prod, test).
- Customer-specific configurations.
- Debugging or monitoring-specific setups.

---

### 25. Can you use `@Bean` together with `@Profile`?

Yes, the `@Bean` annotation can be combined with the `@Profile` annotation to specify that a bean should only be created when a specific profile is active.

**Example:**
```java
@Configuration
public class ProfileConfig {

    @Bean
    @Profile("dev")
    public MyService devService() {
        return new DevService();
    }

    @Bean
    @Profile("prod")
    public MyService prodService() {
        return new ProdService();
    }
}
```

---

### 26. Can you use `@Component` together with `@Profile`?

Yes, you can use the `@Profile` annotation on a class annotated with `@Component` to make it active only when the specified profile is enabled.

**Example:**
```java
@Profile("dev")
@Component
public class DevComponent {
    public DevComponent() {
        System.out.println("DevComponent initialized");
    }
}
```

---

### 27. How many profiles can you have?

Spring does not impose an explicit limit on the number of profiles you can define. Profiles are stored as a `Set<String>` in the environment, and their practical limit depends on Java's memory constraints.

---

### 28. How do you inject scalar/literal values into Spring beans?

Use the `@Value` annotation to inject scalar or literal values into Spring beans.

**Example:**
```java
@Component
public class MyComponent {

    @Value("${app.name}")
    private String appName;

    @Value("42")
    private int number;

    public void printValues() {
        System.out.println("App Name: " + appName);
        System.out.println("Number: " + number);
    }
}
```

---

### 29. What is `@Value` used for?

The `@Value` annotation is used to inject:
- Simple literal values.
- Environment properties.
- Results of Spring Expression Language (SpEL) expressions.

**Example:**
```java
@Component
public class MyBean {

    @Value("#{T(Math).PI}")
    private double piValue;

    @Value("${app.version}")
    private String appVersion;

    public void display() {
        System.out.println("PI Value: " + piValue);
        System.out.println("App Version: " + appVersion);
    }
}
```

---

### 30. What is Spring Expression Language (SpEL for short)?

Spring Expression Language (SpEL) is a powerful expression language that allows querying and manipulating object graphs at runtime.

**Features:**
- Literal expressions.
- Method calls.
- Property access.
- Relational and logical operators.

**Example:**
```java
@Component
public class SpelExample {

    @Value("#{2 + 2}")
    private int sum;

    @Value("#{myBean.someProperty}")
    private String propertyValue;

    public void display() {
        System.out.println("Sum: " + sum);
        System.out.println("Property: " + propertyValue);
    }
}
```

---

### 31. What is the Environment abstraction in Spring?

The `Environment` abstraction models two key aspects of the application environment:
1. **Profiles:** Define the active and default profiles.
2. **Properties:** Provide access to key-value pairs from various sources.

**Example:**
```java
@Component
public class EnvExample {

    @Autowired
    private Environment environment;

    public void displayProperty() {
        String property = environment.getProperty("app.name");
        System.out.println("App Name: " + property);
    }
}
```

---

### 32. Where can properties in the environment come from?

Properties in the environment can come from:
- JVM system properties.
- Environment variables.
- Properties files (e.g., `application.properties`).
- Command-line arguments.
- Custom property sources.

**Example:**
```java
@PropertySource("classpath:application.properties")
@Configuration
public class AppConfig {}
```

---

### 33. What can you reference using SpEL?

SpEL allows referencing:
- Static fields and methods.
- Spring bean properties and methods.
- Variables and system properties.

**Example:**
```java
@Component
public class SpelReference {

    @Value("#{T(java.lang.Math).sqrt(16)}")
    private double squareRoot;

    @Value("#{systemProperties['java.version']}")
    private String javaVersion;

    public void display() {
        System.out.println("Square Root: " + squareRoot);
        System.out.println("Java Version: " + javaVersion);
    }
}
```

---

### 34. What is the difference between `$` and `#` in `@Value` expressions?

- **`$`:** Refers to properties in the environment (e.g., `${app.name}`).
- **`#`:** Refers to SpEL expressions (e.g., `#{T(Math).PI}`).

**Example:**
```java
@Component
public class ValueExample {

    @Value("${app.name}")
    private String appName;

    @Value("#{T(Math).PI}")
    private double pi;

    public void display() {
        System.out.println("App Name: " + appName);
        System.out.println("PI: " + pi);
    }
}
```

---

