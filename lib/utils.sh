#!/usr/bin/env bash

set -euo pipefail

GH_REPO="https://github.com/tofuutils/tenv"
TOOL_BIN_NAME="tenv"
TOOL_NAME="tenv"
TOOL_TEST="tenv -version"
SKIP_VERIFY=${ASDF_TENV_SKIP_VERIFY:-"false"}

fail() {
	echo -e "asdf-${TOOL_NAME}: $*"
	exit 1
}

curl_opts=(-fsSL)

# NOTE: You might want to remove this if tenv is not hosted on GitHub releases.
if [ -n "${GITHUB_API_TOKEN:-}" ]; then
	curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
	git ls-remote --tags --refs "$GH_REPO" |
		grep -o 'refs/tags/.*' | cut -d/ -f3- |
		sed 's/^v//' # NOTE: You might want to adapt this sed to remove non-version strings from tags
}

list_all_versions() {
	# Change this function if tenv has other means of determining installable versions.
	list_github_tags
}

get_platform() {
	local -r kernel="$(uname -s)"
	if [[ ${OSTYPE} == "msys" || ${kernel} == "CYGWIN"* || ${kernel} == "MINGW"* ]]; then
		echo Windows
	else
		uname
	fi
}

get_arch() {
	local -r machine="$(uname -m)"

	if [[ ${machine} == "arm64" ]] || [[ ${machine} == "aarch64" ]]; then
		echo "arm64"
	elif [[ ${machine} == *"arm"* ]] || [[ ${machine} == *"aarch"* ]]; then
		echo "arm"
	elif [[ ${machine} == *"386"* ]]; then
		echo "386"
	else
		echo "x86_64"
	fi
}

get_release_file() {
	echo "${ASDF_DOWNLOAD_PATH}/${TOOL_NAME}-${ASDF_INSTALL_VERSION}.tar.gz"
}

download_release() {
	local version filename url
	version="${1}"
	local -r filename="$(get_release_file)"
	local -r platform="$(get_platform)"
	local -r arch="$(get_arch)"

	url="$GH_REPO/releases/download/v${version}/${TOOL_BIN_NAME}_v${version}_${platform}_${arch}.tar.gz"

	echo "* Downloading ${TOOL_NAME} release v${version}..."
	curl "${curl_opts[@]}" -o "${filename}" -C - "${url}" || fail "Could not download ${url}"

	#  Extract contents of zip file into the download directory
	tar -xzf "${filename}" -C "${ASDF_DOWNLOAD_PATH}" || fail "Could not extract ${filename}"

}

install_version() {
	local install_type="$1"
	local version="$2"
	local install_path="${3%/bin}/bin"

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only"
	fi

	if command -v cosign >/dev/null 2>&1 && [ "$SKIP_VERIFY" == "false" ]; then
		echo "Verifying signatures and checksums"
		verify "$version" "$ASDF_DOWNLOAD_PATH"
	else
		echo "Skipping verifying signatures and checksums either because cosign is not installed or explicitly skipped with ASDF_TENV_SKIP_VERIFY"
	fi

	(
		mkdir -p "$install_path"
		cp -r "$ASDF_DOWNLOAD_PATH"/* "$install_path"

		local tool_cmd
		tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
		test -x "$install_path/$tool_cmd" || fail "Expected $install_path/$tool_cmd to be executable."

		echo "$TOOL_NAME $version installation was successful!"
		rm "$(get_release_file)"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing ${TOOL_NAME} ${version}."
	)
}

verify() {
	echo "TBD"
	# TODO
	#	local -r version="${1}"
	#	local -r download_path="${2}"
	#	local -r checksum_file="${TOOL_BIN_NAME}_${version}_checksums.txt"
	#
	#	baseURL="${GH_REPO}/releases/download/v${version}"
	#	local files=("$checksum_file")
}
