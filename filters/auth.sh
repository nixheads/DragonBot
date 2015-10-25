say_auth() {
AUTHED
if [ $AuthedOnBot == "Yes" ]; then
	echo "access granted"

	if [ $2 == "JOIN" ]; then
		send "JOIN $3"
	fi
	else
	echo "you suck"
fi
}
ident(){
AUTHED
[ $AuthedOnBot == "Yes" ] && {MSG="identify passwd" ; send "PRIVMSG NickServ :$MSG"}
}
filter '~IDENTIFY passwd' ident
filter '~auth ([^ ]+) ([^ ]+)' say_auth
