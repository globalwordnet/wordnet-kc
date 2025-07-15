# Wordnet CLARIN K-Center Website

This repository contains the **draft** website for the Wordnet CLARIN Knowledge Centre, a specialized center providing expertise and support for wordnet technologies, lexical resources, and semantic networks.

## Overview

The Wordnet CLARIN K-Center serves as a hub for researchers and developers working with wordnet technologies across various languages and domains. Our website provides information about our services, expertise areas, tools, and team.


## Structure

```
├── _config.yml              # Jekyll configuration
├── _layouts/
│   └── default.html         # Main layout template
├── assets/
│   ├── css/
│   │   └── main.css         # Main stylesheet
│   ├── js/
│   │   └── main.js          # JavaScript functionality
│   └── images/              # Site images and logos
├── index.html               # Homepage
├── Gemfile                  # Ruby dependencies
└── README.md               # This file
```

## Quick Start

### Prerequisites

- Ruby 2.7 or higher
- Bundler gem
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/wordnet-kc/wordnet-kc.github.io.git
   cd wordnet-kc.github.io
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Run the development server**
   ```bash
   bundle exec jekyll serve
   ```

4. **View the site**
   Open your browser and navigate to `http://localhost:4000`

### GitHub Pages Deployment

This site is configured to work with GitHub Pages automatically:

1. Push your changes to the `main` branch
2. GitHub Pages will automatically build and deploy your site
3. Your site will be available at `https://wordnet-kc.github.io`

## Customization

### Site Configuration

Edit `_config.yml` to update:
- Site title and description
- Contact information
- Navigation menu items
- Social media links

### Content Updates

- **Homepage sections**: Edit `index.html`
- **Team information**: Update the team section in `index.html`
- **Tools and resources**: Modify the tools section
- **Styling**: Customize `assets/css/main.css`

### Adding Images

1. Add image files to `assets/images/`
2. Reference them in your content using:
   ```html
   <img src="{{ '/assets/images/your-image.jpg' | relative_url }}" alt="Description">
   ```


## Content Areas

### About Section
Provides an overview of the K-Center's mission and services, highlighting expertise in wordnet technologies and semantic resources.

### Expertise Section
Details the specific areas of knowledge, including:
- Target audiences (linguists, computational linguists, etc.)
- Technical specializations (wordnet construction, alignment, validation)
- Supported technologies and methodologies

### Tools & Resources
Showcases available tools and resources:
- Validation and quality assessment tools
- API access and documentation
- Wordnet editing tools
- Cross-lingual alignment utilities

### Team Section
Introduces the key personnel and their roles within the K-Center.

### Contact Section
Provides multiple ways to get in touch and includes a contact form for inquiries.


## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/new-feature`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push to the branch (`git push origin feature/new-feature`)
5. Create a Pull Request

## License

This project is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License. See the [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/) for details.

## Support

For technical issues with the website, please open an issue in this repository.

For questions about wordnet technologies and K-Center services, please use the contact form on the website.

## Acknowledgments

- Built with [Jekyll](https://jekyllrb.com/)
- Inspired by the [Global Wordnet Association](https://github.com/globalwordnet/globalwordnet.github.io/) website
- Based on the CLARIN infrastructure and community
