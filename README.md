# Minify Action
Github Action to minify js, html, and css files pushed to a branch, using the [Minify](https://github.com/coderaiser/minify) package.
### Usage
Here the target branch is `foo`. You need to checkout your repository and set up Node.js so the minify-action job can run. Then, you can auto-commit the files to the repository if desired.
```yaml
name: Minify Workflow
on:
  push:
    branches: [ foo ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      # Checks-out your repository and sets up a Node.js environment
      - uses: actions/checkout@v2
        with:
          ref: ${{ github.ref }}
      - uses: actions/setup-node@v1
        with:
          node-version: '12.x'

      - name: Minify js, html, and css
        uses: anthonyftwang/minify-action@master

      # Auto commit to repository
      - uses: stefanzweifel/git-auto-commit-action@v4
        with:
          commit_message: Minify source code
          branch: ${{ github.ref }}
```
### Contributing
PRs welcome!
