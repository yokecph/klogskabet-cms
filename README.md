# Klogskabet CMS
Copyright ©2018 YOKE ApS. All rights reserved.

## Description
CMS for Klogskabet installations at Danish public libraries.

### Overview
Klogskabet was commissioned by Ballerup Public Library. It's a set of physical installations that can be used by the library to present different themes to the library-going audience, i.e. a flexible exhibition platform. The exhibitions are primarily intended to highlight the breadth and depth of digitally accessible content that Danish libraries offer. This Rails app acts as a content management system for the digital/interactive parts of the installation.

### API
TODO

## Requirements
- Ruby 2.5.0 (use `rbenv`)
- MySQL 5.7
- Node.js (to asset compilation)
- ImageMagick (see [Paperclip's readme](https://github.com/thoughtbot/paperclip#requirements))
- `file` command (see [Paperclip's readme](https://github.com/thoughtbot/paperclip#requirements))

### Production setup
- Linux-based server (e.g. Ubuntu)
- nginx as front-end web server/reverse proxy
- logrotate to handle logs
- upstart/init service management

## Development
Clone the repository and run `bin/setup`. First time through, it'll copy some example configuration files. Edit these, and run setup again to complete database setup etc..

## Testing
TODO

## Committing
Adhere to the git-flow model. Use `bin/semver` to check (and change) the version number when releasing a version.

## Deployment
TODO
 
