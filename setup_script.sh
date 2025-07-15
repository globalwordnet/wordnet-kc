#!/bin/bash

# Setup script for Wordnet CLARIN K-Center website
echo "Setting up Wordnet CLARIN K-Center website..."

# Create directory structure
mkdir -p _layouts
mkdir -p assets/css
mkdir -p assets/js
mkdir -p assets/images
mkdir -p .github/workflows

# Create _config.yml
cat > _config.yml << 'EOF'
# Site settings
title: "Wordnet CLARIN K-Center"
description: "CLARIN Knowledge Centre for Wordnet Technologies and Resources"
baseurl: "" # the subpath of your site, e.g. /blog
url: "https://wordnet-kc.github.io" # the base hostname & protocol for your site

# Build settings
markdown: kramdown
highlighter: rouge
permalink: pretty

# Collections
collections:
  tools:
    output: true
    permalink: /:collection/:name/
  resources:
    output: true
    permalink: /:collection/:name/

# Plugins
plugins:
  - jekyll-feed
  - jekyll-sitemap
  - jekyll-seo-tag

# Exclude from processing
exclude:
  - Gemfile
  - Gemfile.lock
  - node_modules
  - vendor/bundle/
  - vendor/cache/
  - vendor/gems/
  - vendor/ruby/
  - README.md

# Site configuration
google_analytics: # Add your GA tracking ID if needed
contact_email: "contact@wordnet-kc.org"

# Navigation
navigation:
  - title: "Home"
    url: "/"
  - title: "About"
    url: "/#about"
  - title: "Expertise"
    url: "/#expertise"
  - title: "Tools & Resources"
    url: "/#tools"
  - title: "Team"
    url: "/#team"
  - title: "Contact"
    url: "/#contact"

# Social links
social:
  github: "wordnet-kc"
  email: "contact@wordnet-kc.org"
EOF

# Create Gemfile
cat > Gemfile << 'EOF'
source "https://rubygems.org"

gem "jekyll", "~> 4.3.0"
gem "minima", "~> 2.5"

group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.12"
  gem "jekyll-sitemap"
  gem "jekyll-seo-tag"
end

platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end

gem "wdm", "~> 0.1.1", :platforms => [:mingw, :x64_mingw, :mswin]
gem "http_parser.rb", "~> 0.6.0", :platforms => [:jruby]
EOF

# Create index.html
cat > index.html << 'EOF'
---
layout: default
---

<!-- Hero Section -->
<section class="hero">
  <div class="hero-content">
    <h1>Wordnet CLARIN K-Center</h1>
    <p class="hero-subtitle">CLARIN Knowledge Centre for Wordnet Technologies and Resources</p>
    <div class="k-center-logo">
      <img src="/assets/images/k_center.png" alt="K-Center Logo">
    </div>
  </div>
  <div class="hero-scroll">
    <a href="#about" class="scroll-btn">
      <span class="material-icons">expand_more</span>
    </a>
  </div>
</section>

<!-- Certificate Section -->
<section class="certificate" id="certificate">
  <div class="container">
    <div class="certificate-content">
      <div class="certificate-image">
        <img src="/assets/images/certificate.png" alt="K-Center Certificate">
      </div>
      <div class="certificate-text">
        <h3>Certificate</h3>
        <p>Certificate confirming the status of CLARIN Knowledge Centre for Wordnet Technologies and Resources</p>
        <a href="/assets/documents/certificate.pdf" target="_blank" class="btn btn-primary">
          PREVIEW
        </a>
      </div>
    </div>
  </div>
</section>

<!-- About Section -->
<section class="section" id="about">
  <div class="container">
    <div class="section-header">
      <div class="icon">
        <span class="material-icons">task_alt</span>
      </div>
      <h2>About Our Wordnet K-Center</h2>
    </div>
    <div class="content">
      <p>The Wordnet CLARIN Knowledge Centre specializes in providing expertise and support for wordnet technologies, lexical resources, and semantic networks. As a CLARIN K-Center, we are dedicated to promoting knowledge about wordnet infrastructure and supporting researchers in their semantic analysis projects.</p>
      
      <p>Our center offers comprehensive support for wordnet creation, management, and application across various languages and domains. We provide expert guidance on lexical semantic analysis, ontology development, and cross-lingual wordnet alignment within Digital Humanities and Social Sciences research.</p>
      
      <h4 class="highlight">What do we do to support our users?</h4>
      <ul class="feature-list">
        <li>
          <span class="material-icons">arrow_right</span>
          <p>Expert consultation on wordnet development and usage</p>
        </li>
        <li>
          <span class="material-icons">arrow_right</span>
          <p>Technical support for wordnet tools and applications</p>
        </li>
        <li>
          <span class="material-icons">arrow_right</span>
          <p>Training workshops on semantic resource creation and management</p>
        </li>
        <li>
          <span class="material-icons">arrow_right</span>
          <p>Guidance on cross-lingual wordnet alignment and mapping</p>
        </li>
      </ul>
    </div>
  </div>
</section>

