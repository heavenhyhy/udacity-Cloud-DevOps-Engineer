
FROM public.ecr.aws/docker/library/python:3.9.20-bullseye

WORKDIR /analytics
COPY /analytics/ /analytics
RUN pip install --no-cache-dir -r /analytics/requirements.txt

EXPOSE 5153

CMD ["python", "analytics/app.py"]
CMD python app.py
