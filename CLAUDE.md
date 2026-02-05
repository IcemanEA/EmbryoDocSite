# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an **Ignite static site generator** project for EmbryoDoc App (Приложение для эмбриологов и репродуктологов). Ignite is a Swift-based static site builder that uses SwiftUI-like syntax to generate HTML websites.

The project uses the [Ignite framework](https://github.com/twostraws/Ignite) to build static HTML sites with a Swift DSL. It does NOT convert SwiftUI to HTML - it provides its own SwiftUI-inspired API specifically for web development.

## Key Commands

### Building the Site
```bash
# Build the site (generates HTML in docs/ directory)
swift run
```

### Development & Preview
```bash
# Build and preview the site
swift run
ignite run --directory docs --preview

# Run local web server only (without opening browser)
ignite run --directory docs

# Specify custom port
ignite run --directory docs --port 8080 --preview
```

### Swift Package Management
```bash
# Build the Swift executable
swift build

# Run tests (if available)
swift test

# Update dependencies
swift package update

# Clean build artifacts
swift package clean
```

## Architecture

### Entry Point
- **Sources/Site.swift** - Contains the `@main` entry point (`IgniteWebsite`) and site configuration (`EmbryoDocSite`)
  - Defines site metadata: name, URL, author, title suffix
  - Registers the home page and main layout
  - Can specify `articlePages` for custom markdown layouts
  - Calls `site.publish()` to generate static HTML

### Directory Structure

1. **Sources/** - Swift source code
   - `Sources/Site.swift` - Main entry point and site configuration
   - `Sources/Pages/` - Individual page definitions (conform to `StaticPage`)
   - `Sources/Layouts/` - Page templates (conform to `Layout` or `ArticlePage`)
   - `Sources/Themes/` - Custom theme definitions (optional)
   - `Sources/Components/` - Reusable UI components (optional)

2. **Content/** - Markdown files for blog posts/articles
   - Auto-generated pages from markdown
   - Supports YAML front matter
   - Path structure: `Content/blog/post.md` → `docs/blog/index.html`
   - Requires at least one `ArticlePage` layout

3. **Assets/** - Static resources
   - `Assets/images/` - Images
   - Custom CSS, JS, fonts
   - Copied to `docs/` during generation

4. **Includes/** - Reusable HTML snippets
   - Small HTML fragments
   - Can be included in pages

5. **docs/** - Generated output for GitHub Pages (NEVER EDIT)
   - Automatically regenerated on each build
   - Configured for GitHub Pages deployment

## Site Configuration

Configure your site in `Sources/Site.swift`:

```swift
struct MySite: Site {
    // Required
    var name = "Site Name"
    var url = URL(static: "https://example.com")
    var homePage = Home()
    var layout = MainLayout()

    // Optional
    var author = "Your Name"
    var titleSuffix = " – Site Tagline"
    var builtInIconsEnabled = true

    // For markdown content
    var articlePages: [any ArticlePage] {
        CustomArticleLayout()
    }
}
```

### Build Output (GitHub Pages)

This project builds to the `docs/` folder for GitHub Pages deployment:

```swift
@main
struct IgniteWebsite {
    static func main() async {
        var site = EmbryoDocSite()

        do {
            try await site.publish(buildDirectoryPath: "docs")
        } catch {
            print(error.localizedDescription)
        }
    }
}
```

After building, preview with:
```bash
ignite run --directory docs --preview
```

## Page Types

### 1. StaticPage (Standard Pages)
```swift
import Ignite

struct Home: StaticPage {
    var title = "Home"

    var body: some HTML {
        Text("Welcome")
            .font(.title1)
    }
}
```

### 2. ArticlePage (For Markdown Content)
```swift
import Ignite

struct BlogLayout: ArticlePage {
    var body: some HTML {
        Text(article.title)
            .font(.title1)

        if let image = article.image {
            Image(image, description: article.imageDescription)
                .resizable()
                .cornerRadius(20)
                .frame(maxHeight: 300)
        }

        if let tags = article.tags {
            Text("Tagged: \(tags.joined(separator: ", "))")
        }

        Text("\(article.estimatedWordCount) words")

        Text(article.text)
    }
}
```

Article properties available:
- `article.title`, `article.text`
- `article.image`, `article.imageDescription`
- `article.tags`
- `article.estimatedWordCount`
- `article.estimatedReadingMinutes`

## Ignite Components & Elements

### Basic Elements
```swift
// Text
Text("Hello World")
    .font(.title1)
    .foregroundStyle(.secondary)

// Markdown support
Text(markdown: "Add *inline* **Markdown**")

// Links
Link("Swift", target: "https://swift.org")
    .linkStyle(.button)

Link("About", target: AboutPage())

// Images
Image("logo.jpg")
    .accessibilityLabel("Logo")
    .resizable()
    .cornerRadius(10)
    .frame(maxHeight: 300)
    .padding()

// Divider
Divider()

// Sections
Section {
    Text("Content here")
}
```

### Advanced Components
```swift
// Dropdown Menu
Dropdown("Menu") {
    Link("Home", target: "/")
    Link("About", target: AboutPage())
    Divider()
    Text("More options...")
}
.role(.primary)

// Accordion
Accordion {
    Item("Section 1") {
        Text("Content 1")
    }
    Item("Section 2") {
        Text("Content 2")
    }
}
.openMode(.individual)

// Code Blocks (syntax highlighting)
CodeBlock(language: "swift", """
func hello() {
    print("Hello World")
}
""")

// Badges
Badge("New")

// Alerts
Alert("Important message")

// Carousel
Carousel {
    Image("slide1.jpg")
    Image("slide2.jpg")
}

// Tables
Table {
    Row {
        Column { Text("Name") }
        Column { Text("Age") }
    }
}
```

### Layout Containers
```swift
// Body (main document container)
Body {
    content
}

// Container (responsive width container)
Container {
    Text("Centered content")
}

// Grid layouts (use Section with modifiers)
Section {
    // Your grid content
}
.frame(maxWidth: "1200px")
```

## Styling & Modifiers

### Typography
```swift
.font(.title1)          // Largest heading
.font(.title2)
.font(.title3)
.font(.body)
.font(.caption)
```

### Colors
```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
.foregroundStyle(.accent)
```

### Spacing & Layout
```swift
.padding()
.padding(.all, 20)
.margin()
.frame(maxWidth: 800)
.frame(maxHeight: 300)
```

### Visual Effects
```swift
.cornerRadius(10)
.resizable()
.role(.primary)         // For buttons/dropdowns
.role(.secondary)
.role(.danger)
```

### Accessibility
```swift
.accessibilityLabel("Description")
```

## Markdown Content with YAML Front Matter

Create markdown files in `Content/`:

```markdown
---
title: "Blog Post Title"
date: 2026-01-26
tags: ["swift", "web"]
image: "post-image.jpg"
imageDescription: "Post image"
---

# Your Content Here

Write your markdown content...
```

## Layouts

### Basic Layout Pattern
```swift
import Ignite

struct MainLayout: Layout {
    var body: some Document {
        Body {
            // Header/Navigation
            Section {
                Link("Home", target: "/")
                Link("About", target: AboutPage())
            }

            // Page content (injected here)
            content

            // Footer
            Section {
                Text("© 2026 Your Site")
            }
        }
    }
}
```

## Building Powerful Landing Pages

### Hero Section Example
```swift
Section {
    Text("EmbryoDoc App")
        .font(.title1)

    Text("Приложение для эмбриологов и репродуктологов")
        .font(.title2)
        .foregroundStyle(.secondary)

    Link("Download", target: "/download")
        .linkStyle(.button)
        .role(.primary)
}
.padding(.all, 60)
```

### Features Grid
```swift
Section {
    Container {
        // Feature 1
        Section {
            Image("feature1.jpg")
            Text("Feature 1").font(.title3)
            Text("Description...")
        }

        // Feature 2
        Section {
            Image("feature2.jpg")
            Text("Feature 2").font(.title3)
            Text("Description...")
        }
    }
}
```

### Call-to-Action
```swift
Section {
    Text("Ready to start?")
        .font(.title2)

    Link("Get Started", target: "/signup")
        .linkStyle(.button)
        .role(.primary)
}
.padding(.all, 40)
```

## Themes (Advanced)

Create custom themes in `Sources/Themes/`:

```swift
import Ignite

struct CustomTheme: Theme {
    // Define colors, fonts, spacing
    // Implementation details depend on Ignite version
}
```

## Best Practices

1. **Component Organization**: Create reusable components in `Sources/Components/`
2. **Responsive Design**: Ignite components are responsive by default
3. **Accessibility**: Always add `.accessibilityLabel()` to images
4. **Performance**: Optimize images before adding to Assets
5. **SEO**: Use descriptive titles and meta descriptions in page definitions
6. **Navigation**: Create a consistent navigation component used in layouts
7. **Content Structure**: Organize markdown content by category/date in Content folder
8. **Image Paths**: Use relative paths from Assets (e.g., `/images/logo.png`)

## Example: Professional Landing Page Structure

```
Sources/
  Site.swift                 # Main configuration
  Pages/
    Home.swift              # Landing page
    About.swift
    Features.swift
    Contact.swift
  Layouts/
    MainLayout.swift        # Main template with nav/footer
    BlogLayout.swift        # For markdown articles
  Components/
    Navigation.swift        # Reusable nav component
    Footer.swift           # Reusable footer
    Hero.swift             # Hero section component
    FeatureCard.swift      # Feature display component
Assets/
  images/
    logo.png
    hero-bg.jpg
    feature-*.jpg
Content/
  blog/
    2026-01-26-post.md
```

## Deployment (GitHub Pages)

1. Build the site: `swift run`
2. Commit and push the `docs/` folder to GitHub
3. In GitHub repo Settings → Pages:
   - Source: "Deploy from a branch"
   - Branch: `master` (or `main`), folder: `/docs`
   - Save

## Important Notes

1. **Never edit docs/ directly** - It's regenerated on every build
2. **Preview properly** - Always use `ignite run --directory docs --preview` instead of opening HTML files directly in Finder (they need a web server to load resources correctly)
3. **Swift 5.9+** - Project requires Swift 5.9 or later and macOS 13+
4. **Dependencies** - Main dependency is Ignite framework from GitHub (main branch)
5. **Russian content** - This site is in Russian (Приложение для эмбриологов и репродуктологов)
6. **Build warnings** - If using markdown content, you MUST provide at least one `ArticlePage` layout

## Resources

- [Ignite GitHub](https://github.com/twostraws/Ignite)
- [Ignite Samples](https://github.com/twostraws/IgniteSamples)
- [Try Swift Tokyo Example](https://github.com/tryswift/try-swift-tokyo/tree/main/Website)