<!-- Expertise Section -->
<section class="section section-alt" id="expertise">
  <div class="container">
    <div class="section-header">
      <div class="icon">
        <span class="material-icons">build_circle</span>
      </div>
      <h2>Areas of Expertise</h2>
    </div>
    
    <div class="expertise-content">
      <p class="intro">Our Knowledge Centre provides comprehensive expertise in wordnet technologies and lexical semantic resources, supporting both monolingual and multilingual research projects.</p>
      
      <div class="expertise-category">
        <h3 class="category-title">
          <span class="material-icons">account_circle</span>
          Audiences Served
        </h3>
        <div class="expertise-grid">
          <ul>
            <li><span class="material-icons">arrow_right</span> Computational linguists</li>
            <li><span class="material-icons">arrow_right</span> Lexicographers</li>
            <li><span class="material-icons">arrow_right</span> Digital humanities researchers</li>
            <li><span class="material-icons">arrow_right</span> Natural language processing developers</li>
            <li><span class="material-icons">arrow_right</span> Semantic web specialists</li>
            <li><span class="material-icons">arrow_right</span> Ontology engineers</li>
          </ul>
        </div>
      </div>
      
      <div class="expertise-category">
        <h3 class="category-title">
          <span class="material-icons">psychology</span>
          Wordnet Technologies
        </h3>
        <div class="expertise-grid">
          <ul>
            <li><span class="material-icons">arrow_right</span> Wordnet construction and validation</li>
            <li><span class="material-icons">arrow_right</span> Cross-lingual wordnet alignment</li>
            <li><span class="material-icons">arrow_right</span> Sense disambiguation and mapping</li>
            <li><span class="material-icons">arrow_right</span> Semantic relation extraction</li>
            <li><span class="material-icons">arrow_right</span> Wordnet-based applications</li>
            <li><span class="material-icons">arrow_right</span> Quality assessment and evaluation</li>
            <li><span class="material-icons">arrow_right</span> Domain-specific wordnet development</li>
            <li><span class="material-icons">arrow_right</span> Multilingual wordnet integration</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Tools & Resources Section -->
<section class="section" id="tools">
  <div class="container">
    <div class="section-header">
      <div class="icon">
        <span class="material-icons">build</span>
      </div>
      <h2>Tools & Resources</h2>
    </div>
    
    <div class="tools-grid">
      <div class="tool-card">
        <h4>Wordnet Editor</h4>
        <p>Professional tools for creating and editing wordnet structures</p>
        <a href="#" class="btn btn-secondary">Learn More</a>
      </div>
      <div class="tool-card">
        <h4>Alignment Tools</h4>
        <p>Cross-lingual wordnet mapping and alignment utilities</p>
        <a href="#" class="btn btn-secondary">Learn More</a>
      </div>
      <div class="tool-card">
        <h4>Validation Suite</h4>
        <p>Quality assessment and validation tools for wordnet resources</p>
        <a href="#" class="btn btn-secondary">Learn More</a>
      </div>
      <div class="tool-card">
        <h4>API Access</h4>
        <p>Programmatic access to wordnet data and services</p>
        <a href="#" class="btn btn-secondary">Learn More</a>
      </div>
    </div>
  </div>
</section>

<!-- Team Section -->
<section class="section section-alt" id="team">
  <div class="container">
    <div class="section-header">
      <div class="icon">
        <span class="material-icons">groups</span>
      </div>
      <h2>Our Team</h2>
    </div>
    
    <div class="team-grid">
      <div class="team-member">
        <div class="member-icon">
          <span class="material-icons">person</span>
        </div>
        <div class="member-info">
          <h4>K-Center Director</h4>
          <p class="member-name">Dr. [Name]</p>
        </div>
      </div>
      <div class="team-member">
        <div class="member-icon">
          <span class="material-icons">person</span>
        </div>
        <div class="member-info">
          <h4>Wordnet Specialist</h4>
          <p class="member-name">Dr. [Name]</p>
        </div>
      </div>
      <div class="team-member">
        <div class="member-icon">
          <span class="material-icons">person</span>
        </div>
        <div class="member-info">
          <h4>Technical Coordinator</h4>
          <p class="member-name">[Name]</p>
        </div>
      </div>
      <div class="team-member">
        <div class="member-icon">
          <span class="material-icons">person</span>
        </div>
        <div class="member-info">
          <h4>User Support</h4>
          <p class="member-name">[Name]</p>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Contact Section -->
<section class="section" id="contact">
  <div class="container">
    <div class="section-header">
      <div class="icon">
        <span class="material-icons">mail_outline</span>
      </div>
      <h2>Contact & Support</h2>
    </div>
    
    <div class="contact-content">
      <p class="contact-intro">We welcome collaboration and are here to support your wordnet-related research and development projects.</p>
      
      <div class="contact-reasons">
        <h4>Contact us if you:</h4>
        <ul>
          <li><span class="material-icons">arrow_right</span> Need guidance on wordnet development or usage</li>
          <li><span class="material-icons">arrow_right</span> Require technical support for wordnet tools</li>
          <li><span class="material-icons">arrow_right</span> Want to collaborate on semantic resource projects</li>
          <li><span class="material-icons">arrow_right</span> Need training on wordnet technologies</li>
        </ul>
      </div>
      
      <div class="contact-form">
        <h3>Get in Touch</h3>
        <form action="/contact" method="POST">
          <div class="form-group">
            <label for="name">Name</label>
            <input type="text" id="name" name="name" required>
          </div>
          <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>
          </div>
          <div class="form-group">
            <label for="message">Message</label>
            <textarea id="message" name="message" rows="5" required></textarea>
          </div>
          <button type="submit" class="btn btn-primary">Send Message</button>
        </form>
      </div>
    </div>
  </div>
</section>
EOF

echo "Creating remaining files..."

# Create default layout (truncated for space - you'll need to copy from the artifacts)
# Create CSS and JS files (also copy from artifacts)
# Create GitHub workflow

echo "✓ Basic structure created!"
echo ""
echo "Next steps:"
echo "1. Copy the CSS content from the main.css artifact"
echo "2. Copy the JavaScript content from the main.js artifact" 
echo "3. Copy the layout HTML from the default.html artifact"
echo "4. Copy the GitHub workflow from the jekyll.yml artifact"
echo "5. Add images to assets/images/"
echo "6. Initialize git repository and push to GitHub"
echo ""
echo "Run this script with: bash setup-wordnet-kc.sh"
EOF

chmod +x setup-wordnet-kc.sh