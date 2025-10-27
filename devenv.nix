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
  packages = with pkgs; [git];

  # https://devenv.sh/languages/
  languages = {
    ruby.enable = true;
    ruby.bundler.enable = true;
  };
  scripts.menu.exec = ''
    echo
    echo "DATADRIVET DOCS"
    echo -e '> \033[32mmenu\033[0m - print this menu'
    echo
    echo 'Available Commands'
    echo -e '> \033[32mbuild\033[0m - builds the develpoment server'
    echo -e '> \033[32mserve\033[0m - start the development server'
    echo
    echo 'ENVIRONMENT VARIABLES'
  '';
  scripts.serve.exec = ''
    bundle exec jekyll serve --host 0.0.0.0 --port 4000
  '';
  scripts.build.exec = ''bundle exec jekyll build'';

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

  # See full reference at https://devenv.sh/reference/options/
}
