service supervisor start &&
    supervisorctl reread &&
    supervisorctl update &&
    supervisorctl start all && tail -F /var/log/supervisor/supervisord.log
