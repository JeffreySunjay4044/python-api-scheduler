FROM public.ecr.aws/lambda/python:3.9

COPY ./Pipfile ./Pipfile
COPY ./Pipfile.lock ./Pipfile.lock

RUN pip3 install pipenv
RUN pip install --upgrade pip
RUN set -ex && pipenv install --deploy --system

COPY ./   ./

CMD ["main.schedule_api"]