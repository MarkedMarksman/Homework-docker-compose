FROM python:3.10

COPY . /docker_homework_3

COPY ./requirements.txt /docker_homework_3/requirements.txt
RUN pip3 install --no-cache-dir --upgrade -r /docker_homework_3/requirements.txt 

EXPOSE 8000
WORKDIR docker_homework_3

RUN python manage.py migrate
RUN python manage.py collectstatic --noinput 

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "--workers", "3", "stocks_products.wsgi:application"]