# ADR Template

Use this template to create new Architectural Decision Records.

---

## File Naming Convention

```
docs/adr/
├── 0001-record-architecture-decisions.md
├── 0002-use-postgresql-for-database.md
├── 0003-adopt-microservices-architecture.md
└── ...
```

---

## Template

```markdown
# ADR-NNNN: [Short Title of Decision]

## Status

[Proposed | Accepted | Deprecated | Superseded by ADR-XXXX]

## Date

YYYY-MM-DD

## Context

[Describe the issue or situation that motivates this decision.
What is the problem we are trying to solve?
What constraints do we have?]

## Decision

[Describe the decision and the reasoning behind it.
Be specific about what will be done.
Use active voice: "We will..." not "It was decided..."]

## Consequences

### Positive
- [What becomes easier?]
- [What improves?]

### Negative
- [What becomes harder?]
- [What trade-offs are we accepting?]

### Neutral
- [Other notable effects]

## Alternatives Considered

### [Alternative 1]
[Why was it rejected?]

### [Alternative 2]
[Why was it rejected?]

## References

- [Links to relevant documentation, RFCs, discussions]
```

---

## Example ADR

```markdown
# ADR-0001: Record Architecture Decisions

## Status

Accepted

## Date

2026-01-15

## Context

We need to record the architectural decisions made on this project.
These decisions affect the structure of the codebase and are often
made through informal discussions, leading to:
- Lost context when team members leave
- Repeated debates about the same topics
- Difficulty understanding why the system evolved the way it did

## Decision

We will use Architecture Decision Records (ADRs) as described by
Michael Nygard in his article "Documenting Architecture Decisions".

ADRs will be:
- Stored in `docs/adr/` directory
- Numbered sequentially (0001, 0002, ...)
- Written in Markdown format
- Reviewed as part of pull requests

## Consequences

### Positive
- Decisions are documented and searchable
- New team members can understand the "why" behind architecture
- Reduces repeated discussions about past decisions

### Negative
- Requires discipline to write ADRs consistently
- Small overhead for each significant decision

### Neutral
- ADRs become part of our code review process

## References

- https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions
- https://adr.github.io/
```

---

## Tips for Writing Good ADRs

1. **Keep them short** - 1-2 pages maximum
2. **Write them at decision time** - Not weeks later when you've forgotten the context
3. **Include alternatives** - Show you considered other options
4. **Be honest about trade-offs** - Every decision has downsides
5. **Link related ADRs** - Decisions often build on each other
6. **Don't edit old ADRs** - Write new ones that supersede

---

## Useful Commands (adr-tools)

```bash
# Install adr-tools (macOS)
brew install adr-tools

# Initialize ADR directory
adr init docs/adr

# Create new ADR
adr new "Use PostgreSQL for primary database"

# List all ADRs
adr list

# Generate table of contents
adr generate toc > docs/adr/README.md

# Link ADRs (e.g., ADR 5 supersedes ADR 3)
adr link 5 Supersedes 3 "Superseded by"
```
