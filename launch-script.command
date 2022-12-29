SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
APP_NAME="system-clipboard-events-notifications"
lsappinfo setinfo --name $APP_NAME
echo $$
echo $0
if [[ `pgrep -f $0` != "$$" ]]; then
        echo "Another instance of shell already exist! Exiting"
        exit
fi
cd $SCRIPT_DIR
nohup bash -c "exec -a ${APP_NAME} deno run --allow-run index.js &" &
echo $$
exit 0