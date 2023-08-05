#!/bin/bash/env bash

#
# Filename:       installer.bash
# Description:    Installs audio-loopback service.
# Author(s):      Alex Portell <github.com/portellam>
# Maintainer(s):  Alex Portell <github.com/portellam>
#

# <functions>
  function main
  {
    local -r pass_prefix="Success:"
    local -r error_prefix="An error occurred:"
    local -r fail_prefix="Failure:"

    is_user_superuser || return 1

    local -r source_file="audio-loopback-user.service"
    local -r target_file="/etc/systemd/system/${source_file}"
    local do_install=false
    local do_uninstall=false

    usage "$@" || return 1

    if "${do_install}"; then
      if ! install; then
        echo -e "${fail_prefix} Could not install audio-loopback."
        return 1
      fi

      echo -e "${pass_prefix} Installed audio-loopback."
    fi

    if "${do_uninstall}"; then
      if ! uninstall; then
        echo -e "${fail_prefix} Could not uninstall audio-loopback."
        return 1
      fi

      echo -e "${pass_prefix} Uninstalled audio-loopback."
    fi
  }

  function disable_service
  {
    systemctl stop "${source_file}" || return 1
    systemctl disable "${source_file}" || return 1
  }

  function enable_service
  {
    systemctl start "${source_file}" || return 1
    systemctl enable "${source_file}" || return 1
  }

  function install
  {
    if [[ ! -e "${source_file}" ]]; then
      echo -e "${error_prefix} File not found."
      return 1
    fi

    if ! cp --force "${source_file}" "${target_file}" &> /dev/null; then
      echo -e "${error_prefix} Failed to copy source file to target."
      return 1
    fi

    update_systemd || return 1
    enable_service
  }

  function is_user_superuser
  {
    if [[ "${USER}" != "root" ]]; then
      echo -e "${error_prefix} Installer must be run as sudo or root."
      return 1
    fi
  }

  function print_help
  {
    echo -e "Usage:\tbash $0 [OPTION]"
    echo -e "Linux systemd service to start/stop an audio loopback device."
    echo -e "  -h, --help\t\tPrint this help and exit."
    echo -e "  -i, --install\t\tInstall service."
    echo -e "  -u, --uninstall\tUninstall service."
  }

  function uninstall
  {
    if [[ ! -e "${target_file}" ]]; then
      return 0
    fi

    disable_service || return 1

    if ! rm --force "${target_file}" &> /dev/null; then
      echo -e "${error_prefix} Failed to delete target file."
      return 1
    fi

    update_systemd
  }

  function update_systemd
  {
    systemctl daemon-reload
  }

  function usage
  {
    case "${1}" in
      "-u" | "--uninstall" )
        do_uninstall=true
        return 0 ;;

      "-i" | "--install" | "" )
        do_install=true
        return 0 ;;

      "-h" | "--help" )
        print_help
        return 1 ;;
    esac

    if [[ "${2}" != "" ]] \
      || [[ "${1}" != "" ]]; then
      echo -e "${error_prefix} Invalid option."
      return 1
    fi
  }
# </functions>

# <code>
  main "$@"
  exit "${?}"
# </code