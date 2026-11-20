# darkes.uk

This repository holds the website of Darkes Architecture. The site is one page of plain HTML and CSS. It has no framework, no JavaScript and no build step. Nginx serves it from a Docker image.

## Files

| Path | Contents |
|---|---|
| `static-site/index.html` | The whole page |
| `static-site/assets/css/site.css` | The only stylesheet |
| `static-site/assets/img/` | Photos and the link preview image |
| `static-site/assets/images/favicon/` | Favicons |
| `static-site/assets/fonts/` | Self-hosted Montserrat, with its licence |
| `Dockerfile` | The Nginx image that serves `static-site/` |

The logo in the header is an inline SVG in `index.html`.

## Run it locally

To preview the files directly, start any static server:

```sh
python3 -m http.server 8080 --directory static-site
```

To run the same image that production uses, build it with Docker:

```sh
docker build -t darkes-uk .
docker run --rm -p 8080:80 darkes-uk
```

Then open <http://localhost:8080>.

## Deployment

Every push to `master` starts the Docker workflow. The workflow builds the image for `linux/amd64` and `linux/arm64` and pushes it to `ghcr.io/mavi0/darkes-uk:latest`.

## Updates

The image uses `nginx:stable-alpine-slim`, pinned by digest. Dependabot checks the tag every day. When the Nginx maintainers publish a new image for that tag, Dependabot opens a PR that changes the digest.

Dependabot also opens one grouped PR each week for GitHub Actions updates.

The `dependabot-automerge.yaml` workflow merges each Dependabot PR. A merge made with `GITHUB_TOKEN` does not start push workflows, so the workflow then starts the Docker build itself.

On 2 January each year, the `update-year.yaml` workflow updates the year in the footer.

## Credits

- The drafting photo is by [Ryan Ancill on Unsplash](https://unsplash.com/photos/nGsVMkRatgM), under the [Unsplash Licence](https://unsplash.com/license).
- Montserrat is under the [SIL Open Font Licence](static-site/assets/fonts/montserrat-OFL.txt).
