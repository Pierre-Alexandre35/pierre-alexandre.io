<p align="center"><a href="https://pierre-alexandre.io" target="_blank" rel="noopener noreferrer"><img width="480" src="docs/logo.png" alt="pierre-alexandre.io logo"></a></p>

<p align="center">
  <a href="https://npmcharts.com/compare/vue?minimal=true"><img src="https://img.shields.io/website.svg?color=60c454&url=https://pierre-alexandre.io/" alt="Website shields.io"></a>
  <a href="https://github.com/Pierre-Alexandre35/pierre-alexandre.io/actions/workflows/deploy.yml"><img src="https://github.com/Pierre-Alexandre35/pierre-alexandre.io/actions/workflows/deploy.yml/badge.svg" alt="Github Actions CI"></a>
    <a href="https://shields.io/"><img src="https://img.shields.io/github/languages/code-size/Pierre-Alexandre35/Personal_website?color=blue" alt="GitHub code size in bytes"></a>
    <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License: MIT"></a>
    <a href="http://pierre-alexandre.io/" alt="Coverage Status"></a>
  <br>
</p>
<br>

<h2 align="center">Personal website and portfolio</h2>

Source code for my personnal website where I am sharing my personnal projects. 
This website is 100% static and updated on a regular basis. I am also using my personnal website to learn more about SEO and search engine related topics and improve my web design skills.  
- Production website (Google Cloud Storage): [pierre-alexandre.io](https://pierre-alexandre.io)
- Staging website (Github Pages): [pierre-alexandre35.github.io/pierre-alexandre.io](https://pierre-alexandre35.github.io/pierre-alexandre.io/public_html/)

## Architecture
![alt text](docs/architecture.png)

## Infrastructure and deployment

The public Google Cloud Storage bucket is managed with Terraform in
[`iac/`](iac/README.md). Follow that guide to create it in
`personal-website-512218`, then run `make deploy` to upload `public_html/`.

## Changelog
Detailed changes for each merged pull requests are documented in the [CHANGELOG.md](https://github.com/Pierre-Alexandre35/pierre-alexandre.io/blob/develop/CHANGELOG.md)


## Roadmap
- Fix some broken links for some of my projects
- Fix navbar toggle for the mobiel version
- Refactor public html code:
    - Review naming for classes
    - Only use classes rather than a mix of classes + IDs
- Build a small shell script to merge multiple HTML files into a single file (in order to split to large index.html in multiple files during development)
- Missing documentation for some JavaScript functions
- Find a html, css and js linter
- Refactor css code especially for reusability
