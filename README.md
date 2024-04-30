<!-- BADGES -->
[![Github release](https://img.shields.io/github/v/release/tofuutils/tenv?style=for-the-badge)](https://github.com/tofuutils/tenv/releases) [![Contributors](https://img.shields.io/github/contributors/tofuutils/tenv?style=for-the-badge)](https://github.com/tofuutils/tenv/graphs/contributors) ![maintenance status](https://img.shields.io/maintenance/yes/2024.svg?style=for-the-badge)

# asdf-tenv [![Build](https://github.com/tofuutils/asdf-tenv/actions/workflows/build.yml/badge.svg)](https://github.com/tofuutils/asdf-tenv/actions/workflows/build.yml) [![Lint](https://github.com/tofuutils/asdf-tenv/actions/workflows/lint.yml/badge.svg)](https://github.com/tofuutils/asdf-tenv/actions/workflows/lint.yml)

Official [tenv](https://github.com/tofuutils/tenv) plugin for the [asdf version manager](https://asdf-vm.com).

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `unzip`
  - `cosign`: (optional) If installed, asdf will perform signature verification

# Install

Plugin:

```shell
asdf plugin add tenv
```

tenv:

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

# Environment Variable Options

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

## LICENSE
The tenv project is distributed under the Apache 2.0 license. See [LICENSE](LICENSE).
