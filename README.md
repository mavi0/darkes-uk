# Darkes Architecture

The website for Darkes Architecture. It is a single-page [Hugo](https://gohugo.io/) site that uses the [Hugo Scroll](https://github.com/zjedi/hugo-scroll) theme.

## Layout

- `darkes/` holds the site: `hugo.toml`, the content, images and site-specific partials.
- `darkes/content/en/` holds the English pages. Each file in `homepage/` is one section of the home page.
- The repository root is the Hugo Scroll theme (`layouts/`, `assets/`).

## Run locally

You need the extended version of Hugo. Run this from the repository root:

```sh
hugo server --source=darkes --themesDir=../..
```

To add a section to the home page, add a Markdown file to `darkes/content/en/homepage/`.

## Build and deploy

CI builds a Docker image when a commit lands on `master`. The image builds the site with Hugo and serves it with nginx. CI pushes the image to `ghcr.io/mavi0/darkes-uk:latest`. The host pulls that image.

Pull requests build the image but do not push it.

## Dependency updates

Dependabot keeps the dependencies current without manual work:

- The base images in the `Dockerfile` are pinned by digest. Dependabot updates the digest every day.
- Dependabot groups the GitHub Actions updates into one weekly PR, and the npm minor and patch updates into another.
- A workflow merges each Dependabot PR and then starts the build, so the update deploys.

Auto-merge does not wait for the PR build. If an update breaks the build, the site keeps its last good image until someone fixes `master`.

## Credits

- [Jan Raasch](https://www.janraasch.com) and [zjedi](https://github.com/zjedi/hugo-scroll) wrote the Hugo Scroll theme.
- The theme is based on [GhostScroll](https://github.com/grmmph/GhostScroll) by Yonatan Wolowelsky.
- Stock photos are from [Pexels](https://www.pexels.com) and [Unsplash](https://unsplash.com).
