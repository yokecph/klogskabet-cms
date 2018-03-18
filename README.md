# Klogskabet CMS
Copyright 2018 YOKE ApS. AGPLv3 licensed.

## Description
CMS for Klogskabet installations at Danish public libraries.

### Overview
Klogskabet was commissioned by Ballerup Bibliotekerne (Ballerup public libraries). It's a set of physical installations that can be used by the library to present different themes to the library-going audience, i.e. a flexible exhibition platform. The exhibitions are primarily intended to highlight the breadth and depth of digitally accessible content that Danish libraries offer. This Rails app acts as a content management system for the touch-based digital/interactive parts of the installation.

## Requirements
- Ruby 2.5.0 (use `rbenv`)
- MySQL 5.7
- Node.js (for asset compilation)
- ImageMagick (see [Paperclip's readme](https://github.com/thoughtbot/paperclip#requirements))
- `file` command (see [Paperclip's readme](https://github.com/thoughtbot/paperclip#requirements))

### Production setup
- Linux-based server (e.g. Ubuntu)
- nginx as front-end web server/reverse proxy
- logrotate to handle logs
- upstart/init service management
- Local or remote SMTP service for email delivery (e.g. Mailgun)

## API
This project presents a RESTful JSON API, which the Klogskabet modules use to fetch their content.

In order for a module/device to use the API, it must be registered in the CMS and given a unique device ID. That ID should be configured on the device itself, and is used in API URLs.

### `GET /api/devices/<device ID>.json`
Responds with the device's assigned content, if any. For screen modules that'll be either a video gallery, image gallery, quiz, or timeline. For audio modules, it'll be a playlist.

If no content has been assigned to the device, or the content is incomplete, or the device ID isn't registered, `404 Not Found` will be returned with a JSON error message.

#### Gallery response
    {
      "kind": "gallery",
      "id": <integer>,
      "theme_color": <hex color string>,
      "bilingual": <boolean>,
      "name": <string>,
      "created_at": <rfc-formatted datetime string>,
      "updated_at": <rfc-formatted datetime string>,
      "images": [
        {
          "id": <integer>
          "title_da": <string>,
          "title_en": <string - optional>,
          "description_da": <string>,
          "description_en": <string - optional>,
          "description_html_da": <html formatted description string>,
          "description_html_en": <html formatted description string - optional>,
          "source_da": <string>
          "source_en": <string - optional>,
          "url": <image url string>,
          "checksum": <file's md5 checksum as a string>,
          "created_at": <rfc-formatted datetime string>,
          "updated_at": <rfc-formatted datetime string>
        },
        ...
      ]
    }

#### Quiz response
    {
      "kind": "quiz",
      "id": <integer>,
      "theme_color": <hex color string>,
      "bilingual": <boolean>,
      "name": <string>,
      "title_da": <string>,
      "title_en": <string - optional>,
      "subtitle_da": <string>,
      "subtitle_en": <string - optional>,
      "result_title_da": <string>,
      "result_title_en": <string - optional>,
      "created_at": <rfc-formatted datetime string>,
      "updated_at": <rfc-formatted datetime string>,
      "options": [
        {
          "id": <integer>,
          "option_da": <string>,
          "option_en": <string - optional>,
          "answer_da": <string>,
          "answer_en": <string - optional>
        },
        ...
      ]
    }

#### Timeline response
    {
      "kind": "timeline",
      "id": <integer>,
      "theme_color": <hex color string>,
      "bilingual": <boolean>,
      "name": <string>,
      "title_da": <string>,
      "title_en": <string - optional>,
      "created_at": <rfc-formatted datetime string>,
      "updated_at": <rfc-formatted datetime string>,
      "intervals": [
        {
          "id": <integer>,
          "title_da": <string>,
          "title_en": <string - optional>,
          "subtitle_da": <string>,
          "subtitle_en": <string - optional>,
          "description_da": <string>,
          "description_en": <string - optional>,
          "description_html_da": <html formatted description string>,
          "description_html_en": <html formatted description string - optional>,
          "created_at": <rfc-formatted datetime string>,
          "updated_at": <rfc-formatted datetime string>,
          "images": [
            {
              "id": <integer>,
              "description_da": <string>,
              "description_en": <string - optional>,
              "source_da": <string>
              "source_en": <string - optional>,
              "url": <image url string>,
              "checksum": <file's md5 checksum as a string>
              "created_at": <rfc-formatted datetime string>,
              "updated_at": <rfc-formatted datetime string>
            },
            ...
          ]
        },
        ...
      ]
    }

#### Video gallery response
Note that videos can have two sources: YouTube or an MP4 file. If an MP4 file url is present, it should take precedence over the YouTube ID if both are present. Also, if an MP4 file url is present, a poster image url may be present and used as a thumbnail.

    {
      "kind": "video_gallery",
      "id": <integer>,
      "theme_color": <hex color string>,
      "bilingual": <boolean>,
      "name": <string>,
      "created_at": <rfc-formatted datetime string>,
      "updated_at": <rfc-formatted datetime string>,
      "videos": [
        {
          "id": <integer>,
          "title_da": <string>,
          "title_en": <string - optional>,
          "description_da": <string>,
          "description_en": <string - optional>,
          "description_html_da": <html formatted description string>,
          "description_html_en": <html formatted description string - optional>,
          "youtube_id": <string - optional>,
          "mp4_url": <string - optional>,
          "mp4_poster_url": <string - optional>,
          "created_at": <rfc-formatted datetime string>,
          "updated_at": <rfc-formatted datetime string>
        },
        ...
      ]
    }

#### Playlist response
    {
      "kind": "playlist",
      "id": <integer>,
      "theme_color": <hex color string>,
      "bilingual": <boolean>,
      "name": <string>,
      "description": <string>,
      "created_at": <rfc-formatted datetime string>,
      "updated_at": <rfc-formatted datetime string>,
      "tracks": [
        {
          "id": <integer>,
          "title": <string>,
          "description": <string>,
          "created_at": <rfc-formatted datetime string>,
          "updated_at": <rfc-formatted datetime string>,
          "url": <mp3 file url string>,
          "checksum": <file's md5 checksum as a string>
        },
        ...
      ]
    }

### `PUT /api/devices/<device ID>.json`
Allows a device to report its local IP address(es) (write-only) in order to make it easier to staff to remotely access the modules. The request body should be JSON and structured as:

    { 
      "device": 
      "eth_ip": <IPv4 address string, optional>,
      "wlan_ip": <IPv4 address string, optional>
    }

## Development
Clone the repository and run `bin/setup`. First time through, it'll copy some example configuration files. Edit these, and run setup again to complete database setup.

## Testing
Testing is done with RSpec and FactoryBot for fixture generation. To run the test suite, invoke:

    $ bin/rspec

Code coverage can be checked with SimpleCov by setting `COVERAGE=true`:

    $ COVERAGE=true bin/rspec

## Committing
Adhere to the git-flow model: The `master` branch is for stable code only and should only be updated by the release or hotfix flows. Everything else should happen in the `develop` branch or `feature/*` branches as prescribed.

Released versioned should be tagged with their version number (see _Versioning_). Releasing a new version must increment the version number compared to the previous release.

## Versioning
This project uses [semantic versioning](https://semver.org). The current version is defined in the `.semver` file, which can be parsed and updated by the `bin/semver` command:

To list the current version invoke:

    $ bin/semver

To increment the version invoke:

    $ bin/semver inc [major|minor|patch]

## Deployment
Deployment is handled by Capistrano. To deploy, you must have SSH access to the server. There is current only one stage: `production`.

By default the code is deployed from the `master` branch on GitHub - not your local repository. A different brach can be specified by setting a `GIT_BRANCH` env variable, but the branch will still be fetched from the GitHub repository.

To deploy, invoke:

    $ bin/cap production deploy

To deploy to a blank server, first call `bin/cap production deploy:config` which will render several configuration templates and upload them to the server. Here, they must be edited to match the desired settings, after which the code can be deployed.

Note that this repository does _not_ contain any encryption keys or other sensitive data used in the production environment. Should these be required (e.g. if the hosting changes) please contact YOKE.

## License
AGPLv3. See `COPYING`.
