/*
 * Simple Structurizr DSL Example
 *
 * Perfect for live demo - easy to modify and show changes
 * Start with this, then add complexity
 */

workspace "My System" "A simple example for demo purposes" {

    model {
        user = person "User" "A user of the system"

        system = softwareSystem "My System" "Does something useful" {
            webApp = container "Web App" "The frontend" "React"
            api = container "API" "Backend services" "Spring Boot"
            db = container "Database" "Stores data" "PostgreSQL"
        }

        # Relationships
        user -> webApp "Uses"
        webApp -> api "Calls" "REST/JSON"
        api -> db "Reads/Writes" "JDBC"
    }

    views {
        systemContext system "Context" {
            include *
            autoLayout
        }

        container system "Containers" {
            include *
            autoLayout
        }

        styles {
            element "Person" {
                shape Person
                background #08427b
                color #ffffff
            }
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
        }
    }
}
