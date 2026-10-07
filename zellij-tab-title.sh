zellij_tab_title_current_dir() {
  local current_dir=$PWD
  if [[ $current_dir == "$HOME" ]]; then
    current_dir="~"
  else
    current_dir=${current_dir##*/}
  fi

  printf '%s' "$current_dir"
}

zellij_tab_title_rename() {
  command nohup zellij action rename-tab "$1" >/dev/null 2>&1
}

zellij_tab_title_set_working_dir() {
  zellij_tab_title_rename "$(zellij_tab_title_current_dir)"
}

zellij_tab_title_preexec() {
  local cmdline=$1
  local command=${cmdline#"${cmdline%%[![:space:]]*}"}
  command=${command%%[[:space:]]*}

  [[ -n $command ]] && zellij_tab_title_rename "$command"
}

if [[ -n $ZELLIJ ]]; then
  case ";${PROMPT_COMMAND-};" in
  *";zellij_tab_title_set_working_dir;"*) ;;
  *) PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }zellij_tab_title_set_working_dir" ;;
  esac

  trap '[[ $BASH_COMMAND == zellij_tab_title_set_working_dir ]] || zellij_tab_title_preexec "$BASH_COMMAND"' DEBUG
fi
