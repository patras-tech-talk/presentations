# Diagram as Code and ADRs: Documenting the 'What' and 'Why'

**Presenter:** Ioannis Skitsas
**Event:** Patras Tech Talk 2026.01 [Happy New Year]
**Duration:** 30-40 minutes
**Date:** January 20, 2026

---

## Presentation Outline

### 1. Opening Hook (2 mins)

**Slide: "The Architecture Amnesia Problem"**

> *Speaker notes:*
> - Ask the audience: "Has anyone joined a project and spent days trying to figure out how things connect?"
> - Wait for hands/reactions
> - "Or maybe you've been the person who wrote the code 6 months ago and now can't remember why you made certain decisions?"

**Visual:** Side-by-side comparison
- Left: Chaotic whiteboard photo with faded markers, post-its, arrows everywhere
- Right: Clean, professional C4 context diagram

> *Speaker notes:*
> - "This is what most architecture documentation looks like... and this is what it COULD look like"
> - "Today I'll show you how to get from chaos to clarity"

---

### 2. Why Diagrams Matter in Software Architecture (5 mins)

**Slide: "Why We Need Diagrams"**

Key points:
- **Communication** - Different stakeholders need different views
  - Developers need technical details
  - Ops needs deployment architecture
  - Management needs the big picture
- **Onboarding** - New team members get up to speed faster
- **Decision making** - Visualize impact of changes before coding

> *Speaker notes:*
> - "A picture is worth a thousand lines of code"
> - Give an example: "Imagine explaining a microservices architecture in a Slack message vs showing a diagram"

**Slide: "The Problem with Traditional Diagrams"**

- Outdated the moment they're created
- Lost in Confluence, SharePoint, or someone's desktop
- Multiple versions, no single source of truth
- Created in tools that don't integrate with dev workflow

> *Speaker notes:*
> - Quote: "The map is not the territory" - Alfred Korzybski
> - "But what if our map could UPDATE itself when the territory changes?"

---

### 3. Diagram Tools Landscape (3 mins)

**Slide: "The Tools We Use"**

| Category | Tools | Pros | Cons |
|----------|-------|------|------|
| **Manual/Visual** | Visio, Draw.io, Lucidchart, Miro | Easy to use, flexible | Hard to maintain, no version control |
| **Diagram as Code** | PlantUML, Mermaid, D2, Structurizr | Version controlled, automated | Learning curve |

> *Speaker notes:*
> - "How many of you have diagrams in Draw.io or Visio?" (expect many hands)
> - "How many of those diagrams are up to date?" (expect fewer hands, laughs)

**Slide: "Why 'as Code'?"**

- **Version control** - Track changes, blame, history
- **Review process** - PRs for architecture changes
- **Automation** - Generate from code, CI/CD integration
- **Consistency** - Same notation across all diagrams
- **Collaboration** - Merge conflicts are visible

---

### 4. The C4 Model (10 mins)

**Slide: "Introducing C4"**

- Created by **Simon Brown** (author of "Software Architecture for Developers")
- C4 = **C**ontext, **C**ontainer, **C**omponent, **C**ode
- Think of it like **Google Maps for your architecture**

> *Speaker notes:*
> - "Just like Google Maps lets you zoom from country level to street level, C4 lets you zoom from system level to code level"

**Slide: "Level 1 - System Context"**

```
[Context diagram visual here]
```

- Shows your system as a black box
- Shows users and external systems
- Answers: "What is this system and who uses it?"
- **Audience:** Everyone (including non-technical stakeholders)

> *Speaker notes:*
> - "This is the 10,000 foot view"
> - "Your CEO should be able to understand this diagram"
> - Show example: E-commerce system with users, payment provider, shipping service

**Slide: "Level 2 - Container Diagram"**

```
[Container diagram visual here]
```

- Zooms into the system
- Shows applications, databases, message queues
- Answers: "What are the high-level technology decisions?"
- **Audience:** Technical people (devs, architects, ops)

> *Speaker notes:*
> - "Container here doesn't mean Docker - it means a deployable unit"
> - "Web app, mobile app, database, API - these are all containers"
> - Show example: Web app + API + Database + Redis cache

**Slide: "Level 3 - Component Diagram"**

```
[Component diagram visual here]
```

- Zooms into a single container
- Shows internal modules, services, controllers
- Answers: "How is this container organized internally?"
- **Audience:** Developers working on that container

> *Speaker notes:*
> - "Not every container needs a component diagram"
> - "Use it for complex containers where the internal structure matters"

