FROM python:3.13-slim
CMD ["sh", "-c", "echo 'Client starting...' && sleep 2 && wget -q -O - http://web:8000 && echo 'Successfully connected to web service!'"]
