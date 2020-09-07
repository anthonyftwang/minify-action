# Minify Action
[![GitHub release](https://img.shields.io/github/release/anthonyftwang/minify-action.svg?color=orange)](https://gitHub.com/anthonyftwang/minify-action/releases/)
[![MIT license](https://img.shields.io/github/license/anthonyftwang/minify-action.svg?color=blue)](https://github.com/anthonyftwang/minify-action/blob/master/LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

Github Action to minify js, css, and html files pushed to a branch, using the [Minify](https://github.com/coderaiser/minify) package.
### Usage
Here the target branch is `foo`. You need to checkout your repository so the Minify Action job can access it. Then, you can auto-commit the files to the repository if desired.
```yaml
name: Minify Workflow
on:
  push:
    branches: [ foo ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      # Checks-out your repository
      - uses: actions/checkout@v2
        with:
          ref: ${{ github.ref }}

      - name: Minify Action
        uses: anthonyftwang/minify-action@v1

      # Auto-commit to repository
      - uses: stefanzweifel/git-auto-commit-action@v4
        with:
          commit_message: Minify source code
          branch: ${{ github.ref }}
```