**Slide: "Level 4 - Code Diagram"**

- UML class diagrams
- Usually auto-generated from code
- **Often skipped** - code is the truth at this level

> *Speaker notes:*
> - "Honestly, I rarely create these manually"
> - "If you need class diagrams, generate them from code"

**Slide: "C4 Key Principles"**

1. **Hierarchical abstraction** - Zoom in for more detail
2. **Notation over notation** - Boxes and arrows, not UML symbols
3. **Self-describing** - Every element has name + description
4. **Technology agnostic** - Focus on concepts, not tools

---

### 5. Documentation Maturity Model (3 mins)

**Slide: "Where Are You on the Maturity Scale?"**

| Level | Description | Characteristics |
|-------|-------------|-----------------|
| 1 | **No documentation** | "The code is the documentation" |
| 2 | **Ad-hoc** | Random wiki pages, outdated docs |
| 3 | **Structured** | Templates, standards, but manual |
| 4 | **Docs as Code** | Version controlled, reviewed |
| 5 | **Living Documentation** | Auto-generated, always current |

> *Speaker notes:*
> - "Be honest with yourselves - where is your team?"
> - "Most teams I see are at level 2 or 3"
> - "The goal is level 5 - where documentation updates itself"

**Slide: "Level 5: Living Documentation"**

- Diagrams generated from code/config
- Always reflects current state
- Single source of truth
- **C4 + Structurizr enables this!**

---

### 6. Structurizr Deep Dive (8 mins)

**Slide: "What is Structurizr?"**

- Created by Simon Brown (same person who created C4)
- **DSL** (Domain Specific Language) for defining architecture
- **Model once, view many** - One model, multiple diagrams
- Options: Structurizr Lite (free), Structurizr Cloud, On-premises

> *Speaker notes:*
> - "Think of it as the difference between drawing and describing"
> - "Instead of drawing boxes, you describe relationships"

**Slide: "Structurizr DSL Example"**

```dsl
workspace {
    model {
        user = person "User" "A customer of the bank"

        bankingSystem = softwareSystem "Internet Banking" {
            webApp = container "Web Application" "Delivers content" "React"
            api = container "API" "Handles requests" "Spring Boot"
            database = container "Database" "Stores data" "PostgreSQL"
        }

        user -> webApp "Uses" "HTTPS"
        webApp -> api "Makes API calls" "JSON/HTTPS"
        api -> database "Reads/Writes" "JDBC"
    }

    views {
        systemContext bankingSystem "Context" {
            include *
            autoLayout
        }
        container bankingSystem "Containers" {
            include *
            autoLayout
        }
    }
}
```

> *Speaker notes:*
> - Walk through the syntax
> - "Notice how readable this is - even non-technical people can understand it"
> - "One definition generates multiple diagrams"

**[LIVE DEMO SECTION]**

Demo steps:
1. Open Structurizr Lite in browser
2. Show the DSL editor
3. Make a small change (add a new container)
4. Show how both Context and Container diagrams update
5. Export as PNG/SVG

> *Speaker notes:*
> - Keep the demo simple - don't try to show everything
> - Have a backup (screenshots) in case of technical issues
> - "Let's see this in action..."

**Slide: "Structurizr Ecosystem"**

- **Structurizr Lite** - Free, runs locally via Docker
- **Structurizr Cloud** - SaaS, collaboration features
- **Structurizr CLI** - CI/CD integration
- **IDE plugins** - VS Code, IntelliJ

---

### 7. ADRs - Capturing the "Why" (6 mins)

**Slide: "The Missing Piece"**

> *Speaker notes:*
> - Transition: "C4 and Structurizr tell us WHAT we built..."
> - "But there's a crucial question they don't answer..."

**Slide: "WHY did we make those decisions?"**

Common questions that haunt teams:
- "Why didn't we use Kafka instead of RabbitMQ?"
- "Why is this a monolith and not microservices?"
- "Why PostgreSQL instead of MongoDB?"
- "Who decided to use React and can we change it?"

> *Speaker notes:*
> - "Sound familiar?"
> - "Without documentation, these decisions get re-debated every few months"

**Slide: "Introducing ADRs"**

**A**rchitectural **D**ecision **R**ecords

- Short, focused documents
- One decision per document
- Immutable once accepted (you add new ADRs, not edit old ones)
- Stored with your code (version controlled)

> *Speaker notes:*
> - "An ADR is like a git commit message for architecture decisions"
> - "Short, specific, and permanent"

**Slide: "ADR Template"**

