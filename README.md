<h1 align="center">authgate</h1>

<div align="center">

auth gateway ⛩️

[![Build](https://github.com/radio-aktywne/authgate/actions/workflows/build.yaml/badge.svg)](https://github.com/radio-aktywne/authgate/actions/workflows/build.yaml)
[![Docs](https://github.com/radio-aktywne/authgate/actions/workflows/docs.yaml/badge.svg)](https://github.com/radio-aktywne/authgate/actions/workflows/docs.yaml)

</div>

---

This `README` provides info about the development process.

For more info about `authgate` itself see
[package `README`](authgate/README.md) or
[docs](https://radio-aktywne.github.io/authgate).

## Quickstart

Using [`docker`](https://docs.docker.com/get-docker/):

```sh
docker build -t authgate . && docker run --rm -it authgate --help
```

## Repository structure

Everything strongly related to `authgate` itself (e.g. source code) should be placed in the `authgate` directory.
Everything related to the development of `authgate` (e.g. `Dockerfile`) should be placed at the top level.

In particular the source code and documentation of `authgate` should be placed in `authgate/src` and `authgate/docs` respectively.

## Continuous Integration

When you push changes to remote, different GitHub Actions run to ensure project consistency.
There are defined workflows for:

- deploying docs to GitHub Pages
- testing Docker builds
- drafting release notes
- uploading Docker images to GitHub registry

For more info see the files in `.github/workflows` directory and `Actions` tab on GitHub.

Generally if you see a red mark next to your commit on GitHub or a failing status on badges in `README` it means the commit broke something (or workflows themselves are broken).

## Releases

Every time you merge a pull request into main, a draft release is automatically updated, adding the pull request to changelog.
Changes can be categorized by using labels. You can configure that in `.github/release-drafter.yml` file.

Every time you publish a release, the Docker image is uploaded to GitHub registry with version taken from release tag.

## Building docs

We are using [`mkdocs`](https://www.mkdocs.org) with [`material`](https://squidfunk.github.io/mkdocs-material) for building the docs.
It lets you write the docs in Markdown format and creates a nice webpage for them.

Docs should be placed in `authgate/docs/docs`.
They are pretty straightforward to write.

If you want to build the docs manually (for example to see how they look without publishing them)
you should first install the requirements listed in `authgate/docs/requirements.txt` into your `python` environment.
Then `cd` into `authgate/docs` and run:

```sh
mkdocs build
```

It will generate `site` directory with the webpage source.
