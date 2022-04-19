#! /bin/bash 
###########################################
#
###########################################

# constants
baseDir=$(cd `dirname "$0"`;pwd)
export PYTHONUNBUFFERED=1
export PATH=/opt/miniconda3/envs/venv-py3/bin:$PATH

# functions

function  t() {
    if [ $# -gt 0 ]; then
      cd $baseDir/../test
      echo "test<<" $1
      set -x
      python `pwd`/test.py MarkdownPPTests.$1
      if [ ! $? -eq 0 ]; then
          set +x
          echo "python `pwd`/test.py MarkdownPPTests.$1"
          echo "test Failure>>" $1
          exit 1
      fi
      set +x
    else
      echo "No testcase"
    fi
}

# main 
[ -z "${BASH_SOURCE[0]}" -o "${BASH_SOURCE[0]}" = "$0" ] || return
if [ ! -d $baseDir/tmp ]; then
  mkdir $baseDir/tmp
fi

## tests
t test_include
t test_include_glob
t test_empty_glob_should_not_lead_to_index_errors
t test_include_glob_recursive_relative_path
t test_include_url
t test_youtube
t test_toc
t test_toc_with_code_block
t test_reference
t test_latexrender
t test_include_shift
t test_include_code
t test_include_code_lines
t test_include_code_multiline_1
t test_include_code_multiline_2
t test_include_code_multiline_3
t test_include_code_lang
t test_include_code_lang_with_multiline
#t test_file
t test_script
t test_toc_table_figure
