while 
	[ -n "$1" ]

do
	case "$1" in
	

	-b) 
		echo "you have installed $2 "
		shift
		;;

	-t) 
		echo "Version you installed is $2"
		shift
		;;
	*)
		echo "Option $1 is not recognized"
		exit 1
		;;
	esac
	shift
done



