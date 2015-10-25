get_mail() {
FILE="/home/ubuntu/Dragonbot/mail/got.mail."
RECIEVER=$2
[ $SENDER == $RECIEVER ] && { MESS=${bashbotrecvfullline#*$RECIEVER} ;MESSAGE=${MESS#*$SENDER}} || MESSAGE=${bashbotrecvfullline#*$RECIEVER}
[ -f $FILE$RECIEVER ] && echo "To $RECIEVER from $SENDER $MESSAGE" >> $FILE$RECIEVER || echo "To $RECIEVER from $SENDER $MESSAGE" > $FILE$RECIEVER
}
filter '~mail ([^ ]+)' get_mail

check_mail() {
FILE="/home/ubuntu/Dragonbot/mail/got.mail."
lines=$(cat $FILE$SENDER | wc -l)
echo "$SENDER there is $lines letters waiting for you"
}
filter '~checkmail' check_mail

read_mail() {
FILE="/home/ubuntu/Dragonbot/mail/got.mail."
lines=$(cat $FILE$SENDER | wc -l)
if [ $lines -lt 4 ]; then
	if [ $lines != 0 ]; then
sed '1,4!d' $FILE$SENDER
sed -i '1,3d' $FILE$SENDER
	fi
else
sed '1,4!d' $FILE$SENDER
sed -i '1,4d' $FILE$SENDER
echo 'you have more mail'
fi
}
filter '~readmail' read_mail
