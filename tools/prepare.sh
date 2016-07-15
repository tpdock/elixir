#!/bin/bash

a=("1.3.0" "1.2.0" "1.1.1" "1.1.0")
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
