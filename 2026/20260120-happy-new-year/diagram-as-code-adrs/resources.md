# Resources

A curated list of resources for learning more about Diagram as Code and ADRs.

---

## C4 Model

### Official
- **C4 Model Website** - [c4model.com](https://c4model.com)
- **C4 Model FAQ** - [c4model.com/faq](https://c4model.com/#faq)

### Articles
- [The C4 Model for Software Architecture](https://www.infoq.com/articles/C4-architecture-model/) - InfoQ
- [Visualising software architecture with the C4 model](https://dev.to/simonbrown/visualising-software-architecture-with-the-c4-model-4d9n) - Simon Brown

### Videos
- [Visualising Software Architecture - Simon Brown](https://www.youtube.com/watch?v=GAFZcYlO5S0) - GOTO Conference
- [C4 Model Introduction](https://www.youtube.com/watch?v=x2-rSnhpw0g) - Simon Brown

---

## Structurizr

### Official
- **Structurizr Website** - [structurizr.com](https://structurizr.com)
- **Structurizr DSL Reference** - [docs.structurizr.com/dsl](https://docs.structurizr.com/dsl)
- **Structurizr Lite** (Free) - [structurizr.com/help/lite](https://structurizr.com/help/lite)

### Getting Started
```bash
# Run Structurizr Lite locally with Docker
docker run -it --rm -p 8080:8080 \
  -v $(pwd):/usr/local/structurizr \
  structurizr/lite

# Then open http://localhost:8080
```

### IDE Extensions
- **VS Code** - [Structurizr DSL extension](https://marketplace.visualstudio.com/items?itemName=ciarant.vscode-structurizr)
- **IntelliJ** - [Structurizr DSL plugin](https://plugins.jetbrains.com/plugin/20389-structurizr-dsl)

### Alternative Tools (C4-compatible)
- **PlantUML with C4** - [github.com/plantuml-stdlib/C4-PlantUML](https://github.com/plantuml-stdlib/C4-PlantUML)
- **Mermaid C4** - [mermaid.js.org](https://mermaid.js.org/syntax/c4c.html)
- **D2** - [d2lang.com](https://d2lang.com)
- **IcePanel** - [icepanel.io](https://icepanel.io) (Commercial, C4 native)

---

## Architecture Decision Records (ADRs)

### Official / Foundational
- **ADR GitHub** - [adr.github.io](https://adr.github.io)
- **Michael Nygard's Original Article** - [Documenting Architecture Decisions](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions)

### Tools
- **adr-tools** - [github.com/npryce/adr-tools](https://github.com/npryce/adr-tools)
  ```bash
  # macOS
  brew install adr-tools

  # Linux
  # Download from releases
  ```
- **Log4brains** - [github.com/thomvaill/log4brains](https://github.com/thomvaill/log4brains)
  - Web UI for browsing ADRs
  - Integrates with CI/CD
- **adr-viewer** - [github.com/mrwilson/adr-viewer](https://github.com/mrwilson/adr-viewer)

### ADR Templates
- **MADR** (Markdown ADR) - [adr.github.io/madr](https://adr.github.io/madr/)
- **Lightweight ADRs** - [thoughtworks.com/radar/techniques/lightweight-architecture-decision-records](https://www.thoughtworks.com/radar/techniques/lightweight-architecture-decision-records)

### Articles
- [ADRs at GitHub](https://github.blog/2020-08-13-why-write-adrs/) - Why GitHub uses ADRs
- [Sustainable Architectural Decisions](https://www.infoq.com/articles/sustainable-architectural-design-decisions/) - InfoQ

---

## Books

| Title | Author | Focus |
|-------|--------|-------|
| **Software Architecture for Developers** | Simon Brown | C4 Model, practical architecture |
| **Documenting Software Architectures** | Clements et al. | Comprehensive documentation guide |
| **Design It!** | Michael Keeling | Architecture decision making |
| **Just Enough Software Architecture** | George Fairbanks | Risk-driven architecture |

---

## Community

- **C4 Model Slack** - Join via c4model.com
- **Structurizr GitHub Discussions** - [github.com/structurizr](https://github.com/structurizr)
- **Reddit r/softwarearchitecture** - [reddit.com/r/softwarearchitecture](https://reddit.com/r/softwarearchitecture)

---

## Quick Reference Cheatsheet

### C4 Levels

| Level | Name | Audience | Shows |
|-------|------|----------|-------|
| 1 | Context | Everyone | System + Users + External Systems |
| 2 | Container | Technical | Applications, Databases, Services |
| 3 | Component | Developers | Internal modules of a container |
| 4 | Code | Developers | Classes, interfaces (often auto-generated) |

### ADR Statuses

| Status | Meaning |
|--------|---------|
| Proposed | Under discussion, not yet decided |
| Accepted | Decision has been made |
| Deprecated | No longer applies (system changed) |
| Superseded | Replaced by newer ADR |

### Structurizr DSL Basics

```dsl
workspace {
    model {
        # Define people
        user = person "Name" "Description"

        # Define systems
        system = softwareSystem "Name" "Description" {
            container = container "Name" "Description" "Technology"
        }

        # Define relationships
        user -> system "Action" "Protocol"
    }

    views {
        systemContext system "ViewName" {
            include *
            autoLayout
        }
    }
}
```