```markdown
# ADR-001: Use PostgreSQL for primary database

## Status
Accepted

## Context
We need a relational database for our e-commerce platform.
We evaluated PostgreSQL, MySQL, and MongoDB.

## Decision
We will use PostgreSQL because:
- Strong ACID compliance for financial transactions
- Better JSON support than MySQL (for flexible product attributes)
- Team has existing expertise
- Open source with strong community

## Consequences
### Positive
- Reliable transactions for payments
- Good tooling and monitoring options

### Negative
- Team needs training on advanced features
- Slightly more complex setup than MySQL
```

> *Speaker notes:*
> - "Notice: Context explains the situation, Decision explains the choice, Consequences are honest about trade-offs"
> - "The 'Consequences' section is crucial - every decision has trade-offs"

**Slide: "When to Write an ADR?"**

Write an ADR when:
- Choosing between technologies (database, framework, language)
- Defining architectural patterns (monolith vs microservices)
- Setting coding standards that affect architecture
- Making decisions that are hard to reverse

> *Speaker notes:*
> - "Not every decision needs an ADR"
> - "If you can easily change it tomorrow, you probably don't need one"

**Slide: "ADR Tools"**

- **adr-tools** - Command line tool for managing ADRs
- **Log4brains** - Web UI for browsing ADRs
- **Just markdown files** - Simple and effective!

```bash
# Using adr-tools
adr new "Use PostgreSQL for primary database"
adr list
adr link 5 "Amends" 3
```

> *Speaker notes:*
> - "You don't need fancy tools"
> - "A folder called 'docs/adr' with numbered markdown files works great"

---

### 8. Bringing It Together (2 mins)

**Slide: "The Complete Picture"**

```
+------------------+     +------------------+
|   C4 Diagrams    |     |      ADRs        |
|                  |     |                  |
|  WHAT we built   |     |  WHY we built it |
|  (Architecture)  |     |  (Decisions)     |
+--------+---------+     +--------+---------+
         |                        |
         +------------+-----------+
                      |
              +-------v-------+
              | Version Control|
              | (Git)          |
              +---------------+
```

> *Speaker notes:*
> - "C4 shows the what, ADRs explain the why"
> - "Both live in your repo, both get reviewed in PRs"

**Slide: "The Workflow"**

1. Architect proposes change via PR
2. PR includes updated Structurizr DSL + new ADR
3. Team reviews architecture AND reasoning
4. Merge = decision is documented forever

> *Speaker notes:*
> - "This is how architecture becomes a team sport"
> - "No more 'who decided this?' - it's all in git history"

---

### 9. Call to Action & Resources (1 min)

**Slide: "Start Small"**

Today, you can:
1. Create ONE context diagram of your main system
2. Write ONE ADR for a recent decision
3. Put both in your repo

> *Speaker notes:*
> - "You don't need to boil the ocean"
> - "Start with the most important system, the most controversial decision"

**Slide: "Resources"**

- **C4 Model:** [c4model.com](https://c4model.com)
- **Structurizr:** [structurizr.com](https://structurizr.com)
- **ADR GitHub:** [adr.github.io](https://adr.github.io)
- **Simon Brown's book:** "Software Architecture for Developers"
- **This presentation:** [github.com/patras-tech-talk/presentations](https://github.com/patras-tech-talk/presentations)

**Slide: "Questions?"**

> *Speaker notes:*
> - Open floor for Q&A
> - If no questions, have a backup: "One question I often get is..."

---

## Timing Summary

| Section | Duration | Running Total |
|---------|----------|---------------|
| Opening Hook | 2 min | 2 min |
| Why Diagrams Matter | 5 min | 7 min |
| Tools Landscape | 3 min | 10 min |
| C4 Model | 10 min | 20 min |
| Documentation Maturity | 3 min | 23 min |
| Structurizr Deep Dive | 8 min | 31 min |
| ADRs | 6 min | 37 min |
| Bringing It Together | 2 min | 39 min |
| Call to Action | 1 min | 40 min |

---

## Materials Checklist

- [ ] Slides (PPT/Keynote/Google Slides)
- [ ] Structurizr Lite running locally for demo
- [ ] Backup screenshots in case demo fails
- [ ] Example DSL file ready to show
- [ ] Clicker/presenter remote
- [ ] Water bottle

## Demo Backup Plan

If Structurizr demo fails:
1. Show pre-recorded GIF of the workflow
2. Use static screenshots showing before/after
3. Share the DSL code and explain what it generates
