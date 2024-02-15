#!/usr/bin/env bash

#curl cht.sh/{language}/query+string
#curl cht.sh/{core-util}~{operation}
#curl cht.sh/golang/slice
#

languages=$(echo "golang lua cpp c typescript nodejs java python" | tr ' ' '\n')
core_utils=$(echo "xargs find mv sed awk" | tr ' ' '\n')

selected=$(printf "$languages\n$core_utils" | fzf)

read -p "query: " query
if echo $languages | grep -qs $selected; then
	echo "hello"
	tmux neww bash -c "curl cht.sh/$selected/$(echo $query | tr ' ' '+') &
	while [ : ]; do sleep 1; done"
else
	tmux neww bash -c "curl cht.sh/$selected~$query &
	while [ : ]; do sleep 1; done"
fi
