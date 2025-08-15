{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/packages/
  packages = with pkgs; [git pre-commit commitizen];

  # https://devenv.sh/languages/
  languages = {
    ruby.enable = true;
    ruby.bundler.enable = true;
  };
  scripts.serve.exec = ''
    bundle exec jekyll serve --host 0.0.0.0 --port 4000
  '';
  scripts.build-jekyll.exec = ''bundle exec jekyll build'';
  scripts.setup-hooks.exec = ''
    echo -e "\033[33mSetting up pre-commit hooks...\033[0m"
    pre-commit install
    pre-commit install --hook-type commit-msg
    echo -e "\033[32mPre-commit hooks installed successfully!\033[0m"
  '';

  enterShell = ''
    build-jekyll
    # Setup pre-commit hooks
    if [ ! -f .git/hooks/pre-commit ] || [ ! -f .git/hooks/commit-msg ]; then
     setup-hooks
    else
      echo -e "\033[32mPre-commit hooks already installed ✓\033[0m"
    fi
  '';

  # https://devenv.sh/tasks/
  # tasks = {
  #   "myproj:setup".exec = "mytool build";
  #   "devenv:enterShell".after = [ "myproj:setup" ];
  # };

  # https://devenv.sh/tests/
  enterTest = ''
    echo "Running tests"
    git --version | grep --color=auto "${pkgs.git.version}"
  '';

  # https://devenv.sh/git-hooks/
  # git-hooks.hooks.shellcheck.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
