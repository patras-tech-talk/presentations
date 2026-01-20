/*
 * Complete C4 Model Example - All 4 Levels
 *
 * A simple blog platform demonstrating:
 * - Level 1: System Context
 * - Level 2: Container
 * - Level 3: Component
 * - Level 4: Code (Class diagram)
 *
 * To run: docker run -it --rm -p 8080:8080 -v $(pwd):/usr/local/structurizr structurizr/lite
 */

workspace "Blog Platform" "A simple blog platform demonstrating all 4 C4 levels" {

    model {
        # =====================
        # LEVEL 1: CONTEXT
        # People and external systems
        # =====================

        reader = person "Reader" "A person who reads blog posts" "Reader"
        author = person "Author" "A person who writes blog posts" "Author"

        # External systems
        emailSystem = softwareSystem "Email System" "Sends notification emails" "External"
        analyticsSystem = softwareSystem "Analytics" "Google Analytics for tracking" "External"

        # =====================
        # LEVEL 2: CONTAINERS
        # Our system and its containers
        # =====================

        blogPlatform = softwareSystem "Blog Platform" "Allows authors to publish and readers to view blog posts" {

            webApp = container "Web Application" "Serves the blog frontend" "Next.js, React" "Web Browser"

            apiServer = container "API Server" "Handles all business logic" "Node.js, Express" {

                # =====================
                # LEVEL 3: COMPONENTS
                # Inside the API Server
                # =====================

                postController = component "Post Controller" "REST API endpoints for posts" "Express Router"
                userController = component "User Controller" "REST API endpoints for users" "Express Router"
                authMiddleware = component "Auth Middleware" "JWT authentication" "Express Middleware"

                postService = component "Post Service" "Business logic for posts" "TypeScript Class"

                userService = component "User Service" "Business logic for users" "TypeScript Class"
                emailService = component "Email Service" "Sends emails via external provider" "TypeScript Class"

                postRepository = component "Post Repository" "Data access for posts" "TypeORM Repository"
                userRepository = component "User Repository" "Data access for users" "TypeORM Repository"
            }

            database = container "Database" "Stores posts, users, comments" "PostgreSQL" "Database"
            cache = container "Cache" "Caches frequently accessed posts" "Redis" "Database"
        }

        # =====================
        # RELATIONSHIPS
        # =====================

        # Context level relationships
        reader -> blogPlatform "Reads posts"
        author -> blogPlatform "Writes and publishes posts"
        blogPlatform -> emailSystem "Sends notifications"
        blogPlatform -> analyticsSystem "Sends page views"

        # Container level relationships
        reader -> webApp "Views blog" "HTTPS"
        author -> webApp "Manages posts" "HTTPS"
        webApp -> apiServer "Makes API calls" "REST/JSON"
        apiServer -> database "Reads/Writes data" "TCP/5432"
        apiServer -> cache "Caches data" "TCP/6379"
        apiServer -> emailSystem "Sends emails" "SMTP"
        webApp -> analyticsSystem "Tracks views" "HTTPS"

        # Component level relationships
        webApp -> postController "API calls" "HTTPS"
        webApp -> userController "API calls" "HTTPS"

        postController -> authMiddleware "Validates token"
        userController -> authMiddleware "Validates token"

        postController -> postService "Uses"
        userController -> userService "Uses"

        postService -> postRepository "Uses"
        postService -> emailService "Notifies subscribers"
        userService -> userRepository "Uses"

        postRepository -> database "SQL queries"
        postRepository -> cache "Cache queries"
        userRepository -> database "SQL queries"
        emailService -> emailSystem "SMTP"
    }

    views {
        # =====================
        # LEVEL 1: System Context Diagram
        # =====================
        systemContext blogPlatform "Level1_Context" "Level 1: System Context - Shows the blog platform in its environment" {
            include *
            autoLayout
        }

        # =====================
        # LEVEL 2: Container Diagram
        # =====================
        container blogPlatform "Level2_Containers" "Level 2: Containers - Shows the containers inside the blog platform" {
            include *
            autoLayout
        }

        # =====================
        # LEVEL 3: Component Diagram
        # =====================
        component apiServer "Level3_Components" "Level 3: Components - Shows the components inside the API Server" {
            include *
            autoLayout
        }

        # =====================
        # LEVEL 4: Code
        #
        # Structurizr doesn't support UML class diagrams directly.
        # Level 4 is typically:
        #   - Auto-generated from code (TypeDoc, JavaDoc, etc.)
        #   - Often skipped (code IS the documentation at this level)
        #
        # Below is a DYNAMIC VIEW showing runtime behavior -
        # the closest approximation to Level 4 in Structurizr.
        # =====================

        dynamic apiServer "Level4_CreatePost" "Sequence: Creating a new blog post" {
            webApp -> postController "POST /api/posts"
            postController -> authMiddleware "Validate JWT"
            authMiddleware -> postController "User authenticated"
            postController -> postService "createPost(data)"
            postService -> postRepository "save(post)"
            postRepository -> database "INSERT INTO posts"
            postService -> emailService "notifySubscribers(post)"
            emailService -> emailSystem "Send email"
            autoLayout
        }

        # =====================
        # STYLES
        # =====================
        styles {
            element "Person" {
                shape Person
                background #08427b
                color #ffffff
            }
            element "Reader" {
                background #08427b
            }
            element "Author" {
                background #0b5394
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
            element "Component" {
                background #85bbf0
                color #000000
            }
        }

        # Theme (optional - for nicer default styling)
        # theme default
    }
}
