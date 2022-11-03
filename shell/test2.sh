lsof -i:7702|awk '{print $2}'
lsof -i:7701|awk '{print $2}'
if [ $? -eq 0 ]; then
		echo " success "
else
		echo "failed! "
		exit 1
fi