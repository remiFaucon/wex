#!/usr/bin/env bash
# @file Contains all needed scripts for wexample
# to get a run given script.

WEX_DIR_CURRENT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

wexampleIntro() {
  RED='\033[1;91m'
  WHITE='\033[0;30m'
  NC='\033[0m'

  # Continued from above example
  echo -e "${RED}"

  echo "                        .";
  echo "                   .-=======-.";
  echo "               .-=======+=======-.";
  echo "           .-===========++==========-.";
  echo "        .-==========!|==+++|!==========-.";
  echo "        |++=======?  |==!++|  ?=========|";
  echo "        |++++==|     |?   ^|     |======|";
  echo "        |++++++|                 |======|";
  echo "        |++++++|                 |======|";
  echo "        |++++++|                 |======|";
  echo "        |++++++++ _    _!_    _ ========|";
  echo "        ?-+++++++++++.=====.===========-?";
  echo "           ?-+++++++++++============-?";
  echo "               ?-++++++++=======-?";
  echo "                   ?-++++===-?";
  echo "                        +";

  echo -e "${NC}";

  echo "                                          _";
  echo "                                         | |";
  echo "  __      _______  ____ _ _ __ ___  _ __ | | ___";
  echo "  \ \ /\ / / _ \ \/ / _\` | '_ \` _ \| '_ \| |/ _ \\";
  echo "   \ V  V /  __/>  < (_| | | | | | | |_) | |  __/";
  echo "    \_/\_/ \___/_/\_\__,_|_| |_| |_| .__/|_|\___|";
  echo "     http://network.wexample.com   | |";
  echo "     # Scripts recipe              |_|";

  # Extra message is set.
  if [ ! -z "${1+x}" ]; then
    echo "       ~> ${1}";
  fi;
}

wexampleRun() {
  WEX_SHOW_INTRO=false
  WEX_SCRIPT_NAME=false

  # Manage arguments
  # https://stackoverflow.com/a/14203146/2057976
  for i in "$@"
  do
    case $i in
        -i|--intro)
        WEX_SHOW_INTRO=true
        shift # past argument
        ;;
        -s=*|--script=*)
        WEX_SCRIPT_NAME="${i#*=}"
        shift # past argument
        ;;
    esac
  done

  # Check is script is provided.
  if [ "${WEX_SCRIPT_NAME}" = false ]; then
    echo "You should use a script name, use -s or --script, and provide an existing name.";
    exit 1;
  fi;

  if [ "${WEX_SHOW_INTRO}" = true ]; then
    wexampleIntro "${WEX_SCRIPT_NAME}()";
  fi;

  WEX_SCRIPT_FILE="${WEX_DIR_CURRENT}/${WEX_SCRIPT_NAME}.sh"

  if [ ! -f ${WEX_SCRIPT_FILE} ]; then
      # TODO Load remote if not exists.
      echo "Script not found ${WEX_SCRIPT_FILE}"
  fi
  # Include loaded file
  . "${WEX_SCRIPT_FILE}"
  # Execute function with all parameters.
  ${WEX_SCRIPT_NAME} $*
}


