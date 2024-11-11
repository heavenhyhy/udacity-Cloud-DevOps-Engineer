
FROM public.ecr.aws/docker/library/python:3.9.20-bullseye

WORKDIR /analytics
COPY ./ /analytics
RUN pip install --no-cache-dir -r /analytics/requirements.txt

EXPOSE 5153
EXPOSE 5000

CMD python app.py
