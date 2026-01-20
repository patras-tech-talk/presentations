# Presentation Slides

This folder contains the Marp-based presentation that can be exported to PPTX, PDF, or HTML.

## Files

- `presentation.md` - Main Marp slide deck
- `images/` - SVG visuals for the slides

## How to Export

### Option 1: Marp CLI (Recommended)

```bash
# Install Marp CLI
npm install -g @marp-team/marp-cli

# Export to PowerPoint
marp presentation.md --pptx -o presentation.pptx

# Export to PDF
marp presentation.md --pdf -o presentation.pdf

# Export to HTML
marp presentation.md -o presentation.html

# Watch mode (live preview)
marp -w presentation.md
```

### Option 2: VS Code Extension

1. Install the **Marp for VS Code** extension
2. Open `presentation.md`
3. Click the Marp icon in the top-right
4. Select "Export slide deck..."
5. Choose PPTX format

### Option 3: Marp Web

1. Go to [web.marp.app](https://web.marp.app)
2. Paste the content of `presentation.md`
3. Export as needed

## Customizing the Theme

The presentation uses a custom theme defined in the YAML frontmatter. You can modify:

- `backgroundColor` - Slide background
- `paginate` - Show page numbers
- Custom CSS in the `style` block

## Images

The SVG images are vector graphics and will scale nicely. If you need PNG versions:

```bash
# Using Inkscape
inkscape images/c4-overview.svg --export-png=images/c4-overview.png

# Or use an online converter
```

## Tips for Presenting

1. **Test the demo beforehand** - Make sure Structurizr Lite runs on your machine
2. **Have backup screenshots** - In case of technical issues
3. **Use presenter mode** - Press `P` in HTML export for speaker notes
4. **Timing** - The deck is designed for ~35-40 minutes including Q&A
