case $1 in
  "greetings-db") echo 8080 ;;
  "greetings-service") echo 8081 ;;
  "gateway") echo 8082 ;;
	*) echo "INVALID_SERVICE_ID"
     exit 1;;
esac
