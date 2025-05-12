# Contributing to Ultra Vires Insectum

Thank you for your interest in contributing to *Ultra Vires Insectum*, an isometric roguelike built in LOVE2D! We welcome contributions of all kinds, including code, art, documentation, and bug reports.

## How to Contribute

### Reporting Bugs
- Check the [Issues](https://github.com/braticpetar/ultra-vires-insectum/issues) page to avoid duplicates.
- Open a new issue with:
  - A clear title (e.g., "Collision bug with moving entities").
  - Steps to reproduce, expected behavior, and actual behavior.
  - Screenshots or videos, if applicable.

### Suggesting Features
- Open an issue with the label "enhancement".
- Describe the feature, why it’s useful, and any implementation ideas.

### Submitting Code
1. **Fork the Repository**:
   - Fork [this repo](https://github.com/braticpetar/ultra-vires-insectum) and clone your fork.
2. **Set Up the Project**:
   - Install [LOVE2D](https://love2d.org/).
   - Run `love .` to test the game.
3. **Create a Branch**:
   - Use a descriptive name, e.g., `fix-collision-bug` or `add-enemy-type`.
   - `git checkout -b your-branch-name`
4. **Follow Coding Style**:
   - Use `snake_case` for variable/function names.
   - Add comments for complex logic.
   - Keep functions short and modular.
5. **Test Your Changes**:
   - Ensure the game runs without errors.
   - Add tests to `tests/` if applicable.
6. **Submit a Pull Request**:
   - Push your branch: `git push origin your-branch-name`.
   - Open a PR with a clear description of changes and reference any related issues.
   - Example PR title: "Fix z-sorting for overlapping entities (#12)".

### Contributing Art
- Submit pixel art (16x16 or 32x32 tiles, PNG format) via a pull request.
- Include a preview in the PR description.
- Ensure art matches the game’s style (see `assets/` for examples).

### Improving Documentation
- Update `README.md`, `docs/`, or code comments.
- Submit changes via a pull request.

## Prerequisites
- Familiarity with Lua and LOVE2D.
- Basic Git knowledge (forking, branching, PRs).
- [LOVE2D](https://love2d.org/) installed.

## Questions?
Open an issue or contact [braticpetar](https://github.com/braticpetar) on GitHub.
