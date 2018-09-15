#!/bin/bash

usage()
{
}

main()
{
file=$1; shift

cat <<EOF >$file

#!/bin/bash

usage()
{
}

main()
{
}

main $@

EOF
}

main $@
