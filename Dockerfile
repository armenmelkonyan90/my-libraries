FROM ubuntu
RUN apt-get update
RUN apt-get -y install python3-pip
RUN pip3 install flask
WORKDIR /app
COPY . .
CMD ["export", "FLASK_APP=app.py"]
CMD ["export", "FLASK_ENV=development"]
CMD ["export", "FLASK_DEBUG=0"]
CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]
