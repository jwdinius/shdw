#
# scm_breeze.sh must be sourced, and not executed in a sub-shell.
# e.g "source ~/.scm_breeze/scm_breeze.sh"
# ------------------------------------------------------------
export scmbDir="$SHDWDIR/scm_breeze"

# Load config
[ -s "$SHDWDIR/rc/scmbrc" ] && . "$SHDWDIR/rc/scmbrc"

# Shared functions
source "$scmbDir/lib/scm_breeze.sh"
# Design assets management
source "$scmbDir/lib/design.sh"

# Git
# ------------------------------------------------------------
if [[ -s "$SHDWDIR/rc/git.scmbrc" ]]; then
  # Load git config
  source "$SHDWDIR/rc/git.scmbrc"
  source "$scmbDir/lib/git/helpers.sh"
  source "$scmbDir/lib/git/aliases.sh"
  source "$scmbDir/lib/git/keybindings.sh"
  source "$scmbDir/lib/git/status_shortcuts.sh"
  source "$scmbDir/lib/git/branch_shortcuts.sh"
  source "$scmbDir/lib/git/shell_shortcuts.sh"
  source "$scmbDir/lib/git/repo_index.sh"
  source "$scmbDir/lib/git/tools.sh"

  if ! type ruby > /dev/null 2>&1; then
    # If Ruby is not installed, fall back to the
    # slower bash/zsh implementation of 'git_status_shortcuts'
    source "$scmbDir/lib/git/fallback/status_shortcuts_shell.sh"
  fi
fi

