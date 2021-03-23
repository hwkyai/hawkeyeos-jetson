#!/bin/sh
#
# based on https://www.embeddeduse.com/2019/05/06/yocto-builds-with-crops-containers/
#

set -eu
[ "${DEBUG:=false}" = "true" ] && set -x

this_script=$0
crops=ubuntu-18.04
workdir=/workdir

print_usage() {
    cat <<HEREDOC
    usage: $(basename "${0}") <command> [<target>]

        commands
            shell           open a bitbake-ready bash shell in docker container.
            init            only initialize the build environment for <target>.
            build           build <target> in a docker container. (Default if no command given.)
            nativebuild     build <target> on host machine.

            help            print this help and exit.
HEREDOC
}

dockerinit() {
    docker run --rm -it --pull always \
        -v "${PWD}":${workdir} \
        -v "$DL_DIR":${workdir}/downloads \
        -e "DL_DIR=${workdir}/downloads" \
        -v "$SSTATE_DIR":${workdir}/sstate-cache \
        -e "SSTATE_DIR=${workdir}/sstate-cache" \
        -e "MACHINE=$MACHINE" \
        crops/poky:${crops} \
            --workdir=${workdir} \
            bash -c "${*}"
}

envsetup() {
    # remove hardcoded TEMPLATECONF to keep compat with
    # non-docker builds.
    find ./build*/conf -name "*templateconf*" -delete 2>/dev/null || true
    export TEMPLATECONF=${PWD}/layers/meta-hawkeye-jetson/conf/samples
    set +o nounset
    # shellcheck source=layers/poky/oe-init-build-env
    . ${workdir}/layers/poky/oe-init-build-env
}

build() {
    dockerinit "$this_script" nativebuild "${@:?}"
}

nativebuild() {
    envsetup
    bitbake "${@:?}"
}

_shell() {
    envsetup
    bash -i
}

BUILD_CACHE_DIR=${BUILD_CACHE_DIR:-$HOME/cache/bitbake}
DL_DIR="${BUILD_CACHE_DIR}/downloads"
SSTATE_DIR="${BUILD_CACHE_DIR}/sstate-cache"
mkdir -p "$DL_DIR" "$SSTATE_DIR"

shell() {
    dockerinit "$this_script" _shell
}

_init() {
    envsetup
}

init() {
    dockerinit "$this_script" _init
}

if echo "${1:-}" | grep -q -- "-h\|help\|usage"; then
    print_usage
    exit 0
fi

if echo "${1:-}" | grep -q -- "shell\|init\|build\|nativebuild"; then
    "$@"
else
    build "$@"
fi
