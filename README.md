<!-- BADGES -->
[![Github release](https://img.shields.io/github/v/release/tofuutils/asdf-tenv?style=for-the-badge)](https://github.com/tofuutils/asdf-tenv/releases) [![Contributors](https://img.shields.io/github/contributors/tofuutils/asdf-tenv?style=for-the-badge)](https://github.com/tofuutils/asdf-tenv/graphs/contributors) ![maintenance status](https://img.shields.io/maintenance/yes/2024.svg?style=for-the-badge) [![Build](https://img.shields.io/github/actions/workflow/status/tofuutils/asdf-tenv/build.yml?style=for-the-badge&label=build)](https://github.com/tofuutils/asdf-tenv/actions/workflows/build.yml) [![Lint](https://img.shields.io/github/actions/workflow/status/tofuutils/asdf-tenv/lint.yml?style=for-the-badge&label=lint)](https://github.com/tofuutils/asdf-tenv/actions/workflows/lint.yml)

<!-- LOGO -->
<br />
<div align="center">
  <a>
    <img src="assets/logo.png" alt="Logo" width="200" height="200">
  </a>
<h3 align="center">asdf-tenv</h3>
  <p align="center">
    Official tenv plugin for asdf version manager
    <br />
    ·
    <a href="https://github.com/tofuutils/asdf-tenv/issues/new?assignees=&labels=issue%3A+bug&projects=&template=bug_report.md&title=">Report Bug</a>
    ·
    <a href="https://github.com/tofuutils/asdf-tenv/issues/new?assignees=&labels=&projects=&template=feature_request.md&title=">Request Feature</a>
  </p>
</div>

<a id="table-of-contents"></a>
## Table of Contents
<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#dependencies">Dependencies</a></li>
    <li><a href="#installation">Installation</a></li>
    <li><a href="#environment-variables">Environment variables</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#community">Community</a></li>
    <li><a href="#authors">Authors</a></li>
    <li><a href="#licence">Licence</a></li>
  </ol>
</details>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`

<a id="installation"></a>
# Installation

## plugin

```shell
asdf plugin add tenv https://github.com/tofuutils/asdf-tenv
```

## tenv

```shell
# Show all installable versions
asdf list-all tenv

# Install a specific version
asdf install tenv latest

# Set a version globally (on your ~/.tool-versions file)
asdf global tenv latest

# Now tenv commands are available
tenv  -version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

<a id="environment-variables"></a>
# Environment Variables

* `ASDF_TENV_SKIP_VERIFY`: skip verifying checksums and signatures (default: `false`)

<a id="contributing"></a>
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<a id="community"></a>
## Community
Have questions or suggestions? Reach out to us via:

* [GitHub Issues](LINK_TO_ISSUES)
* User/Developer Group: Join github community to get update of Harbor's news, features, releases, or to provide suggestion and feedback.
* Slack: Join tofuutils's community for discussion and ask questions: OpenTofu, channel: #tofuutils


<a id="authors"></a>
## Authors
asdf-tenv supported by tofuutils team with help from these awesome contributors:

<!-- markdownlint-disable no-inline-html -->
<a href="https://github.com/tofuutils/asdf-tenv/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=tofuutils/asdf-tenv" />
</a>

<a href="https://star-history.com/#tofuutils/asdf-tenv&Date">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=tofuutils/asdf-tenv&type=Date&theme=dark" />
    <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=tofuutils/asdf-tenv&type=Date" />
    <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=tofuutils/pre-commit-opentofu&type=Date" />
  </picture>
</a>

<!-- markdownlint-enable no-inline-html -->

<a id="licence"></a>
## LICENSE
The tenv project is distributed under the Apache 2.0 license. See [LICENSE](LICENSE).
