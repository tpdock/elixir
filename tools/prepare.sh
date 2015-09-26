#!/bin/bash

a=("1.1.0 1.1.0-rc.0 1.1.0-beta 1.1.0-dev 1.0.5" "1.0.4" "1.0.3" "1.0.2" "1.0.1")
for v in "${a[@]}"
do
#echo "alias elixir-$v='source /usr/lib/elixir/$v/activate'" >> /root/.bash_aliases
echo "source /usr/lib/elixir/$v/activate" > /usr/bin/elixir-$v -s; chmod +x /usr/bin/elixir-$v
cat > "/usr/lib/elixir/$v/activate" <<- EOF
if [ -n "$_ELIXIR_PATH_REMOVABLE" ]; then
    PATH=\${PATH//\${_ELIXIR_PATH_REMOVABLE}:/}
    export PATH
    unset _ELIXIR_PATH_REMOVABLE
fi
_ELIXIR_PATH_REMOVABLE="/usr/lib/elixir/$v/bin"
PATH="\${_ELIXIR_PATH_REMOVABLE}:\$PATH"
export PATH _ELIXIR_PATH_REMOVABLE
EOF
done
