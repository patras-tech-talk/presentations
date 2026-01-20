/*
 * Structurizr DSL Example - E-Commerce System
 *
 * This is a complete example demonstrating C4 model levels 1-3
 * Use this for your live demo or as a reference
 *
 * To run: docker run -it --rm -p 8080:8080 -v $(pwd):/usr/local/structurizr structurizr/lite
 * Then open: http://localhost:8080
 */

workspace "E-Commerce Platform" "Architecture documentation for Patras Tech Talk demo" {

    model {
        # People / Actors
        customer = person "Customer" "A user who browses and purchases products" "Customer"
        admin = person "Administrator" "Manages products, orders, and system configuration" "Admin"

        # External Systems
        paymentProvider = softwareSystem "Payment Gateway" "Handles credit card transactions (e.g., Stripe, PayPal)" "External"
        emailService = softwareSystem "Email Service" "Sends transactional emails (e.g., SendGrid)" "External"
        shippingProvider = softwareSystem "Shipping API" "Calculates shipping rates and tracks packages" "External"

        # Our System
        ecommerce = softwareSystem "E-Commerce Platform" "Allows customers to browse products and place orders" {

            # Containers (Level 2)
            webApp = container "Web Application" "Delivers the storefront to customers" "React, TypeScript" "Web Browser"
            adminPortal = container "Admin Portal" "Back-office management interface" "React, TypeScript" "Web Browser"

            apiGateway = container "API Gateway" "Routes requests, handles auth" "Kong / NGINX"

            productService = container "Product Service" "Manages product catalog" "Node.js, Express" {
                # Components (Level 3)
                prodController = component "Product Controller" "REST endpoints for products" "Express Router"
                prodLogic = component "Product Service" "Business logic for products" "TypeScript Class"
                prodRepository = component "Product Repository" "Data access layer" "TypeORM"
            }

            orderService = container "Order Service" "Handles order processing" "Java, Spring Boot" {
                orderController = component "Order Controller" "REST endpoints for orders" "Spring RestController"
                orderLogic = component "Order Service" "Business logic for orders" "Spring Service"
                paymentClient = component "Payment Client" "Integration with payment provider" "Feign Client"
                orderRepository = component "Order Repository" "Data access layer" "Spring Data JPA"
            }

            userService = container "User Service" "Authentication and user management" "Node.js, Express"

            messageQueue = container "Message Queue" "Async communication between services" "RabbitMQ" "Queue"

            productDb = container "Product Database" "Stores product information" "PostgreSQL" "Database"
            orderDb = container "Order Database" "Stores orders and transactions" "PostgreSQL" "Database"
            userDb = container "User Database" "Stores user accounts" "PostgreSQL" "Database"
            cache = container "Cache" "Caches frequently accessed data" "Redis" "Database"
        }

        # Relationships - Context Level
        customer -> ecommerce "Browses products and places orders"
        admin -> ecommerce "Manages products and orders"
        ecommerce -> paymentProvider "Processes payments" "HTTPS"
        ecommerce -> emailService "Sends emails" "SMTP/API"
        ecommerce -> shippingProvider "Gets shipping rates" "HTTPS"

        # Relationships - Container Level
        customer -> webApp "Uses" "HTTPS"
        admin -> adminPortal "Uses" "HTTPS"

        webApp -> apiGateway "Makes API calls" "HTTPS/JSON"
        adminPortal -> apiGateway "Makes API calls" "HTTPS/JSON"

        apiGateway -> productService "Routes requests" "HTTP"
        apiGateway -> orderService "Routes requests" "HTTP"
        apiGateway -> userService "Routes requests" "HTTP"

        productService -> productDb "Reads/Writes" "JDBC"
        productService -> cache "Caches data" "Redis Protocol"

        orderService -> orderDb "Reads/Writes" "JDBC"
        orderService -> messageQueue "Publishes events" "AMQP"
        orderService -> paymentProvider "Processes payments" "HTTPS"

        userService -> userDb "Reads/Writes" "JDBC"

        messageQueue -> emailService "Triggers emails" "AMQP"

        # Relationships - Component Level (Product Service)
        apiGateway -> prodController "Routes requests" "HTTP"
        prodController -> prodLogic "Uses"
        prodLogic -> prodRepository "Uses"
        prodRepository -> productDb "Reads/Writes" "JDBC"

        # Relationships - Component Level (Order Service)
        apiGateway -> orderController "Routes requests" "HTTP"
        orderController -> orderLogic "Uses"
        orderLogic -> paymentClient "Uses"
        orderLogic -> orderRepository "Uses"
        paymentClient -> paymentProvider "Makes API calls" "HTTPS"
        orderRepository -> orderDb "Reads/Writes" "JDBC"
    }

    views {
        # Level 1: System Context
        systemContext ecommerce "SystemContext" "System Context diagram for E-Commerce Platform" {
            include *
            autoLayout
        }

        # Level 2: Container
        container ecommerce "Containers" "Container diagram showing all services" {
            include *
            autoLayout
        }

        # Level 3: Component (Order Service)
        component orderService "OrderServiceComponents" "Component diagram for Order Service" {
            include *
            autoLayout
        }

        # Level 3: Component (Product Service)
        component productService "ProductServiceComponents" "Component diagram for Product Service" {
            include *
            autoLayout
        }

        # Styling
        styles {
            element "Person" {
                shape Person
                background #08427b
                color #ffffff
            }
            element "Customer" {
                background #08427b
            }
            element "Admin" {
                background #999999
            }
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "External" {
                background #999999
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "Web Browser" {
                shape WebBrowser
            }
            element "Database" {
                shape Cylinder
            }
            element "Queue" {
                shape Pipe
            }
            element "Component" {
                background #85bbf0
                color #000000
            }
        }
    }
}
